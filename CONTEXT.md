# NFile

A file manager for Android. The user browses storage, works with files, and plays media.
This context holds the vocabulary of that world.

## Language

### The listing

**Listing**:
The ordered, filtered set of entries the user currently sees for one location. Always
derived from a source — never stored as the truth.
_Avoid_: current files, display files, file list, visible list

**Entry**:
A single file or folder within a listing.
_Avoid_: item, node, entity, object

**Listing Source**:
Where a listing's entries come from — one directory on disk, or the result of a search
across disk. A source produces entries; it does not order them.
_Avoid_: listing type, mode, view source

**Listing Scope**:
What a listing covers — one directory, or a search across a subtree. It decides whether
a Folder Sort Override can apply.
_Avoid_: listing range, extent, level

**Search Query**:
The text a user types to find entries. Produces a listing source.
_Avoid_: filter query, search text, keyword

**Filter**:
A narrowing of a listing to entries of certain kinds. Independent of ordering.
_Avoid_: search filter, category filter, type filter

**Kind**:
What an Entry is, for the user's benefit — image, video, audio, document, archive, text.
One vocabulary for the whole application: no two places may disagree about the same file.
A file may answer to more than one Kind: `app.ts` is code and a transport stream.
_Avoid_: type, category, format, mime type

**Sort Rule**:
The rule deciding the relative order of entries within a listing — by name, date, size or
type, ascending or descending.
_Avoid_: sort type, ordering, comparator

**Folder Sort Override**:
A sort rule that applies to one folder instead of the global one.
_Avoid_: per-folder sort, directory override, sort exception

**Pinned Path**:
A path the user has pinned. Its entries are hoisted to the top of their own group, not
above other groups.
_Avoid_: favourite, bookmark, shortcut, star

### The workspace

**Tab**:
One working location in the browser, with its own location, selection, search and
scroll position.
_Avoid_: session, pane, window, page

**Location**:
The path a tab is currently showing.
_Avoid_: directory, folder, path (when meaning the place being shown)

**Selection**:
The set of entries the user has marked in a tab.
_Avoid_: checked items, selected files, multi-select

## Rules of the language

- A **label** is what the user reads. An **id** is what the program stores. A label is
  never an id: translating a label must not change stored data.
- A **Listing** is derived. Nothing writes the user's visible order into storage.
- A **Kind** is decided in one place. Two vocabularies may not disagree about the same
  file.
- A **Filter** narrows the files of a **Listing** to the Kinds it keeps. A folder has no
  Kind, so a Filter does not narrow it; the user may still ask for folders to be hidden.
- A **Folder Sort Override** applies to the Listing of one folder. A Listing produced by
  a search spans folders, so it uses the global Sort Rule.
- Per-path facts — a **Folder Sort Override**, a **Pinned Path** — follow the path they
  name: they move with a renamed or moved folder, and end with a deleted one.
- A **Listing** has exactly one rule for ordering it, whatever its Listing Source.
- A **Listing** holds no hidden entries unless the user asked to see them. This holds for
  every Listing Source.
