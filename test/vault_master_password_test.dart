import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/services/vault_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The master password of the vault is kept behind a verifier.
///
/// The old version kept one SHA-256 over the password and a salt, and the salt
/// was a timestamp. An installation that was set up before has to keep working,
/// and it is migrated the first time the password is verified.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('the master password of the vault', () {
    test('is kept behind Argon2id, not behind one SHA-256', () async {
      SharedPreferences.setMockInitialValues({});
      await VaultService.setPassword('the password');

      final prefs = await SharedPreferences.getInstance();
      final verifier = prefs.getString('vault_password_hash')!;
      final salt = prefs.getString('vault_salt')!;

      expect(verifier, startsWith('argon2id:'));
      expect(
        verifier,
        isNot(sha256.convert(utf8.encode('the password$salt')).toString()),
      );
    });

    test('is verified', () async {
      SharedPreferences.setMockInitialValues({});
      await VaultService.setPassword('the password');

      expect(await VaultService.verifyPassword('the password'), isTrue);
      expect(await VaultService.verifyPassword('another password'), isFalse);
    });

    test('the one the old version kept is migrated', () async {
      final salt = '1750000000000000';
      final legacy =
          sha256.convert(utf8.encode('the password$salt')).toString();
      SharedPreferences.setMockInitialValues({
        'vault_salt': salt,
        'vault_password_hash': legacy,
      });

      expect(await VaultService.verifyPassword('the password'), isTrue);

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('vault_password_hash'), isNot(legacy));
      expect(prefs.getString('vault_password_hash'), startsWith('argon2id:'));

      // The migrated verifier opens the vault, and refuses a wrong password.
      expect(await VaultService.verifyPassword('the password'), isTrue);
      expect(await VaultService.verifyPassword('another password'), isFalse);
    });

    test('the old verifier is left alone when the password is wrong', () async {
      final salt = '1750000000000000';
      final legacy =
          sha256.convert(utf8.encode('the password$salt')).toString();
      SharedPreferences.setMockInitialValues({
        'vault_salt': salt,
        'vault_password_hash': legacy,
      });

      expect(await VaultService.verifyPassword('another password'), isFalse);

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('vault_password_hash'), legacy);
    });
  });
}
