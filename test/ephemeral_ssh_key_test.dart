import 'dart:typed_data';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/ssh/ephemeral_ssh_key.dart';

/// The identity of the SSH client that opens the tunnel to the sharing
/// service.
///
/// The service does not check it: the account is the anonymous one. It is
/// generated anyway, for the process that uses it, because a key in the source
/// is a key everybody has.
void main() {
  group('the SSH identity of the tunnel', () {
    test('is a key the SSH client can use', () async {
      final pem = await EphemeralSshKey.generatePem();

      final keys = SSHKeyPair.fromPem(pem);

      expect(keys, hasLength(1));
      expect(keys.first.type, 'ssh-ed25519');
    });

    test('signs with the key it was generated with', () async {
      final pem = await EphemeralSshKey.generatePem();
      final key = SSHKeyPair.fromPem(pem).first;

      final signature = key.sign(Uint8List.fromList([1, 2, 3]));

      expect(signature, isNotNull);
    });

    test('is new for every process', () async {
      final first = await EphemeralSshKey.generatePem();
      final second = await EphemeralSshKey.generatePem();

      expect(first, isNot(second));
    });
  });
}
