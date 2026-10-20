import '../../l10n/app_localizations.dart';

/// The translation of the application, for the places that hold no context.
///
/// A service that shows a message to the user — the sharing of the web, the
/// vault, the reader of the media — has no BuildContext: the translation of
/// the language of the system is held here, and the application sets it when
/// it builds.
///
/// The name of the language is the one of the system: the application speaks
/// the language of the system, and so does every message it shows.
class AppTranslation {
  const AppTranslation._();

  static AppLocalizations? _current;

  /// The translation of the language of the system.
  static AppLocalizations get current => _current!;

  /// Whether the translation of the system is known.
  static bool get isKnown => _current != null;

  /// Keeps the translation of the language of the system.
  static void set(AppLocalizations l10n) => _current = l10n;

  /// The name of a message, in the language of the system.
  ///
  /// The name of the message is an id: the program looks it up. The name the
  /// user reads is asked for by name, in the translation.
  static String label(String Function(AppLocalizations l10n) name) =>
      name(current);
}
