import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;
import '../core/vault/vault_file.dart';
import '../core/vault/vault_password.dart';
import 'package:archive/archive.dart';

class VaultFileRecord {
  final String id;
  final String originalName;
  final String originalPath;
  final String scrambledPath;
  final int size;
  final String lockedAt;
  final bool isInPlace;
  final bool isFolder;

  VaultFileRecord({
    required this.id,
    required this.originalName,
    required this.originalPath,
    required this.scrambledPath,
    required this.size,
    required this.lockedAt,
    required this.isInPlace,
    this.isFolder = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'originalName': originalName,
    'originalPath': originalPath,
    'scrambledPath': scrambledPath,
    'size': size,
    'lockedAt': lockedAt,
    'isInPlace': isInPlace,
    'isFolder': isFolder,
  };

  factory VaultFileRecord.fromJson(Map<String, dynamic> json) => VaultFileRecord(
    id: json['id'] as String,
    originalName: json['originalName'] as String,
    originalPath: json['originalPath'] as String,
    scrambledPath: json['scrambledPath'] as String,
    size: json['size'] as int,
    lockedAt: json['lockedAt'] as String,
    isInPlace: json['isInPlace'] as bool,
    isFolder: json['isFolder'] as bool? ?? false,
  );
}

class VaultService {

  // Hashing and Password Management
  static Future<bool> isPasswordSet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('vault_password_hash');
  }

