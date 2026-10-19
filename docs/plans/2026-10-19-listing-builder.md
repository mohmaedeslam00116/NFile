# Derived Listing Implementation Plan

**Goal:** Replace the seven duplicated sort-and-write call sites with one `ListingBuilder`
that derives the visible Listing from Entries plus rules, so that pinning or re-sorting
during an active search can no longer overwrite the directory listing.

**Architecture:** `ListingBuilder.build(...)` is a pure function. It takes the raw Entries
of a Listing Source plus the rules (Sort Rule, Filter, Pinned Paths, Folder Sort
Overrides, Listing Scope, hidden-files preference) and returns a `Listing` value. Nothing
writes the visible order back into storage. The provider gains `activeListing` and
`listingFor(tab)`, backed by a cache keyed by the inputs.

**Tech Stack:** Flutter 3.41 / Dart 3.11, `provider`, `flutter_test` only (no mocking
library — the seam is pure, so none is needed).

**Spec:** `CONTEXT.md` (glossary + rules) and `docs/adr/0001-derived-listing.md`.
This plan argues from those two; executors read both.

---

## File structure

| File | Responsibility |
|---|---|
| `lib/core/listing/listing.dart` | The `Listing` value: visible entries + folder/file counts. |
| `lib/core/listing/listing_builder.dart` | The seam. Derives a Listing from Entries + rules. |
| `lib/core/listing/sort_rule.dart` | The Sort Rule vocabulary (`FileSortType`), moved out of the provider. |
| `lib/core/listing/listing_scope.dart` | The Listing Scope vocabulary (added in task 2). |
| `lib/core/kind.dart` | The Kind vocabulary: the one classification of the whole application (added in task 3). |
| `lib/core/listing/filter_rule.dart` | The bridge from the Filter vocabulary to the Kind vocabulary (added in task 3). |
| `test/listing_test.dart` | The Listing seam tests. |
| `test/filter_rule_test.dart` | The Kind vocabulary tests (added in task 3). |

The provider re-exports `FileSortType` so every existing import path keeps working:

```dart
// lib/providers/file_manager_provider.dart
export 'core/listing/sort_rule.dart' show FileSortType;
```

---

## Task 01 — The Listing orders entries

**Blocked by:** None (can start immediately)

**What it delivers:** A user can see that a Listing places folders before files, orders
each group by the Sort Rule, and hoists a Pinned Path to the top of its own group.

### Steps

- [x] **1.1** Write the failing test in `test/listing_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/listing/listing_builder.dart';
import 'package:nfile/core/listing/sort_rule.dart';
import 'package:nfile/models/file_item_model.dart';

FileItemModel entry(String path, {bool isDirectory = false, int size = 0, DateTime? modified}) =>
    FileItemModel.fromCustom(
      path: path,
      isDirectory: isDirectory,
      size: size,
      modified: modified ?? DateTime.utc(2026, 1, 1),
    );

void main() {
  group('Listing', () {
    test('places folders before files, each group ordered by the Sort Rule', () {
      final listing = ListingBuilder().build(
        entries: [
          entry('/d/b'),
          entry('/d/a.txt'),
          entry('/d/a', isDirectory: true),
          entry('/d/c.txt'),
        ],
        sortRule: FileSortType.nameAsc,
        pinnedPaths: const {},
      );

      expect(
        listing.entries.map((e) => e.name).toList(),
        ['a', 'b', 'a.txt', 'c.txt'],
      );
    });

    test('hoists a Pinned Path to the top of its own group', () {
      final listing = ListingBuilder().build(
        entries: [
          entry('/d/a.txt'),
          entry('/d/b.txt'),
          entry('/d/x', isDirectory: true),
          entry('/d/y', isDirectory: true),
        ],
        sortRule: FileSortType.nameAsc,
        pinnedPaths: const {'/d/y'},
      );

      expect(
        listing.entries.map((e) => e.name).toList(),
        ['y', 'x', 'a.txt', 'b.txt'],
      );
    });
  });
}
```

- [x] **1.2** Run `flutter test test/listing_test.dart` and watch it fail. The first run
      fails to compile — the seam does not exist yet. Create the skeleton (the Sort Rule
      vocabulary, the `Listing` value, and a `ListingBuilder.build` that throws
      `UnimplementedError`) so the test can run, then watch it fail with
      `UnimplementedError`. Only then implement the behaviour.
