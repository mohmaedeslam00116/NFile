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
| `lib/core/listing/listing_inputs.dart` | The inputs a Listing is derived from — the key of the cache (added in task 4). |
| `lib/core/listing/listing_cache.dart` | Remembers the Listing built from a set of inputs (added in task 4). |
| `lib/core/kind.dart` | The Kind vocabulary: the one classification of the whole application (added in task 3). |
| `lib/core/listing/filter_rule.dart` | The bridge from the Filter vocabulary to the Kind vocabulary (added in task 3). |
| `test/listing_test.dart` | The Listing seam tests. |
| `test/filter_rule_test.dart` | The Kind vocabulary tests (added in task 3). |
| `test/listing_provider_test.dart` | The provider derives Listings (added in task 4). |

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

- [x] **4.1** Write the failing test: with a folder override set, `listingFor(tab)`
      returns a Listing ordered by the override; with a search active, the same call
      returns the search Listing.
- [x] **4.2** Run the test and watch it fail.
- [x] **4.3** Add `activeListing` and `listingFor(tab)` to the provider, backed by a
      cache keyed by (entries identity, sort rule, filter, pinned paths, scope,
      hidden-files preference). Invalidate when any key part changes.
- [x] **4.4** Run the tests; run `flutter analyze`; commit:
      `feat(listing): derive Listings in the provider`.

**Acceptance criteria**

- [x] `activeListing` and `listingFor(tab)` exist and return a `Listing`.
- [x] The cache is keyed by its inputs; changing the Sort Rule changes the result.
- [x] `flutter analyze` is clean.

**Notes recorded while executing this task**

- The cache is keyed by a value, `ListingInputs`, not by the order of the calls. The
  Entries are compared by identity — the application replaces the list when it
  reloads and never sorts it in place — while the Folder Sort Overrides and the
  Pinned Paths are compared by content, because the application mutates both in
  place. A change the provider forgot to announce still shows up.
- The Listing Scope needed value equality (`==` and `hashCode`) for the cache to
  compare it. Two scopes of the same location are the same scope.
- A new rule, with a test: a Listing produced by a search is not narrowed by the
  Filter of a directory. The search narrowed its own results with its own
  vocabulary, and the application has never applied the directory Filter to search
  results. The rule lives in the builder, so the provider cannot apply it by
  accident.
- The provider test needs `SharedPreferences.setMockInitialValues({})` and the two
  preference stores initialised before the provider is built; the provider reads
  every setting it knows in its constructor.
- The user still sees the old list. The application reads `currentFiles` and
  `displayFiles`; the derived Listing is what it will read in tasks 05 and 06.


---

## Task 05 — The seven call sites stop writing the visible order

**Blocked by:** Task 04

**What it delivers:** Pinning a file or changing the Sort Rule during an active search
no longer replaces the directory listing with the search results.

### Steps

- [x] **5.1** Write the failing regression test at the provider seam: start a search,
      pin a path, and assert the tab's directory Entries are unchanged.
- [x] **5.2** Run the test and watch it fail — the current code overwrites the listing.
- [x] **5.3** Convert the seven call sites (`setFolderOverrideEnabled`, `setSortType`,
      `togglePinPath`, `refreshDirectoryView`, and the three inside `loadDirectory`) into
      thin delegations that update the rules and re-derive. None of them writes Entries.
- [x] **5.4** Run the test — it passes. Run `flutter analyze`; commit:
      `fix(listing): stop writing the visible order into the tab`.

**Acceptance criteria**

- [x] The regression test passes.
- [x] No call site assigns a visible list to the tab.
- [x] `flutter analyze` is clean.

**Notes recorded while executing this task**

- The application reads the visible list through one getter, `currentFiles`, and that
  getter now returns the derived Listing. Every surface — the browser, the split
  screen, the selection bar — reads the same derived answer without touching a
  single call site.
- The split screen was the one place that read a tab's stored list directly
  (`tab.displayFiles`); it now reads `provider.listingFor(tab).entries`.
- The three loads store the Entries as the source produced them. The rule about
  hidden entries stays at the source, because the source is what decides what it
  produces; the Listing keeps the rule as well, and it is the rule that hides the
  hidden entries of a search.
- `updateFileInList` replaced one entry in the stored list in place. The cache
  recognises the Entries by the identity of the list, so the list is now replaced
  instead — the same rule the load already followed.
- `_sortList` and `_matchesFilter` had no callers left and are gone. The rules they
  carried live in the builder and in the Kind vocabulary.
- Two things the user sees changed, both of them the rule the domain already states:
  the results of a search are ordered by the Sort Rule like every other Listing, and
  they hold no hidden entries unless the user asked to see them.


---

