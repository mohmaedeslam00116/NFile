import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openfile/core/vault/vault_file.dart';

/// A locked file holds the metadata and the content, sealed with a password.
///
/// The old format obfuscated the first 8 KB of the file with a repeating key
/// and stored the rest in cleartext. The new format seals everything.
void main() {
  final password = 'correct horse battery staple';

  /// What the file says about itself. The old version always wrote the size.
  Map<String, dynamic> metadataOf(List<int> content) => {
        'name': 'secret.txt',
        'path': '/sdcard/secret.txt',
        'size': content.length,
      };

  /// The content of a file whose tail would be readable if only the head were
  /// sealed.
  List<int> contentWithAMarker() {
    final content = List<int>.generate(20000, (i) => (i * 7) % 256);
    final marker = utf8.encode('THE-MARKER-THAT-MUST-NOT-BE-PLAINTEXT');
    content.setRange(10000, 10000 + marker.length, marker);
    return content;
  }

  group('a locked file', () {
    test('holds the metadata and the content when it is opened', () async {
      final content = contentWithAMarker();

      final sealed = await VaultFile.seal(
        metadata: metadataOf(content),
        content: content,
        password: password,
      );
      final opened = await VaultFile.open(sealed, password);

      expect(opened, isNotNull);
      expect(opened!.metadata['name'], 'secret.txt');
      expect(opened.metadata['path'], '/sdcard/secret.txt');
      expect(opened.content, content);
    });

    test('is not the same bytes twice for the same content', () async {
      final content = contentWithAMarker();

      final first = await VaultFile.seal(
        metadata: metadataOf(content),
        content: content,
        password: password,
      );
      final second = await VaultFile.seal(
        metadata: metadataOf(content),
        content: content,
        password: password,
      );

      expect(first, isNot(second));
    });

    test('holds no plaintext of the content', () async {
      final content = contentWithAMarker();

      final sealed = await VaultFile.seal(
        metadata: metadataOf(content),
        content: content,
        password: password,
      );

      expect(
        _contains(sealed, utf8.encode('THE-MARKER-THAT-MUST-NOT-BE-PLAINTEXT')),
        isFalse,
        reason: 'The content is sealed, not only its first 8 KB.',
      );
    });

    test('holds no plaintext of the metadata', () async {
      final content = contentWithAMarker();
      final sealed = await VaultFile.seal(
        metadata: metadataOf(content),
        content: content,
        password: password,
      );

      expect(_contains(sealed, utf8.encode('secret.txt')), isFalse);
      expect(_contains(sealed, utf8.encode('/sdcard/secret.txt')), isFalse);
    });

    test('is opened with nothing but the right password', () async {
      final content = contentWithAMarker();
      final sealed = await VaultFile.seal(
        metadata: metadataOf(content),
        content: content,
        password: password,
      );

      expect(await VaultFile.open(sealed, 'another password'), isNull);
    });

    test('is refused when a byte of it was changed', () async {
      final content = contentWithAMarker();
      final sealed = await VaultFile.seal(
        metadata: metadataOf(content),
        content: content,
        password: password,
      );

      sealed[sealed.length - 1] = sealed[sealed.length - 1] ^ 0xFF;

      expect(await VaultFile.open(sealed, password), isNull);
    });
  });

  group('a file locked by the old version', () {
    test('is still opened', () async {
      final content = contentWithAMarker();

      final opened = await VaultFile.open(
        _legacyFile(metadata: metadataOf(content), content: content, password: password),
        password,
      );

      expect(opened, isNotNull);
      expect(opened!.metadata['name'], 'secret.txt');
      expect(opened.content, content);
    });

    test('is opened with nothing but the right password', () async {
      final content = contentWithAMarker();
      final legacy = _legacyFile(
        metadata: metadataOf(content),
        content: content,
        password: password,
      );

      expect(await VaultFile.open(legacy, 'another password'), isNull);
    });
  });
}

/// The file the old version wrote: the metadata and the first 8 KB of the
/// content obfuscated with a repeating key, and the rest in cleartext.
List<int> _legacyFile({
  required Map<String, dynamic> metadata,
  required List<int> content,
  required String password,
}) {
  const magic = 'NFILE_VAULT_V1';
  const scrambleSize = 8192;

  List<int> deriveKey(int length) {
    final hash = sha256.convert(utf8.encode(password)).bytes;
    return List<int>.generate(
      length,
      (i) => hash[i % hash.length] ^ (i & 0xFF),
    );
  }

  List<int> xor(List<int> bytes, List<int> key) {
    return List<int>.generate(
      bytes.length,
      (i) => bytes[i] ^ key[i % key.length],
    );
  }

  final metadataBytes = utf8.encode(jsonEncode(metadata));
  final scrambled = xor(metadataBytes, deriveKey(metadataBytes.length));

  final head = content.length < scrambleSize ? content.length : scrambleSize;
  final scrambledHead = xor(content.sublist(0, head), deriveKey(head));

  final out = BytesBuilder();
  out.add(utf8.encode(magic));
  out.add([
    (scrambled.length >> 24) & 0xFF,
    (scrambled.length >> 16) & 0xFF,
    (scrambled.length >> 8) & 0xFF,
    scrambled.length & 0xFF,
  ]);
  out.add(scrambled);
  out.add(scrambledHead);
  out.add(content.sublist(head));
  return out.toBytes();
}

/// Whether [needle] appears in [haystack].
bool _contains(List<int> haystack, List<int> needle) {
  if (needle.isEmpty || needle.length > haystack.length) return false;
  for (var i = 0; i <= haystack.length - needle.length; i++) {
    var same = true;
    for (var j = 0; j < needle.length; j++) {
      if (haystack[i + j] != needle[j]) {
        same = false;
        break;
      }
    }
    if (same) return true;
  }
  return false;
}
