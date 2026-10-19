import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import 'vault_legacy.dart';

/// A locked file: the metadata and the content, sealed with a password.
///
/// The content and the metadata are sealed together with ChaCha20-Poly1305,
/// and the key is derived from the password with Argon2id over a salt that is
/// random for every file. Nothing of the file is readable: not the content,
/// not the name of the file, not where it came from.
///
/// The old version of the vault obfuscated the first 8 KB of the file and
/// stored the rest in cleartext. A file it wrote is still read, so that a
/// vault is not lost; nothing new is ever written that way.
class VaultFile {
  const VaultFile._();

  /// The marker of a file in this format.
  static const String magic = 'NFILE_VAULT_V2';

  /// The length of the salt of the key derivation.
  static const int saltLength = 16;

  /// The length of the nonce of the cipher.
  static const int nonceLength = 12;

  /// The length of the tag the cipher adds to what it seals.
  static const int tagLength = 16;

  /// How much memory the key derivation uses, in kibibytes.
  static const int derivationMemory = 19 * 1024;

  /// How many times the key derivation goes over the memory.
  static const int derivationIterations = 3;

  /// Seals [metadata] and [content] with [password].
  static Future<List<int>> seal({
    required Map<String, dynamic> metadata,
    required List<int> content,
    required String password,
  }) async {
    final random = Random.secure();
    final salt = _randomBytes(random, saltLength);
    final nonce = _randomBytes(random, nonceLength);

    final key = await _deriveKey(password, salt);
    final metadataBytes = utf8.encode(jsonEncode(metadata));

    final plain = BytesBuilder()
      ..add(_uint32Bytes(metadataBytes.length))
      ..add(metadataBytes)
      ..add(content);

    final sealed = await _cipher.encrypt(
      plain.takeBytes(),
      secretKey: key,
      nonce: nonce,
    );

    final out = BytesBuilder()
      ..add(utf8.encode(magic))
      ..add(salt)
      ..add(nonce)
      ..add(sealed.cipherText)
      ..add(sealed.mac.bytes);
    return out.toBytes();
  }

  /// Opens a sealed file: the metadata and the content it holds.
  ///
  /// Returns null when the password is wrong, when the file was changed, or
  /// when it is not a file of this vault.
  static Future<OpenedVaultFile?> open(
    List<int> bytes,
    String password,
  ) async {
    if (_hasMagic(bytes, LegacyVaultFile.magic)) {
      final legacy = LegacyVaultFile.open(bytes, password);
      if (legacy == null) return null;
      return OpenedVaultFile(
        metadata: legacy.metadata,
        content: legacy.content,
      );
    }

    final header = magic.length + saltLength + nonceLength;
    if (!_hasMagic(bytes, magic)) return null;
    if (bytes.length < header + tagLength) return null;

    final salt = bytes.sublist(magic.length, magic.length + saltLength);
    final nonce = bytes.sublist(
      magic.length + saltLength,
      magic.length + saltLength + nonceLength,
    );
    final cipherText = bytes.sublist(header, bytes.length - tagLength);
    final tag = bytes.sublist(bytes.length - tagLength);

    final key = await _deriveKey(password, salt);

    List<int> plain;
    try {
      plain = await _cipher.decrypt(
        SecretBox(cipherText, nonce: nonce, mac: Mac(tag)),
        secretKey: key,
      );
    } catch (_) {
      // The password is wrong, or the file was changed.
      return null;
    }

    if (plain.length < 4) return null;
    final metadataLength = _uint32(plain, 0);
    if (plain.length < 4 + metadataLength) return null;

    Map<String, dynamic> metadata;
    try {
      metadata = jsonDecode(
        utf8.decode(plain.sublist(4, 4 + metadataLength)),
      ) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }

    return OpenedVaultFile(
      metadata: metadata,
      content: plain.sublist(4 + metadataLength),
    );
  }

  /// The key of the file: the password, stretched over the salt.
  static Future<SecretKey> _deriveKey(String password, List<int> salt) async {
    final kdf = Argon2id(
      parallelism: 1,
      memory: derivationMemory,
      iterations: derivationIterations,
      hashLength: 32,
    );
    return kdf.deriveKey(
      secretKey: SecretKey(utf8.encode(password)),
      nonce: salt,
    );
  }

  static final Chacha20 _cipher = Chacha20.poly1305Aead();

  static List<int> _randomBytes(Random random, int length) {
    return List<int>.generate(length, (_) => random.nextInt(256));
  }

  static bool _hasMagic(List<int> bytes, String magic) {
    if (bytes.length < magic.length) return false;
    for (var i = 0; i < magic.length; i++) {
      if (bytes[i] != magic.codeUnitAt(i)) return false;
    }
    return true;
  }

  static int _uint32(List<int> bytes, int offset) {
    return (bytes[offset] << 24) |
        (bytes[offset + 1] << 16) |
        (bytes[offset + 2] << 8) |
        bytes[offset + 3];
  }

  /// The four bytes of a length, as the format writes it.
  static List<int> _uint32Bytes(int value) {
    return [
      (value >> 24) & 0xFF,
      (value >> 16) & 0xFF,
      (value >> 8) & 0xFF,
      value & 0xFF,
    ];
  }
}

/// A locked file that was opened: what it says about the file, and the file
/// itself.
class OpenedVaultFile {
  /// What the file said about itself: its name, where it came from, how big it
  /// was.
  final Map<String, dynamic> metadata;

  /// The content of the file.
  final List<int> content;

  const OpenedVaultFile({required this.metadata, required this.content});
}