## Task 06 — The Tab holds one set of Entries and a Source

**Blocked by:** Task 05

**What it delivers:** A tab no longer keeps a directory list and a search list side by
side with a flag between them.

### Steps

- [x] **6.1** Rename `FolderTab.currentFiles` to `entries` and `searchResults` to
      `searchEntries`; add a `ListingScope` to the tab.
- [x] **6.2** Remove `FolderTab.displayFiles` and the duplicated "is a search active?"
      condition.
- [x] **6.3** Update the consumers (`directory_screen`, `pane_browser`); run
      `flutter analyze` and `flutter test`; commit:
      `refactor(listing): one set of Entries and a Source per tab`.

**Acceptance criteria**

- [x] The duplicated search condition exists in one place only.
- [x] `flutter analyze` is clean; all tests pass.

**Notes recorded while executing this task**

- The scope of the tab is derived from the tab's own state — `isSearchActive` and
  `currentPath` — so it can never disagree with the entries the tab holds. A stored
  scope would have needed to be updated wherever the path changed.
- The tab keeps the entries of the directory and the entries of the search apart.
  Closing a search shows the directory again without reading the disk again; with a
  single list the entries of the directory would be gone and the directory would
  have to be loaded again.
- The condition "is a search active?" now lives in the tab alone: the scope and the
  source entries are two getters over the same field. The provider asks the tab
  (`tab.scope`, `tab.sourceEntries`) and never decides for itself.
- `displayFiles` is gone; `sourceEntries` says what it holds — the entries of the
  tab's source, before the rules order and narrow them.


---

## Task 07 — Per-path facts follow their path

**Blocked by:** Task 05

**What it delivers:** A Folder Sort Override and a Pinned Path move with a renamed or
moved folder, and end with a deleted one.

### Steps

- [x] **7.1** Write the failing test: after a rename, the override and the pin are
      still attached to the new path; after a delete, they are gone.
- [x] **7.2** Run the test and watch it fail.
- [x] **7.3** Update the override map and the pinned set in `renameFile`, `moveItem`,
      `copyItem` and `deleteFile`.
- [x] **7.4** Run the test — it passes; run `flutter analyze`; commit:
      `fix(listing): move per-path facts with their path`.

**Acceptance criteria**

- [x] A renamed or moved folder keeps its override and its pin.
- [x] A deleted folder leaves neither behind.
- [x] `flutter analyze` is clean.

**Notes recorded while executing this task**

- The rule lives in a pure module, `PathFacts`: it takes the overrides and the pins
  and returns the ones that remain, or the ones that moved. The provider wires it to
  the rename, the move and the delete, and stores the result.
- A folder that moves takes its own facts with it, and the facts of everything
  inside it move as well. A path that merely starts with the same characters is not
  inside it: `/d/oldish` is not inside `/d/old`.
- The paths are compared with the path package, so the module works with the
  separator of the platform it runs on. The tests build their expectations the same
  way, and are therefore not tied to one platform.
- The copy leaves the facts alone: the source keeps its override and its pin, and
  the copy starts with none.


---

## Task 08 — The other Listings share the builder

**Blocked by:** Tasks 01, 03

**What it delivers:** The file picker and the address bar order their suggestions the
same way the browser does.

### Steps

- [x] **8.1** Write the failing test for the file picker's ordering.
- [x] **8.2** Run it and watch it fail.
- [x] **8.3** Route the picker and the address bar through `ListingBuilder`.
- [x] **8.4** Run the test — it passes; run `flutter analyze`; commit:
      `refactor(listing): share the builder with the picker and the address bar`.

**Acceptance criteria**

- [x] The picker and the address bar no longer implement their own ordering.
- [x] `flutter analyze` is clean; all tests pass.

**Notes recorded while executing this task**

- The picker and the address bar each had their own copy of the ordering. The picker
  sorted by name whatever the user chose; the address bar sorted folders first and
  then by name. Both now build a Listing, so they follow the Sort Rule, the Folder
  Sort Override and the Pinned Paths of the browser.
- The test of the picker is the first widget test of substance in this repository.
  Two things had to be learned to write it: a widget test runs in a fake clock, so
  the reading of the disk has to happen in the real zone, and a screen that shows a
  spinner never settles, so the test pumps a fixed moment instead of waiting.
- The picker now hides the hidden entries unless the user asked to see them, like
  the browser does. The restricted path of the address bar already did.
- The address bar turns its entries into Entries to give them to the builder, and
  takes the entities back afterwards. The builder works with Entries; the address
  bar works with the entities of the disk.


---

## Task 09 — CI runs the analysis and the tests

**Blocked by:** Tasks 01, 04

**What it delivers:** A change that breaks the build or a test cannot reach the fork.

