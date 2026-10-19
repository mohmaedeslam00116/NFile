import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// A private key in the source is a secret that has been published.
///
/// The application used to hold one: the identity of the SSH client that opens
/// the tunnel to the sharing service. It is generated now, for the process that
/// uses it, and the source holds no key material at all.
///
/// The pattern looks for a complete PEM block whose body is base64, so the
/// header and the footer of the format are not mistaken for a key.
void main() {
  test('the source holds no private key', () {
    final privateKey = RegExp(
      r'-----BEGIN [A-Z ]*PRIVATE KEY-----\s*([A-Za-z0-9+/=\s]{40,})-----END',
    );

    final offenders = <String>[];
    for (final file in Directory('lib').listSync(recursive: true)) {
      if (file is! File || !file.path.endsWith('.dart')) continue;
      if (privateKey.hasMatch(file.readAsStringSync())) {
        offenders.add(file.path);
      }
    }

    expect(
      offenders,
      isEmpty,
      reason: 'A private key in the source is a published secret, and it '
          'cannot be un-published.',
    );
  });
}
