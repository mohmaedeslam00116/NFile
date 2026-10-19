import '../../models/file_item_model.dart';

/// The ordered, filtered set of entries the user currently sees for one location.
///
/// A Listing is derived from Entries plus rules, and is never written back into
/// storage — see `docs/adr/0001-derived-listing.md`.
class Listing {
  /// The visible entries, folders first, each group ordered by the Sort Rule.
  final List<FileItemModel> entries;

  final int folderCount;
  final int fileCount;

  const Listing({
    required this.entries,
    required this.folderCount,
    required this.fileCount,
  });
}
