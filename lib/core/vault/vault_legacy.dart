import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

/// The file the old version wrote.
///
/// It obfuscated the metadata and the first 8 KB of the content with a key
/// that came from the password alone, and it stored the rest of the content in
/// cleartext. It is read, so that a vault written by the old version is not
/// lost; nothing new is ever written in this format.
class LegacyVaultFile {
  const LegacyVaultFile._();

  /// The marker of a file in this format.
  static const String magic = 'NFILE_VAULT_V1';

  /// How many bytes of the content the old version obfuscated.
  static const int scrambleSize = 8192;

  /// The metadata and the content of a file the old version wrote, or null
  /// when the password is wrong or the file is damaged.
  static ({Map<String, dynamic> metadata, List<int> content})? open(
    List<int> bytes,
    String password,
  ) {
    if (bytes.length < magic.length + 4) return null;
    if (!_hasMagic(bytes, magic)) return null;

    final metadataLength = _uint32(bytes, magic.length);
    final metadataStart = magic.length + 4;
    final metadataEnd = metadataStart + metadataLength;
    if (bytes.length < metadataEnd) return null;

    final metadataBytes = _xor(
      bytes.sublist(metadataStart, metadataEnd),
      _deriveKey(password, metadataLength),
    );

    Map<String, dynamic> metadata;
    try {
      metadata = jsonDecode(utf8.decode(metadataBytes)) as Map<String, dynamic>;
    } catch (_) {
      // The password is wrong: the metadata is not JSON.
      return null;
    }

    final size = metadata['size'];
    if (size is! int) return null;

    final head = size < scrambleSize ? size : scrambleSize;
    if (bytes.length < metadataEnd + head) return null;

    final content = BytesBuilder()
      ..add(
        _xor(
          bytes.sublist(metadataEnd, metadataEnd + head),
          _deriveKey(password, head),
        ),
      )
      ..add(bytes.sublist(metadataEnd + head));

    return (metadata: metadata, content: content.toBytes());
  }

  /// The key the old version used: the hash of the password, repeating.
  static List<int> _deriveKey(String password, int length) {
    final hash = sha256.convert(utf8.encode(password)).bytes;
    return List<int>.generate(
      length,
      (i) => hash[i % hash.length] ^ (i & 0xFF),
    );
  }

  static List<int> _xor(List<int> bytes, List<int> key) {
    return List<int>.generate(
      bytes.length,
      (i) => bytes[i] ^ key[i % key.length],
    );
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
}
