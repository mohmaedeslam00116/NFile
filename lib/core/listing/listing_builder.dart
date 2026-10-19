import 'package:path/path.dart' as p;

import '../../models/file_filter_type.dart';
import '../../models/file_item_model.dart';
import '../kind.dart';
import '../utils.dart';
import 'filter_rule.dart';
import 'listing.dart';
import 'listing_inputs.dart';
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
  ///
  /// The Listing Scope decides two things: whether a Folder Sort Override applies,
  /// and whether the Filter of a directory applies.
  Listing build(ListingInputs inputs) {
    final visible = _narrow(
      inputs.entries,
      filter: inputs.scope.filterOf(inputs.filter),
      showHiddenFiles: inputs.showHiddenFiles,
      showFoldersInFilter: inputs.showFoldersInFilter,
    );

    final folders = visible.where((e) => e.isDirectory).toList();
    final files = visible.where((e) => !e.isDirectory).toList();

    final effectiveRule = inputs.scope.ruleOf(
      globalRule: inputs.sortRule,
      folderOverrides: inputs.folderOverrides,
    );

    _sort(folders, effectiveRule, inputs.pinnedPaths);
    _sort(files, effectiveRule, inputs.pinnedPaths);

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

  void _sort(
    List<FileItemModel> items,
    SortRule sortRule,
    Set<String> pinnedPaths,
  ) {
    switch (sortRule) {
      case SortRule.nameAsc:
        items.sort((a, b) => FileUtils.compareNatural(a.name, b.name));
      case SortRule.nameDesc:
        items.sort((a, b) => FileUtils.compareNatural(b.name, a.name));
      case SortRule.dateNewest:
        items.sort((a, b) => b.modified.compareTo(a.modified));
      case SortRule.dateOldest:
        items.sort((a, b) => a.modified.compareTo(b.modified));
      case SortRule.sizeLargest:
        items.sort((a, b) => b.size.compareTo(a.size));
      case SortRule.sizeSmallest:
        items.sort((a, b) => a.size.compareTo(b.size));
      case SortRule.type:
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