  static Future<void> setPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    final derived = await VaultPassword.derive(password);
    await prefs.setString('vault_salt', derived.salt);
    await prefs.setString('vault_password_hash', derived.verifier);
  }

  static Future<bool> verifyPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    final salt = prefs.getString('vault_salt');
    final verifier = prefs.getString('vault_password_hash');
    if (salt == null || verifier == null) return false;

    if (VaultPassword.isLegacy(verifier)) {
      // The old verifier: one SHA-256 over the password and the salt. When the
      // password turns out to be right, the verifier is replaced with one that
      // is hard to break.
      if (!VaultPassword.verifyLegacy(
        password: password,
        verifier: verifier,
        salt: salt,
      )) {
        return false;
      }
      await setPassword(password);
      return true;
    }

    return VaultPassword.verify(
      password: password,
      verifier: verifier,
      salt: salt,
    );
  }

  // Get Vault Directory
  static Future<Directory> getVaultDir() async {
    final docDir = await getApplicationDocumentsDirectory();
    final vaultDir = Directory(p.join(docDir.path, 'vault'));
    if (!await vaultDir.exists()) {
      await vaultDir.create(recursive: true);
    }
    return vaultDir;
  }

  // Get Metadata JSON File path
  static Future<File> getMetadataFile() async {
    final vaultDir = await getVaultDir();
    return File(p.join(vaultDir.path, 'metadata.json'));
  }

  // Load locked file records
  //
  // The records say what the locked files were: their names, where they came
  // from. That is what the vault hides, so the records are sealed with the
  // password as well. The old version kept them in cleartext, and they are
  // still read.
  static Future<List<VaultFileRecord>> loadRecords(String password) async {
    final file = await getMetadataFile();
    if (!await file.exists()) return [];
    try {
      final bytes = await file.readAsBytes();

      final opened = await VaultFile.open(bytes, password);
      if (opened != null) {
        return _recordsFrom(utf8.decode(opened.content));
      }

      // The old version kept the records in cleartext.
      return _recordsFrom(utf8.decode(bytes));
    } catch (_) {
      return [];
    }
  }

  static List<VaultFileRecord> _recordsFrom(String json) {
    final list = jsonDecode(json) as List;
    return list
        .map((e) => VaultFileRecord.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // Save locked file records
  static Future<void> saveRecords(
    List<VaultFileRecord> records,
    String password,
  ) async {
    final file = await getMetadataFile();
    final sealed = await VaultFile.seal(
      metadata: const {'kind': 'records'},
      content: utf8.encode(jsonEncode(records.map((e) => e.toJson()).toList())),
      password: password,
    );
    await file.writeAsBytes(sealed);
  }

  // Locks and obfuscates a file
  static Future<VaultFileRecord> lockFile({
    required File file,
    required String password,
    required bool inPlace,
    String? customName,
    String? customPath,
    bool isFolder = false,
  }) async {
    if (!await file.exists()) {
      throw Exception('File does not exist: ${file.path}');
    }

    final originalPath = customPath ?? file.path;
    final originalName = customName ?? p.basename(originalPath);
    final size = await file.length();
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    // Determine target scrambled path
    String scrambledPath;
    if (inPlace) {
      // Scramble in the same directory, starting with a dot (hidden on Linux/Android)
      final dir = isFolder ? originalPath : p.dirname(originalPath);
      scrambledPath = p.join(dir, '.vault_$timestamp.nfv');
    } else {
      // Isolate inside app's private documents vault folder
      final vaultDir = await getVaultDir();
      scrambledPath = p.join(vaultDir.path, 'vault_$timestamp.nfv');
    }

    // Read file bytes
    final fileBytes = await file.readAsBytes();

    // Build metadata payload
    final metadata = {
      'name': originalName,
      'path': originalPath,
      'size': size,
      'timestamp': timestamp,
      'isFolder': isFolder,
    };

    // Seal the metadata and the content together: nothing of the file is
    // readable, not the content and not the name of the file.
    final sealedBytes = await VaultFile.seal(
      metadata: metadata,
      content: fileBytes,
      password: password,
    );

    // Write to the scrambled target path
    final targetFile = File(scrambledPath);
    await targetFile.writeAsBytes(sealedBytes);

    // Clean up original file
    await file.delete();

    // Create record
    final record = VaultFileRecord(
      id: timestamp,
      originalName: originalName,
      originalPath: originalPath,
      scrambledPath: scrambledPath,
      size: size,
      lockedAt: DateTime.now().toIso8601String(),
      isInPlace: inPlace,
      isFolder: isFolder,
    );

    // Save record to metadata.json
    final records = await loadRecords(password);
    records.add(record);
    await saveRecords(records, password);

    return record;
  }

  // Unlocks and restores an obfuscated file
  static Future<File> unlockFile({
    required VaultFileRecord record,
    required String password,
  }) async {
    final scrambledFile = File(record.scrambledPath);
    if (!await scrambledFile.exists()) {
      throw Exception('Scrambled vault file not found: ${record.scrambledPath}');
    }

    final bytes = await scrambledFile.readAsBytes();

    // Open the file. A file the old version wrote is read as well, so that a
    // vault is not lost.
    final opened = await VaultFile.open(bytes, password);
    if (opened == null) {
      throw Exception('Incorrect password or corrupted file');
    }
    final originalBytes = opened.content;

    final originalFile = File(record.originalPath);

    if (record.isFolder) {
      // Reconstruct folder structure recursively
      final archive = ZipDecoder().decodeBytes(originalBytes);
      final destinationDir = p.dirname(record.originalPath);

      for (final file in archive) {
        final filename = file.name;
        final fullPath = p.join(destinationDir, filename);
        if (file.isFile) {
          final data = file.content as List<int>;
          final destFile = File(fullPath);
          await destFile.parent.create(recursive: true);
          await destFile.writeAsBytes(data);
        } else {
          await Directory(fullPath).create(recursive: true);
        }
      }
    } else {
      // Recreate original parent folder if deleted
      final originalDir = originalFile.parent;
      if (!await originalDir.exists()) {
        await originalDir.create(recursive: true);
      }

      // Write original bytes back to original path
      await originalFile.writeAsBytes(originalBytes);
    }

    // Clean up scrambled nfv file
    await scrambledFile.delete();

    // Remove record from metadata
    final records = await loadRecords(password);
    records.removeWhere((e) => e.id == record.id);
    await saveRecords(records, password);

    return originalFile;
  }

  // Locks and obfuscates a directory by zipping it recursively first
  static Future<VaultFileRecord> lockDirectory({
    required Directory directory,
    required String password,
    required bool inPlace,
  }) async {
    if (!await directory.exists()) {
      throw Exception('Directory does not exist: ${directory.path}');
    }

    final originalPath = directory.path;
    final originalName = p.basename(originalPath);

    // List all files recursively
    final list = directory.listSync(recursive: true);
    final archive = Archive();

    for (final entity in list) {
      if (entity is File) {
        // Calculate relative path from the parent of the directory being zipped
        // So that the zipped file path starts with the folder name itself (e.g. "myfolder/file.txt")
        final relPath = p.relative(entity.path, from: p.dirname(originalPath)).replaceAll('\\', '/');
        final bytes = await entity.readAsBytes();
        archive.addFile(ArchiveFile(relPath, bytes.length, bytes));
      }
    }

    // Encode the archive as a ZIP
    final zipEncoder = ZipEncoder();
    final zipBytes = zipEncoder.encode(archive);
    if (zipBytes == null) {
      throw Exception('Failed to zip directory contents');
    }

    // Write zip to a temporary file
    final tempDir = await getTemporaryDirectory();
    final tempZipFile = File(p.join(tempDir.path, 'temp_vault_zip_${DateTime.now().millisecondsSinceEpoch}.zip'));
    await tempZipFile.writeAsBytes(zipBytes);

    try {
      // Call lockFile on the temporary zip file, flag it as isFolder: true
      final record = await lockFile(
        file: tempZipFile,
        password: password,
        inPlace: inPlace,
        customName: originalName,
        customPath: originalPath,
        isFolder: true,
      );

      // Clean up original directory contents (or keep folder for in-place)
      if (inPlace) {
        final children = directory.listSync();
        for (final child in children) {
          if (child.path != record.scrambledPath) {
            await child.delete(recursive: true);
          }
        }
      } else {
        await directory.delete(recursive: true);
      }

      return record;
    } finally {
      // Always ensure the temporary zip is deleted
      if (await tempZipFile.exists()) {
        await tempZipFile.delete();
      }
    }
  }

  // Temporarily decrypts a vault file to cache directory for in-app viewing
  static Future<File> decryptTemporary({
    required VaultFileRecord record,
    required String password,
  }) async {
    final scrambledFile = File(record.scrambledPath);
    if (!await scrambledFile.exists()) {
      throw Exception('Scrambled vault file not found');
    }

    final bytes = await scrambledFile.readAsBytes();

    // Open the file. A file the old version wrote is read as well, so that a
    // vault is not lost.
    final opened = await VaultFile.open(bytes, password);
    if (opened == null) {
      throw Exception('Incorrect password or corrupted file');
    }
    final originalBytes = opened.content;

    // Write to a temporary file in cache directory
    final cacheDir = await getTemporaryDirectory();
    final extension = record.isFolder ? '.zip' : '';
    final tempFilePath = p.join(cacheDir.path, 'temp_vault_${record.id}_${record.originalName}$extension');
    final tempFile = File(tempFilePath);
    
    await tempFile.writeAsBytes(originalBytes);
    return tempFile;
  }
}