- [x] **1.3** Create `lib/core/listing/sort_rule.dart` with the Sort Rule vocabulary
      (moved verbatim from `file_manager_provider.dart:44-52`), add
      `import '../core/listing/sort_rule.dart';` **and**
      `export '../core/listing/sort_rule.dart' show FileSortType;` to the provider, and
      delete the enum from the provider. An `export` alone is not enough: it does not
      bring the name into the exporting library's own scope. Run `flutter analyze` — the
      whole app must still compile.
- [x] **1.4** Create `lib/core/listing/listing.dart`:

```dart
import '../../models/file_item_model.dart';

/// The ordered, filtered set of entries the user currently sees for one location.
/// Derived, never stored — see docs/adr/0001-derived-listing.md.
class Listing {
  /// The visible entries, folders first, each group ordered by the Sort Rule.
  final List<FileItemModel> entries;

  final int folderCount;
  final int fileCount;

  const Listing({
    required this.entries,
    required this.folderCount,
    required this.fileCount,
  });
}
```

- [x] **1.5** Create `lib/core/listing/listing_builder.dart`:

```dart
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
```

- [x] **1.6** Run `flutter test` — both Listing tests and the existing smoke test pass.
- [x] **1.7** Run `flutter analyze` — no new findings in the files this task touched.
- [x] **1.8** Commit: `feat(listing): derive the Listing from Entries and the Sort Rule`.

**Notes recorded while executing this task**

- The test builds its Entries directly rather than through `FileItemModel.fromCustom`.
  That factory splits the name on `Platform.pathSeparator`, so on a Windows host the
  name of a `/`-style path comes out as the whole path — the test would pass or fail
  depending on the machine. A portable `FileItemModel.fromCustom` is a separate
  finding, not part of this task.
- `pubspec.lock` is re-pinned by the local Flutter SDK (`meta`, `test_api` — both
  transitive). The committed lock came from a different Flutter version. Keep that
  change in its own commit so the diff of this task stays about the Listing.


**Acceptance criteria**

- [x] `test/listing_test.dart` passes.
- [x] `flutter analyze` is clean.
- [x] `FileSortType` no longer lives in the provider file; every existing import path
      still resolves.

---

## Task 02 — A Folder Sort Override applies to one directory's Listing only

**Blocked by:** Task 01

**What it delivers:** A user who set a Sort Rule override on one folder sees that folder
sorted by it, and a search across many folders is sorted by the global Sort Rule.

### Steps

- [x] **2.1** Write the failing test:

```dart
group('Folder Sort Override', () {
  // The two entries are ordered differently by name and by size, so each test
  // fails if the wrong Sort Rule is used.
  final entries = [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)];

  test('orders that directory Listing by the override', () {
    final listing = ListingBuilder().build(
      entries: entries,
      scope: const DirectoryScope('/d'),
      sortRule: FileSortType.nameAsc,
      folderOverrides: const {'/d': FileSortType.sizeLargest},
      pinnedPaths: const {},
    );

    expect(listing.entries.map((e) => e.name).toList(), ['b.txt', 'a.txt']);
  });

  test('leaves a directory Listing on the global rule when it has no override', () {
    final listing = ListingBuilder().build(
      entries: entries,
      scope: const DirectoryScope('/other'),
      sortRule: FileSortType.nameAsc,
      folderOverrides: const {'/d': FileSortType.sizeLargest},
      pinnedPaths: const {},
    );

    expect(listing.entries.map((e) => e.name).toList(), ['a.txt', 'b.txt']);
  });

  test('a search Listing uses the global Sort Rule, not a folder override', () {
    final listing = ListingBuilder().build(
      entries: entries,
      scope: const SearchScope('/d'),
      sortRule: FileSortType.nameAsc,
      folderOverrides: const {'/d': FileSortType.sizeLargest},
      pinnedPaths: const {},
    );

    expect(listing.entries.map((e) => e.name).toList(), ['a.txt', 'b.txt']);
  });
});
```

- [x] **2.2** Run the test and watch it fail. The first run fails to compile — the
      `ListingScope` vocabulary and the `scope` / `folderOverrides` parameters do not
      exist. Add them as a skeleton, leaving the resolution unimplemented, then watch
      the override test fail on the assertion — the rule is still the global one.
- [x] **2.3** Create `lib/core/listing/listing_scope.dart`:

```dart
/// What a Listing covers — one directory, or a search across a subtree.
/// It decides whether a Folder Sort Override can apply.
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
```

- [x] **2.4** Extend `ListingBuilder.build` with `scope` and `folderOverrides`, resolving
      the effective Sort Rule inside the builder: a `DirectoryScope` uses the override
      for its location when one exists; a `SearchScope` always uses the global rule.

```dart
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
```

