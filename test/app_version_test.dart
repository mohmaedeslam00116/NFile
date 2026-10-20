import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/app_version.dart';

/// The version of the application.
///
/// The version used to be written in the source, in two places, and it was
/// already behind the version of the pubspec. It is written in one place now,
/// and this test says that it is the version the application has.
void main() {
  test('the version the application shows is the version it has', () {
    final pubspec = File('pubspec.yaml').readAsLinesSync();
    final version = pubspec
        .firstWhere((line) => line.startsWith('version:'))
        .split('version:')
        .last
        .trim()
        .split('+')
        .first;

    expect(AppVersion.current, version);
  });

  test('the channel of the release is named', () {
    expect(AppVersion.channel, isNotEmpty);
  });
}
