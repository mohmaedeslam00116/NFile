import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

/// The identity of the SSH client that opens the tunnel to the sharing
/// service.
///
/// The service does not check the identity: the account is the anonymous one.
/// A key in the source is a key that everybody who has the source has, so the
/// key is generated here, for the process that uses it, and it is never written
/// down.
///
/// The format is the one the SSH client reads: the OpenSSH private key.
class EphemeralSshKey {
  const EphemeralSshKey._();

  /// A new ed25519 key, as the OpenSSH private key the SSH client reads.
  static Future<String> generatePem() async {
    final random = Random.secure();
    final seed = Uint8List(32);
    for (var i = 0; i < seed.length; i++) {
      seed[i] = random.nextInt(256);
    }

    final pair = await Ed25519().newKeyPairFromSeed(seed);
    final publicKey = Uint8List.fromList((await pair.extractPublicKey()).bytes);

    return _pem(_openSshKey(seed, publicKey));
  }

  /// The key in the OpenSSH format: the magic, the cipher, the key, and the
  /// private section that holds the key itself.
  static Uint8List _openSshKey(Uint8List seed, Uint8List publicKey) {
    final writer = _SshWriter()
      ..bytes(utf8.encode('openssh-key-v1'))
      ..uint8(0) // the terminator of the magic
      ..string(utf8.encode('none')) // the cipher: the key is not encrypted
      ..string(utf8.encode('none')) // the key derivation function: there is none
      ..string(const <int>[]) // its options
      ..uint32(1); // one key

    writer.string(
      (_SshWriter()
            ..string(utf8.encode('ssh-ed25519'))
            ..string(publicKey))
          .takeBytes(),
    );

    // The private section: the two check numbers, the key, and the key itself
    // (the seed and the public key, as the format asks for).
    final random = Random.secure();
    final check = random.nextInt(0xFFFFFFFF);
    final section = (_SshWriter()
          ..uint32(check)
          ..uint32(check)
          ..string(utf8.encode('ssh-ed25519'))
          ..string(publicKey)
          ..string(Uint8List.fromList([...seed, ...publicKey]))
          ..string(utf8.encode('nfile-tunnel')))
        .takeBytes();

    // The section is padded to a multiple of the block size of the cipher, and
    // the cipher is 'none': eight bytes.
    final padding = (8 - section.length % 8) % 8;
    final padded = Uint8List(section.length + padding);
    padded.setRange(0, section.length, section);
    for (var i = 0; i < padding; i++) {
      padded[section.length + i] = i + 1;
    }
    writer.string(padded);

    return writer.takeBytes();
  }

  /// The key as the PEM the SSH client reads.
  static String _pem(Uint8List content) {
    final body = base64.encode(content);
    final lines = <String>[];
    for (var i = 0; i < body.length; i += 70) {
      lines.add(body.substring(i, min(i + 70, body.length)));
    }
    return '-----BEGIN OPENSSH PRIVATE KEY-----\n'
        '${lines.join('\n')}\n'
        '-----END OPENSSH PRIVATE KEY-----\n';
  }
}

/// The bytes of the OpenSSH format: a string is a length and then the bytes.
class _SshWriter {
  final BytesBuilder _builder = BytesBuilder();

  void bytes(List<int> value) => _builder.add(value);

  void uint8(int value) => _builder.addByte(value);

  void uint32(int value) {
    _builder.add([
      (value >> 24) & 0xFF,
      (value >> 16) & 0xFF,
      (value >> 8) & 0xFF,
      value & 0xFF,
    ]);
  }

  void string(List<int> value) {
    uint32(value.length);
    _builder.add(value);
  }

  Uint8List takeBytes() => _builder.takeBytes();
}
