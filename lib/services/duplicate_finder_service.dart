import 'dart:io';

import 'package:crypto/crypto.dart';

class DuplicateFinderService {
  /// Scan [rootPath]'s subtree and group files whose content is identical
  /// (by SHA-256). Only groups with 2+ files are returned.
  static Future<Map<String, List<String>>> findDuplicates(String rootPath) async {
    final groups = <String, List<String>>{};
    final dir = Directory(rootPath);
    if (!dir.existsSync()) return groups;

    List<FileSystemEntity> entities;
    try {
      entities = dir.listSync(recursive: true, followLinks: false);
    } catch (_) {
      return groups;
    }

    for (final entity in entities) {
      if (entity is! File) continue;
      final hash = await _hashFile(entity.path);
      if (hash == null) continue;
      groups.putIfAbsent(hash, () => []).add(entity.path);
    }

    groups.removeWhere((_, paths) => paths.length < 2);
    return groups;
  }

  static Future<String?> _hashFile(String path) async {
    try {
      final file = File(path);
      final digest = await sha256.bind(file.openRead()).first;
      return digest.toString();
    } catch (_) {
      return null;
    }
  }
}
