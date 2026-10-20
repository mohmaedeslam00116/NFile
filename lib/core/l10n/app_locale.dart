import 'dart:ui';

/// The language the application speaks.
///
/// The application has no switch for the language: the language of the system
/// is the language of the application. Only English and Arabic are supported
/// for now, and a system that speaks anything else falls back to English.
class AppLocale {
  const AppLocale._();

  /// The language of the application when the system speaks English.
  static const Locale english = Locale('en');

  /// The language of the application when the system speaks Arabic.
  static const Locale arabic = Locale('ar');

  /// The languages the application speaks.
  static const List<Locale> supported = [english, arabic];

  /// The language the application speaks, given the languages of the system.
  ///
  /// The system lists its languages in the order the user prefers them, so the
  /// first one the application speaks is the one it uses. A system that speaks
  /// nothing the application knows falls back to English.
  static Locale resolve(List<Locale> systemLocales) {
    for (final locale in systemLocales) {
      if (isSupported(locale)) {
        return _canonical(locale);
      }
    }
    return english;
  }

  /// Whether the application speaks [locale].
  static bool isSupported(Locale locale) =>
      supported.any((spoken) => spoken.languageCode == locale.languageCode);

  /// The language of the application for a locale it speaks: the country of the
  /// system is dropped, so that Arabic of Egypt and Arabic of Saudi Arabia
  /// are the same language here.
  static Locale _canonical(Locale locale) =>
      locale.languageCode == arabic.languageCode ? arabic : english;
}
