import 'package:path/path.dart' as p;

import '../../models/file_item_model.dart';
import '../utils.dart';
import 'listing.dart';
import 'sort_rule.dart';

/// Derives the visible Listing from the Entries of a Listing Source and the rules
/// that decide their order.
///
/// Pure: it reads nothing but its arguments, so a Listing can be reasoned about —
/// and tested — without a device, a filesystem, or stored preferences.
class ListingBuilder {
  const ListingBuilder();

  /// Folders come before files; each group follows the Sort Rule; a Pinned Path is
  /// hoisted to the top of its own group — never above the other group.
  Listing build({
    required List<FileItemModel> entries,
    required FileSortType sortRule,
    required Set<String> pinnedPaths,
  }) {
    final folders = entries.where((e) => e.isDirectory).toList();
    final files = entries.where((e) => !e.isDirectory).toList();

    _sort(folders, sortRule, pinnedPaths);
    _sort(files, sortRule, pinnedPaths);

    return Listing(
      entries: [...folders, ...files],
      folderCount: folders.length,
      fileCount: files.length,
    );
  }

  void _sort(
    List<FileItemModel> items,
    FileSortType sortRule,
    Set<String> pinnedPaths,
  ) {
    switch (sortRule) {
      case FileSortType.nameAsc:
        items.sort((a, b) => FileUtils.compareNatural(a.name, b.name));
      case FileSortType.nameDesc:
        items.sort((a, b) => FileUtils.compareNatural(b.name, a.name));
      case FileSortType.dateNewest:
        items.sort((a, b) => b.modified.compareTo(a.modified));
      case FileSortType.dateOldest:
        items.sort((a, b) => a.modified.compareTo(b.modified));
      case FileSortType.sizeLargest:
        items.sort((a, b) => b.size.compareTo(a.size));
      case FileSortType.sizeSmallest:
        items.sort((a, b) => a.size.compareTo(b.size));
      case FileSortType.type:
        items.sort(
          (a, b) => p.extension(a.name).toLowerCase().compareTo(
                p.extension(b.name).toLowerCase(),
              ),
        );
    }

    // A Pinned Path is hoisted within its own group, keeping the order it earned.
    final pinned = <FileItemModel>[];
    final unpinned = <FileItemModel>[];
    for (final item in items) {
      (pinnedPaths.contains(item.path) ? pinned : unpinned).add(item);
    }
    items
      ..clear()
      ..addAll(pinned)
      ..addAll(unpinned);
  }
}
