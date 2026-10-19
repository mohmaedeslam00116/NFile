/// What a Listing covers — one directory, or a search across a subtree.
/// It decides whether a Folder Sort Override can apply.
///
/// See `CONTEXT.md`.
sealed class ListingScope {
  const ListingScope();
}

/// The Listing of one directory on disk.
class DirectoryScope extends ListingScope {
  /// The location the Listing shows.
  final String location;

  const DirectoryScope(this.location);

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
  bool operator ==(Object other) =>
      other is SearchScope && other.root == root;

  @override
  int get hashCode => root.hashCode;

  @override
  String toString() => 'SearchScope($root)';
}
