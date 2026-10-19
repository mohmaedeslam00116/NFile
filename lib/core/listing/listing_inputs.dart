import 'package:flutter/foundation.dart';

import '../../models/file_filter_type.dart';
import '../../models/file_item_model.dart';
import 'listing_scope.dart';
import 'sort_rule.dart';

/// The inputs a Listing is derived from.
///
/// Two sets of inputs that compare equal produce the same Listing, so a cache
/// keyed by them can hand back the Listing it already built.
class ListingInputs {
  /// The Entries of the Listing Source.
  final List<FileItemModel> entries;

  /// What the Listing covers.
  final ListingScope scope;

  /// The rule that orders the Listing, before a Folder Sort Override replaces it.
  final FileSortType sortRule;

  /// The rules that order one folder instead of the global one.
  final Map<String, FileSortType> folderOverrides;

  /// The Filter that narrows the Listing.
  final FileFilterType filter;

  /// Whether the user asked to see the hidden entries.
  final bool showHiddenFiles;

  /// Whether the user asked to see the folders while a Filter is active.
  final bool showFoldersInFilter;

  /// The paths the user pinned.
  final Set<String> pinnedPaths;

  const ListingInputs({
    required this.entries,
    required this.scope,
    required this.sortRule,
    required this.folderOverrides,
    required this.filter,
    required this.showHiddenFiles,
    required this.showFoldersInFilter,
    required this.pinnedPaths,
  });

  /// The Entries are compared by identity: the application replaces the list when
  /// it reloads, and never sorts it in place.
  @override
  bool operator ==(Object other) =>
      other is ListingInputs &&
      identical(other.entries, entries) &&
      other.scope == scope &&
      other.sortRule == sortRule &&
      mapEquals(other.folderOverrides, folderOverrides) &&
      other.filter == filter &&
      other.showHiddenFiles == showHiddenFiles &&
      other.showFoldersInFilter == showFoldersInFilter &&
      setEquals(other.pinnedPaths, pinnedPaths);

  @override
  int get hashCode => Object.hash(
        identityHashCode(entries),
        scope,
        sortRule,
        Object.hashAll(
          folderOverrides.entries.map((e) => Object.hash(e.key, e.value)),
        ),
        filter,
        showHiddenFiles,
        showFoldersInFilter,
        Object.hashAll(pinnedPaths),
      );
}
