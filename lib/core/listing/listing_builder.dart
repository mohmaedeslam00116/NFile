import 'package:path/path.dart' as p;

import '../../models/file_filter_type.dart';
import '../../models/file_item_model.dart';
import '../kind.dart';
import '../utils.dart';
import 'filter_rule.dart';
import 'listing.dart';
import 'listing_scope.dart';
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
    required ListingScope scope,
    required FileSortType sortRule,
    required Map<String, FileSortType> folderOverrides,
    required FileFilterType filter,
    required bool showHiddenFiles,
    required bool showFoldersInFilter,
    required Set<String> pinnedPaths,
  }) {
    final visible = _narrow(
      entries,
      filter: _effectiveFilter(scope, filter),
      showHiddenFiles: showHiddenFiles,
      showFoldersInFilter: showFoldersInFilter,
    );

    final folders = visible.where((e) => e.isDirectory).toList();
    final files = visible.where((e) => !e.isDirectory).toList();

    final effectiveRule = _effectiveSortRule(
      scope: scope,
      globalRule: sortRule,
      folderOverrides: folderOverrides,
    );

    _sort(folders, effectiveRule, pinnedPaths);
    _sort(files, effectiveRule, pinnedPaths);

    return Listing(
      entries: [...folders, ...files],
      folderCount: folders.length,
      fileCount: files.length,
    );
  }

  /// The entries the Listing holds.
  ///
  /// A hidden entry is absent unless the user asked to see them. A Filter narrows
  /// the files to the Kinds it keeps; a folder has no Kind, so a Filter does not
  /// narrow it — the user may still ask for folders to be hidden.
  List<FileItemModel> _narrow(
    List<FileItemModel> entries, {
    required FileFilterType filter,
    required bool showHiddenFiles,
    required bool showFoldersInFilter,
  }) {
    final kept = <FileItemModel>[];
    for (final entry in entries) {
      if (entry.isHidden && !showHiddenFiles) continue;

      if (entry.isDirectory) {
        if (filter != FileFilterType.all && !showFoldersInFilter) continue;
        kept.add(entry);
        continue;
      }

      if (filter != FileFilterType.all &&
          !matchesFilter(kindsOf(entry.path), filter)) {
        continue;
      }
      kept.add(entry);
    }
    return kept;
  }

  /// The Filter that narrows this Listing.
  ///
  /// A Listing produced by a search is not narrowed by the Filter of a directory:
  /// the search narrowed its own results with its own vocabulary.
  FileFilterType _effectiveFilter(ListingScope scope, FileFilterType filter) {
    return switch (scope) {
      DirectoryScope() => filter,
      SearchScope() => FileFilterType.all,
    };
  }

  /// The rule that orders this Listing.
  ///
  /// A Folder Sort Override applies to the Listing of the folder it names. A
  /// Listing produced by a search spans folders, so it uses the global rule.
  FileSortType _effectiveSortRule({
    required ListingScope scope,
    required FileSortType globalRule,
    required Map<String, FileSortType> folderOverrides,
  }) {
    return switch (scope) {
      DirectoryScope(:final location) => folderOverrides[location] ?? globalRule,
      SearchScope() => globalRule,
    };
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