- [x] **2.5** Run `flutter test` — all pass.
- [x] **2.6** Run `flutter analyze`; commit: `feat(listing): resolve the Folder Sort Override inside the builder`.

**Acceptance criteria**

- [x] A directory Listing honours its override; a search Listing does not.
- [x] The override map is injected — the builder reads no global state.
- [x] `flutter analyze` is clean.

**Notes recorded while executing this task**

- The expectations written in this plan before execution were wrong. With the entries
  `b.txt` (1 byte) and `a.txt` (99 bytes), the global `nameAsc` rule and the
  `sizeLargest` override both produce `['a.txt', 'b.txt']` — the directory test could
  not tell "the override was applied" from "the override was ignored", and the search
  test expected an order that `nameAsc` never produces. The entries above are ordered
  differently by name and by size, so each test fails if the wrong rule is used.
- The two tests from task 01 now pass the new `scope` and `folderOverrides`
  parameters. Their assertions are unchanged.


---

## Task 03 — A Filter narrows the Listing, and hidden entries stay hidden

**Blocked by:** Task 01

**What it delivers:** A user who picks a Filter sees only entries of those Kinds, and
hidden entries appear only when they asked to see them.

### Steps

- [x] **3.1** Write the failing test: a Filter of `images` keeps only image entries; a
      hidden entry is absent unless `showHiddenFiles` is true.
- [x] **3.2** Run the test and watch it fail — the contract has no `filter` and no
      `showHiddenFiles` yet.
- [x] **3.3** Extend `ListingBuilder.build` with `filter` and `showHiddenFiles`; classify
      each entry through the Kind vocabulary (`FileUtils`) and drop entries that do not
      match, dropping hidden entries unless `showHiddenFiles` is true.
- [x] **3.4** Run the tests — all pass; run `flutter analyze`; commit:
      `feat(listing): apply the Filter and the hidden-files rule`.

**Acceptance criteria**

- [x] A Filter narrows the Listing to the matching Kinds.
- [x] Hidden entries are absent unless requested.
- [x] `flutter analyze` is clean.

**Notes recorded while executing this task**

- The builder takes a third rule the plan did not mention: `showFoldersInFilter`. The
  application has a "hide folders in filter" switch, and without the switch in the
  contract the builder would either always drop folders under a Filter — changing what
  the user sees by default — or leave the switch outside the derived Listing, which is
  the write-back pattern this refactor removes. The switch is now an explicit input:
  a folder has no Kind, so a Filter does not narrow it.
- The Kind vocabulary is a set, not a single value. A `.ts` file is code
  (`FileUtils.isTextOrCode`) *and* a transport stream (`FileUtils.isVideo` reads the
  mime type `video/mp2t`), so today it appears under both the documents and the videos
  filter. A single Kind would have silently dropped it from one of them. `kindsOf`
  keeps the rules the application has always used, so no file moves between filters.
- `FileManagerProvider.matchesFilterForType` now delegates to the Kind vocabulary
  instead of carrying its own copy of the rules. The copy was the second vocabulary
  the domain forbids. `test/filter_rule_test.dart` pins the behaviour and checks that
  the provider and the Listing agree about every file.
- The search carries a fourth copy of the classification rules (its own extension
  lists for `Images`, `Videos`, `Audio` and `Docs`). It is left alone here: it is the
  search's own filter vocabulary, and the search source is replaced in task 06.


---

## Task 04 — The provider derives Listings

**Blocked by:** Tasks 01, 02, 03

**What it delivers:** The provider offers `activeListing` and `listingFor(tab)`, and
both answer from one derived Listing.

### Steps

- [ ] **4.1** Write the failing test: with a folder override set, `listingFor(tab)`
      returns a Listing ordered by the override; with a search active, the same call
      returns the search Listing.
- [ ] **4.2** Run the test and watch it fail.
- [ ] **4.3** Add `activeListing` and `listingFor(tab)` to the provider, backed by a
      cache keyed by (entries identity, sort rule, filter, pinned paths, scope,
      hidden-files preference). Invalidate when any key part changes.
- [ ] **4.4** Run the tests; run `flutter analyze`; commit:
      `feat(listing): derive Listings in the provider`.

**Acceptance criteria**

- [ ] `activeListing` and `listingFor(tab)` exist and return a `Listing`.
- [ ] The cache is keyed by its inputs; changing the Sort Rule changes the result.
- [ ] `flutter analyze` is clean.

---

## Task 05 — The seven call sites stop writing the visible order

**Blocked by:** Task 04

**What it delivers:** Pinning a file or changing the Sort Rule during an active search
no longer replaces the directory listing with the search results.

