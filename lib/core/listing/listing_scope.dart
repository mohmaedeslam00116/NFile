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
}

/// A Listing produced by a search across a subtree.
///
/// A search spans folders, so it never inherits a Folder Sort Override.
class SearchScope extends ListingScope {
  /// The location the search started from.
  final String root;

  const SearchScope(this.root);
}
