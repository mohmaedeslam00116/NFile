import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:openfile/core/l10n/app_locale.dart';

/// The language the application speaks.
///
/// The application has no switch for the language: the language of the system
/// is the language of the application. English, Arabic, and French are
/// supported, and a system that speaks anything else falls back to English.
void main() {
  group('the language the application speaks', () {
    test('is Arabic when the system speaks Arabic', () {
      expect(AppLocale.resolve([const Locale('ar')]), const Locale('ar'));
    });

    test('is English when the system speaks English', () {
      expect(AppLocale.resolve([const Locale('en')]), const Locale('en'));
    });

    test('is French when the system speaks French', () {
      expect(AppLocale.resolve([const Locale('fr')]), const Locale('fr'));
    });

    test('is English when the system speaks a language it does not know', () {
      expect(AppLocale.resolve([const Locale('ru')]), const Locale('en'));
      expect(AppLocale.resolve([const Locale('de')]), const Locale('en'));
    });

    test('is English when the system says nothing', () {
      expect(AppLocale.resolve([]), const Locale('en'));
    });

    test('is the language of the system, whatever the country is', () {
      expect(AppLocale.resolve([const Locale('ar', 'EG')]), const Locale('ar'));
      expect(AppLocale.resolve([const Locale('ar', 'SA')]), const Locale('ar'));
      expect(AppLocale.resolve([const Locale('en', 'GB')]), const Locale('en'));
    });

    test('is the first language of the system that it speaks', () {
      expect(
        AppLocale.resolve([const Locale('fr'), const Locale('ar')]),
        const Locale('fr'),
      );
      expect(
        AppLocale.resolve([const Locale('de'), const Locale('en', 'US')]),
        const Locale('en'),
      );
    });
  });

  group('the languages the application speaks', () {
    test('are English, Arabic, and French', () {
      expect(AppLocale.supported, [const Locale('en'), const Locale('ar'), const Locale('fr')]);
    });

    test('are told apart from the ones it does not speak', () {
      expect(AppLocale.isSupported(const Locale('ar')), isTrue);
      expect(AppLocale.isSupported(const Locale('en')), isTrue);
      expect(AppLocale.isSupported(const Locale('fr')), isTrue);
    });
  });
}
