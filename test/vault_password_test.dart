import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/vault/vault_password.dart';

/// The verifier of the master password of the vault.
///
/// The old version kept one SHA-256 over the password and a salt. One SHA-256
/// is not a password hash: it is fast enough to try billions of candidates a
/// second, and the salt it used was a timestamp.
void main() {
  group('the verifier of the master password', () {
    test('is not the SHA-256 of the password and the salt', () async {
      final derived = await VaultPassword.derive('the password');
      final legacy = sha256
          .convert(utf8.encode('the password'))
          .toString();

      expect(derived.verifier, isNot(legacy));
      expect(derived.verifier, isNot(contains('the password')));
    });

    test('accepts the right password', () async {
      final derived = await VaultPassword.derive('the password');

      expect(
        await VaultPassword.verify(
          password: 'the password',
          verifier: derived.verifier,
          salt: derived.salt,
        ),
        isTrue,
      );
    });

    test('refuses a wrong password', () async {
      final derived = await VaultPassword.derive('the password');

      expect(
        await VaultPassword.verify(
          password: 'another password',
          verifier: derived.verifier,
          salt: derived.salt,
        ),
        isFalse,
      );
    });

    test('uses a different salt every time', () async {
      final first = await VaultPassword.derive('the password');
      final second = await VaultPassword.derive('the password');

      expect(first.salt, isNot(second.salt));
      expect(first.verifier, isNot(second.verifier));
    });

    test('takes the same time for a right and a wrong password', () async {
      final derived = await VaultPassword.derive('the password');

      Future<int> measure(String password) async {
        final stopwatch = Stopwatch()..start();
        await VaultPassword.verify(
          password: password,
          verifier: derived.verifier,
          salt: derived.salt,
        );
        return stopwatch.elapsedMilliseconds;
      }

      // The first run is the slow one: the code is still cold.
      await measure('the password');
      await measure('another password');

      final right = <int>[];
      final wrong = <int>[];
      for (var i = 0; i < 3; i++) {
        right.add(await measure('the password'));
        wrong.add(await measure('another password'));
      }

      final rightTime = right.reduce((a, b) => a < b ? a : b);
      final wrongTime = wrong.reduce((a, b) => a < b ? a : b);

      expect(
        rightTime,
        lessThan(wrongTime * 3 + 200),
        reason: 'A wrong password must not be found faster than a right one.',
      );
    });
  });

  group('the verifier the old version wrote', () {
    final salt = '1750000000000000';
    final legacy = sha256.convert(utf8.encode('the password$salt')).toString();

    test('is told apart from the new one', () {
      expect(VaultPassword.isLegacy(legacy), isTrue);
      expect(VaultPassword.isLegacy('argon2id:abc'), isFalse);
    });

    test('is still verified', () {
      expect(
        VaultPassword.verifyLegacy(
          password: 'the password',
          verifier: legacy,
          salt: salt,
        ),
        isTrue,
      );
      expect(
        VaultPassword.verifyLegacy(
          password: 'another password',
          verifier: legacy,
          salt: salt,
        ),
        isFalse,
      );
    });
  });
}
