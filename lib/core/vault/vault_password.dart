import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:cryptography/cryptography.dart';

/// The verifier of the master password of the vault.
///
/// The old version kept one SHA-256 over the password and a salt. One SHA-256
/// is not a password hash: it is fast enough to try billions of candidates a
/// second on a GPU, and the salt it used was a timestamp, which is not a
/// secret.
///
/// The verifier is Argon2id over a random salt now. The comparison takes the
/// same time whether the password is right or wrong, so a wrong password
/// cannot be found by measuring.
///
/// The verifier of the old version is still read, so that an installation that
/// was set up before can be migrated: when the password turns out to be right,
/// the verifier is replaced with a new one.
class VaultPassword {
  const VaultPassword._();

  /// The marker of a verifier that was made with Argon2id.
  static const String algorithm = 'argon2id';

  /// How much memory the derivation uses, in kibibytes.
  static const int derivationMemory = 19 * 1024;

  /// How many times the derivation goes over the memory.
  static const int derivationIterations = 3;

  /// The length of the salt, in bytes.
  static const int saltLength = 16;

  /// The verifier of [password], and the salt it was made with.
  static Future<({String verifier, String salt})> derive(String password) async {
    final random = Random.secure();
    final salt = base64.encode(
      List<int>.generate(saltLength, (_) => random.nextInt(256)),
    );
    final verifier = await _derive(password, salt);
    return (verifier: '$algorithm:$verifier', salt: salt);
  }

  /// Whether [password] is the password behind [verifier] and [salt].
  static Future<bool> verify({
    required String password,
    required String verifier,
    required String salt,
  }) async {
    final expected = await _derive(password, salt);
    return _sameBytes(
      base64.decode(expected),
      base64.decode(_value(verifier)),
    );
  }

  /// Whether [verifier] was written by the old version.
  static bool isLegacy(String verifier) => !verifier.startsWith('$algorithm:');

  /// Whether [password] is the password behind the verifier the old version
  /// wrote: one SHA-256 over the password and the salt.
  static bool verifyLegacy({
    required String password,
    required String verifier,
    required String salt,
  }) {
    final hash = sha256.convert(utf8.encode(password + salt)).toString();
    return _sameBytes(utf8.encode(hash), utf8.encode(verifier));
  }

  /// The derived key, as base64.
  static Future<String> _derive(String password, String salt) async {
    final kdf = Argon2id(
      parallelism: 1,
      memory: derivationMemory,
      iterations: derivationIterations,
      hashLength: 32,
    );
    final key = await kdf.deriveKey(
      secretKey: SecretKey(utf8.encode(password)),
      nonce: utf8.encode(salt),
    );
    return base64.encode(await key.extractBytes());
  }

  /// The value of a verifier, without the marker of the algorithm.
  static String _value(String verifier) {
    final separator = verifier.indexOf(':');
    return separator < 0 ? verifier : verifier.substring(separator + 1);
  }

  /// Whether [a] and [b] are the same, without telling how long it took to
  /// find out.
  static bool _sameBytes(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    var difference = 0;
    for (var i = 0; i < a.length; i++) {
      difference |= a[i] ^ b[i];
    }
    return difference == 0;
  }
}
