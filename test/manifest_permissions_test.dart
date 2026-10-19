import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The permissions the application asks for.
///
/// The permissions the application does not use have to be taken out of the
/// merged manifest, and the only way to say that is the marker the manifest
/// merger understands: `tools:node="remove"`.
///
/// A library that brings a permission in has its say, and the application has
/// the last word. The proof that the application used it is the merged
/// manifest, which the build pipeline checks after the build.
void main() {
  late String manifest;

  setUpAll(() {
    manifest = File('android/app/src/main/AndroidManifest.xml').readAsStringSync();
  });

  /// The permission the manifest asks for, and what it says about it.
  String? asksFor(String permission) {
    for (final line in manifest.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.startsWith('<uses-permission') &&
          trimmed.contains('android.permission.$permission')) {
        return trimmed;
      }
    }
    return null;
  }

  group('the permissions the application ships', () {
    test('takes READ_MEDIA_IMAGES out of the merged manifest', () {
      expect(
        asksFor('READ_MEDIA_IMAGES'),
        contains('tools:node="remove"'),
        reason: 'The application does not use the granular image permission: '
            'MANAGE_EXTERNAL_STORAGE covers it.',
      );
    });

    test('takes READ_MEDIA_VIDEO out of the merged manifest', () {
      expect(
        asksFor('READ_MEDIA_VIDEO'),
        contains('tools:node="remove"'),
        reason: 'The application does not use the granular video permission: '
            'MANAGE_EXTERNAL_STORAGE covers it.',
      );
    });

    test('keeps the audio permission, which on_audio_query needs', () {
      final asked = asksFor('READ_MEDIA_AUDIO');
      expect(asked, isNotNull);
      expect(asked, isNot(contains('tools:node="remove"')));
    });
  });
}
