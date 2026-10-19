# The visible Listing is derived, never stored

The file manager used to keep the user's visible order inside the tab's `currentFiles`,
and seven separate call sites re-sorted and wrote that list back. Because the getter
behind those call sites returned search results while a search was active, pinning or
re-sorting during a search silently replaced the directory listing with the search
results. We decided that the visible Listing is always derived from Entries plus rules
(entries, sort rule, filter, pinned paths, location, hidden-files preference), computed
by a single `ListingBuilder`, and that nothing writes the user's visible order into
storage. A derived Listing may be cached, but the cache is keyed by its inputs and is
never the source of truth.

## Consequences

- `FolderTab` keeps raw Entries and a description of the Listing Source; it does not
  keep a visible list. The duplicated "is a search active?" condition disappears.
- A Listing produced by a search uses the global Sort Rule: a Folder Sort Override
  belongs to one folder's Listing and does not apply across a searched subtree.
- Per-path facts (a Folder Sort Override, a Pinned Path) follow the path they name, so
  they move with a renamed or moved folder and end with a deleted one.
