import '../../models/file_filter_type.dart';
import 'sort_rule.dart';

/// What a Listing covers — one directory, or a search across a subtree.
///
/// The scope decides two things: whether a Folder Sort Override can apply, and
/// whether the Filter of a directory applies.
///
/// See `CONTEXT.md`.
sealed class ListingScope {
  const ListingScope();

  /// The rule that orders a Listing of this scope.
  ///
  /// A Folder Sort Override applies to the Listing of the folder it names. A
  /// Listing produced by a search spans folders, so it uses the global rule.
  SortRule ruleOf({
    required SortRule globalRule,
    required Map<String, SortRule> folderOverrides,
  });

  /// The Filter that narrows a Listing of this scope.
  ///
  /// A Listing produced by a search is not narrowed by the Filter of a directory:
  /// the search narrowed its own results with its own vocabulary.
  FileFilterType filterOf(FileFilterType filter);
}

/// The Listing of one directory on disk.
class DirectoryScope extends ListingScope {
  /// The location the Listing shows.
  final String location;

  const DirectoryScope(this.location);

  @override
  SortRule ruleOf({
    required SortRule globalRule,
    required Map<String, SortRule> folderOverrides,
  }) {
    return folderOverrides[location] ?? globalRule;
  }

  @override
  FileFilterType filterOf(FileFilterType filter) => filter;

  @override
  bool operator ==(Object other) =>
      other is DirectoryScope && other.location == location;

  @override
  int get hashCode => location.hashCode;

  @override
  String toString() => 'DirectoryScope($location)';
}

/// A Listing produced by a search across a subtree.
///
/// A search spans folders, so it never inherits a Folder Sort Override.
class SearchScope extends ListingScope {
  /// The location the search started from.
  final String root;

  const SearchScope(this.root);

  @override
  SortRule ruleOf({
    required SortRule globalRule,
    required Map<String, SortRule> folderOverrides,
  }) {
    return globalRule;
  }

  @override
  FileFilterType filterOf(FileFilterType filter) => FileFilterType.all;

  @override
  bool operator ==(Object other) =>
      other is SearchScope && other.root == root;

  @override
  int get hashCode => root.hashCode;

  @override
  String toString() => 'SearchScope($root)';
}
