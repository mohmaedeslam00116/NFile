import '../../l10n/app_localizations.dart';

/// The name the user reads for a filter.
///
/// A filter is an id: the program stores it, compares it and passes it around.
/// The name is what the user reads, and it is asked for by name, so that it
/// follows the language of the system.
String filterLabel(AppLocalizations l10n, String filter) => switch (filter) {
      'All' => l10n.filterAll,
      'Folders' => l10n.filterFolders,
      'Images' => l10n.categoryImages,
      'Videos' => l10n.categoryVideos,
      'Audio' => l10n.categoryAudio,
      'Docs' => l10n.categoryDocuments,
      _ => filter,
    };