### Steps

- [x] **9.1** Make the analysis pass: the repository carried 1128 findings, so a gate on
      it could never be green. The automated fixes came first, then the rest by hand.
- [x] **9.2** Add the pipeline that runs the analysis and the tests
      (`.github/workflows/checks.yml`), next to the pipeline that builds the APK.
- [x] **9.3** Run the analysis and the tests locally — both pass.
- [x] **9.4** Commit: `ci: run the analysis and the tests on every change`.

**Acceptance criteria**

- [x] The workflow runs `flutter analyze` and `flutter test`.
- [x] Both pass on `main`.

**Notes recorded while executing this task**

- The analysis found 1128 findings: 988 of them were `withOpacity`, 62 were
  `use_build_context_synchronously`, and 33 were warnings about code that nothing
  reads. `flutter analyze` fails on any of them, so the pipeline could not be green
  until they were dealt with.
- `Color.withOpacity` and `Color.withValues(alpha:)` both *replace* the alpha of the
  colour — the source of the engine says so — so the 822 call sites moved over
  without changing a single pixel. The difference is precision: the old call went
  through eight bits, the new one keeps the double.
- The SDK's own fixes renamed some theme members (`surfaceVariant` became
  `surfaceContainerHighest`) and moved the drag-and-drop callbacks to the API that
  carries the payload. That last one needed the bodies rewritten too: the automated
  fix changed the signature and left `details.paths` behind.
- The share sheet moved to the API of share_plus 12.
- Eighteen warnings were code that nothing read: unused imports, fields, locals and
  one class. They are gone. One of them was a screen reaching into the provider's
  protected notifier; the provider now offers `refreshUi()` for that.
- One rule stays off: `use_build_context_synchronously`. The application uses a
  BuildContext after an await in 53 places, and fixing them means capturing the
  Navigator or checking `mounted` at every site — in screens that have no tests to
  catch a mistake. The exclusion is written down in `analysis_options.yaml`.
- The pipeline pins Flutter 3.41.7, the version the analysis was verified against.
  A gate that moves with the newest release breaks without anyone changing code.

---

## Review of the whole branch

The branch was reviewed along two axes, by two reviewers that never saw each other's
findings: one against the standards of the repository, one against the spec. What
they found, and what was done about it:

**The rules of the domain that the code did not honour**

- The search carried its own classification, and it disagreed with the Kind
  vocabulary: an `.odt` was a document in a directory and nothing in a search. The
  search now asks the Kind vocabulary. The lists it had were narrower, so a search
  finds a few more files than it did — the same files the Filter of a directory
  keeps.
- The hidden-files rule was applied in three places: by the builder, by the source
  that produced the entries, and by the service that listed them. The source now
  produces the entries as they are, and the rule lives in the builder alone.
- The per-path facts did not follow their path in three places: a rename in a
  restricted directory, a cut and paste, and the recycle bin — where the item was
  only trashed and could be restored, so its facts had to stay. Each of the three
  now behaves like the rule says.

**The language of the domain, in the names**

- `FileSortType` said the thing CONTEXT.md asks not to say. It is `SortRule` now.
- `currentFiles` returned the Listing under a name CONTEXT.md asks not to use. The
  interface reads `activeListing.entries` now, and the getter is gone.
- `displayFiles` was already gone; `sourceEntries` says what it holds.

**The shapes**

- The eight inputs of a Listing travelled in two declarations. The builder takes a
  `ListingInputs` now, and the cache hands it straight over.
- The Listing Scope decided the rule in one switch and the filter in another.
  CONTEXT.md says the scope decides whether a Folder Sort Override applies, so the
  scope now answers both, and the builder asks it.
- The picker and the address bar each built a Listing by hand. The provider offers
  `listingForDirectory` now, and both use it.
- The two methods that moved the per-path facts were the same shape twice. They
  share `_applyPathFacts` now.
- `refreshDirectoryView` and `refreshUi` did the same thing. There is one now.

**A defect in the cache's key**

- `ListingInputs.hashCode` hashed the overrides and the pins in the order they
  happened to be in, while `==` compared them without an order. Two inputs that
  compare equal could hash differently, which breaks the contract of a hash. The
  order does not matter now.

**A test that was weaker than it looked**

- The regression test of the search overwrite asserted that the directory entries
  were untouched, and nothing else: it would have passed if pinning did nothing at
  all. It now asserts that the pin was applied and that the search listing hoists
  it.

**What was left alone, and why**

- The `use_build_context_synchronously` rule stays off. The reason is written down
  in `analysis_options.yaml`.
- `Listing.folderCount` and `Listing.fileCount` stay: the plan asked for them, and
  the interface now reads them instead of counting again.


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
