import 'package:flutter/material.dart';
import 'package:openfile/core/l10n/app_localization.dart';

/// The application, with the localizations it has in the real one.
///
/// A screen asks the translation for the strings it shows, so a test that
/// builds one has to load the localizations too. The harness is that.
Widget appUnderTest({
  required Widget home,
  Locale locale = const Locale('en'),
}) =>
    MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalization.delegates,
      supportedLocales: AppLocalization.supportedLocales,
      home: home,
    );
