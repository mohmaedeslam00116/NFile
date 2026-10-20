import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/l10n/app_locale.dart';
import 'package:nfile/core/l10n/app_localization.dart';
import 'package:nfile/l10n/app_localizations.dart';

/// The translation of the application.
///
/// Every string the user reads lives in a translation file, under a name that
/// says what it is. The English file is the template: it holds every key. The
/// Arabic file holds the translation of every one of them.
void main() {
  final english = _readArb('lib/l10n/app_en.arb');
  final arabic = _readArb('lib/l10n/app_ar.arb');

  group('the translation of the application', () {
    test('has a key for every string of the English file', () {
      expect(
        arabic.keys.toSet(),
        english.keys.toSet(),
        reason: 'Every key of the English file needs an Arabic value.',
      );
    });

    test('has an Arabic value that is a translation, not a copy', () {
      final copies = english.keys
          .where((key) => !_sameInBothLanguages.contains(key))
          .where((key) => _isCopy(english[key]!, arabic[key]!))
          .toList();

      expect(
        copies,
        isEmpty,
        reason: 'A value that was not translated is still English.',
      );
    });

    test('speaks the languages the application says it speaks', () {
      // The tool of Flutter writes the languages in the order of the alphabet.
      // The application keeps its own order, with English first, because
      // English is the language it falls back to.
      expect(
        AppLocalizations.supportedLocales.toSet(),
        AppLocale.supported.toSet(),
      );
    });
  });

  group('the application', () {
    testWidgets('shows Arabic when the system speaks Arabic', (tester) async {
      await tester.pumpWidget(
        _app(
          AppLocalization.resolve([const Locale('ar')]),
          Builder(
            builder: (context) =>
                Text(AppLocalizations.of(context).grantPermission),
          ),
        ),
      );

      expect(find.text('منح الإذن'), findsOneWidget);
    });

    testWidgets('shows English when the system speaks English',
        (tester) async {
      await tester.pumpWidget(
        _app(
          AppLocalization.resolve([const Locale('en')]),
          Builder(
            builder: (context) =>
                Text(AppLocalizations.of(context).grantPermission),
          ),
        ),
      );

      expect(find.text('Grant Permission'), findsOneWidget);
    });

    testWidgets('is read from the right when it speaks Arabic',
        (tester) async {
      await tester.pumpWidget(
        _app(
          AppLocalization.resolve([const Locale('ar')]),
          Builder(
            builder: (context) => Directionality.of(context) == TextDirection.rtl
                ? const Text('rtl')
                : const Text('ltr'),
          ),
        ),
      );

      expect(find.text('rtl'), findsOneWidget);
    });

    testWidgets('speaks the strings of the framework in Arabic too',
        (tester) async {
      String? okInArabic;
      String? okInEnglish;

      await tester.pumpWidget(
        _app(
          AppLocalization.resolve([const Locale('ar')]),
          Builder(
            builder: (context) {
              okInArabic = MaterialLocalizations.of(context).okButtonLabel;
              return const SizedBox.shrink();
            },
          ),
        ),
      );
      await tester.pumpWidget(
        _app(
          AppLocalization.resolve([const Locale('en')]),
          Builder(
            builder: (context) {
              okInEnglish = MaterialLocalizations.of(context).okButtonLabel;
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(okInArabic, isNotNull);
      expect(okInEnglish, isNotNull);
      expect(okInArabic, isNot(okInEnglish),
          reason: 'The strings of the framework must be Arabic too.');
    });

    test('wires the localizations of the application', () {
      final source = File('lib/main.dart').readAsStringSync();

      expect(source, contains('AppLocalization.delegates'));
      expect(source, contains('AppLocalization.supportedLocales'));
      expect(source, contains('AppLocalization.resolve'));
    });
  });
}

/// Whether a value is a copy of the English one.
///
/// A message that holds nothing but placeholders — the count and the date of
/// an entry — is the same in every language: there is no word to translate.
/// A message that holds the same words as the English one was not translated.
bool _isCopy(String english, String arabic) {
  if (english != arabic) return false;

  final text = english.replaceAll(RegExp(r'\{[^{}]*\}'), ' ').trim();
  if (!RegExp('[A-Za-z]{2,}').hasMatch(text)) return false;

  return true;
}

/// The values that are the same in both languages, because they name a thing
/// that is written the same way everywhere.
const Set<String> _sameInBothLanguages = {'appName'};

/// The keys of a translation file, without the metadata.
Map<String, String> _readArb(String path) {
  final content = json.decode(File(path).readAsStringSync()) as Map;
  return {
    for (final entry in content.entries)
      if (!entry.key.startsWith('@')) entry.key: entry.value as String,
  };
}

/// The application, with the localizations it has in the real one.
Widget _app(Locale locale, Widget home) => MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalization.delegates,
      supportedLocales: AppLocalization.supportedLocales,
      home: home,
    );
