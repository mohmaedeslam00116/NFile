import 'package:flutter/widgets.dart';

import '../../l10n/app_localizations.dart';
import 'app_locale.dart';

/// The localization of the application: the languages it speaks, and the
/// strings of the framework.
///
/// The delegates hold the strings of the application and the strings of the
/// framework: the months of the date picker, the menu of the text selection,
/// the tooltips of the material widgets. The framework has Arabic, so the
/// application that loads it is Arabic in every part of it.
class AppLocalization {
  const AppLocalization._();

  /// The delegates of the localization of the application.
  static const List<LocalizationsDelegate<dynamic>> delegates =
      AppLocalizations.localizationsDelegates;

  /// The languages the application speaks.
  static const List<Locale> supportedLocales = AppLocale.supported;

  /// The language the application speaks, given the languages of the system.
  static Locale resolve(List<Locale>? systemLocales) =>
      AppLocale.resolve(systemLocales ?? const []);
}
