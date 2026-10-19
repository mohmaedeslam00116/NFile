/// The Sort Rule vocabulary — see `CONTEXT.md`.
///
/// A Sort Rule decides the relative order of entries within a Listing.
/// It lives here, outside the state layer, so that the rules that order a Listing
/// can be reasoned about — and tested — without the application around them.
enum SortRule {
  nameAsc,
  nameDesc,
  dateNewest,
  dateOldest,
  sizeLargest,
  sizeSmallest,
  type,
}