### Steps

- [ ] **5.1** Write the failing regression test at the provider seam: start a search,
      pin a path, and assert the tab's directory Entries are unchanged.
- [ ] **5.2** Run the test and watch it fail — the current code overwrites the listing.
- [ ] **5.3** Convert the seven call sites (`setFolderOverrideEnabled`, `setSortType`,
      `togglePinPath`, `refreshDirectoryView`, and the three inside `loadDirectory`) into
      thin delegations that update the rules and re-derive. None of them writes Entries.
- [ ] **5.4** Run the test — it passes. Run `flutter analyze`; commit:
      `fix(listing): stop writing the visible order into the tab`.

**Acceptance criteria**

- [ ] The regression test passes.
- [ ] No call site assigns a visible list to the tab.
- [ ] `flutter analyze` is clean.

---

## Task 06 — The Tab holds one set of Entries and a Source

**Blocked by:** Task 05

**What it delivers:** A tab no longer keeps a directory list and a search list side by
side with a flag between them.

### Steps

- [ ] **6.1** Rename `FolderTab.currentFiles` to `entries` and `searchResults` to
      `searchEntries`; add a `ListingScope` to the tab.
- [ ] **6.2** Remove `FolderTab.displayFiles` and the duplicated "is a search active?"
      condition.
- [ ] **6.3** Update the consumers (`directory_screen`, `pane_browser`); run
      `flutter analyze` and `flutter test`; commit:
      `refactor(listing): one set of Entries and a Source per tab`.

**Acceptance criteria**

- [ ] The duplicated search condition exists in one place only.
- [ ] `flutter analyze` is clean; all tests pass.

---

## Task 07 — Per-path facts follow their path

**Blocked by:** Task 05

**What it delivers:** A Folder Sort Override and a Pinned Path move with a renamed or
moved folder, and end with a deleted one.

### Steps

- [ ] **7.1** Write the failing test: after a rename, the override and the pin are
      still attached to the new path; after a delete, they are gone.
- [ ] **7.2** Run the test and watch it fail.
- [ ] **7.3** Update the override map and the pinned set in `renameFile`, `moveItem`,
      `copyItem` and `deleteFile`.
- [ ] **7.4** Run the test — it passes; run `flutter analyze`; commit:
      `fix(listing): move per-path facts with their path`.

**Acceptance criteria**

- [ ] A renamed or moved folder keeps its override and its pin.
- [ ] A deleted folder leaves neither behind.
- [ ] `flutter analyze` is clean.

---

## Task 08 — The other Listings share the builder

**Blocked by:** Tasks 01, 03

**What it delivers:** The file picker and the address bar order their suggestions the
same way the browser does.

### Steps

- [ ] **8.1** Write the failing test for the file picker's ordering.
- [ ] **8.2** Run it and watch it fail.
- [ ] **8.3** Route the picker and the address bar through `ListingBuilder`.
- [ ] **8.4** Run the test — it passes; run `flutter analyze`; commit:
      `refactor(listing): share the builder with the picker and the address bar`.

**Acceptance criteria**

- [ ] The picker and the address bar no longer implement their own ordering.
- [ ] `flutter analyze` is clean; all tests pass.

---

## Task 09 — CI runs the analysis and the tests

**Blocked by:** Tasks 01, 04

**What it delivers:** A change that breaks the build or a test cannot reach the fork.

### Steps

- [ ] **9.1** Add `flutter analyze` and `flutter test` steps to the build workflow.
- [ ] **9.2** Run the workflow locally-equivalent commands; commit:
      `ci: analyze and test on every build`.

**Acceptance criteria**

- [ ] The workflow runs `flutter analyze` and `flutter test`.
- [ ] Both pass on `main`.

---

## Review Focus

The five failure modes most likely to bite, each with the test that covers it:

1. **The search overwrite** — re-sorting during a search must not touch the directory
   Entries. Covered by task 05's regression test.
2. **Pin hoisting escaping its group** — a pinned file must not outrank a folder.
   Covered by task 01's second test.
3. **The override leaking into a search Listing** — covered by task 02's second test.
4. **The cache serving a stale Listing** — after changing the Sort Rule, the next read
   must reflect it. Covered by task 04's test.
5. **Hidden entries appearing by default** — covered by task 03's test.

## Out of scope for this plan

- Unifying the filter vocabularies of the directory Listing and the search Listing.
- Extending the builder to remote listings (`RemoteFileItem`).
- A `Kind` vocabulary shared with the media categories.
- Cleaning Pinned Paths whose target disappeared without being deleted.
