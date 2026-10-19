import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/listing/listing.dart';
import 'package:nfile/core/listing/listing_builder.dart';
import 'package:nfile/core/listing/listing_inputs.dart';
import 'package:nfile/core/listing/listing_scope.dart';
import 'package:nfile/core/listing/sort_rule.dart';
import 'package:nfile/models/file_filter_type.dart';
import 'package:nfile/models/file_item_model.dart';
import 'package:path/path.dart' as p;

/// An Entry built without touching the filesystem. The name is computed here rather
/// than through `FileItemModel.fromCustom`, which splits on the host platform's path
/// separator and would make this test depend on the machine it runs on.
FileItemModel entry(
  String path, {
  bool isDirectory = false,
  int size = 0,
  DateTime? modified,
}) => FileItemModel(
      entity: isDirectory ? Directory(path) : File(path),
      name: p.basename(path),
      path: path,
      isDirectory: isDirectory,
      size: size,
      modified: modified ?? DateTime.utc(2026, 1, 1),
    );

/// The contract of the builder, in one place: a Listing is derived from Entries
/// plus the rules that order, narrow and hide them.
Listing listing(
  List<FileItemModel> entries, {
  ListingScope scope = const DirectoryScope('/d'),
  SortRule sortRule = SortRule.nameAsc,
  Map<String, SortRule> folderOverrides = const {},
  FileFilterType filter = FileFilterType.all,
  bool showHiddenFiles = false,
  bool showFoldersInFilter = true,
  Set<String> pinnedPaths = const {},
}) =>
    ListingBuilder().build(
      ListingInputs(
        entries: entries,
        scope: scope,
        sortRule: sortRule,
        folderOverrides: folderOverrides,
        filter: filter,
        showHiddenFiles: showHiddenFiles,
        showFoldersInFilter: showFoldersInFilter,
        pinnedPaths: pinnedPaths,
      ),
    );

List<String> namesOf(List<FileItemModel> entries) =>
    entries.map((e) => e.name).toList();

void main() {
  group('Listing', () {
    test('places folders before files, each group ordered by the Sort Rule', () {
      final result = listing([
        entry('/d/b', isDirectory: true),
        entry('/d/a.txt'),
        entry('/d/a', isDirectory: true),
        entry('/d/c.txt'),
      ]);

      expect(namesOf(result.entries), ['a', 'b', 'a.txt', 'c.txt']);
    });

    test('hoists a Pinned Path to the top of its own group', () {
      final result = listing(
        [
          entry('/d/a.txt'),
          entry('/d/b.txt'),
          entry('/d/x', isDirectory: true),
          entry('/d/y', isDirectory: true),
        ],
        pinnedPaths: const {'/d/y'},
      );

      expect(namesOf(result.entries), ['y', 'x', 'a.txt', 'b.txt']);
    });
  });

  group('Folder Sort Override', () {
    // The two entries are ordered differently by name and by size, so each test
    // fails if the wrong Sort Rule is used.
    final entries = [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)];

    test('orders that directory Listing by the override', () {
      final result = listing(
        entries,
        folderOverrides: const {'/d': SortRule.sizeLargest},
      );

      expect(namesOf(result.entries), ['b.txt', 'a.txt']);
    });

    test('leaves a directory Listing on the global rule when it has no override', () {
      final result = listing(
        entries,
        scope: const DirectoryScope('/other'),
        folderOverrides: const {'/d': SortRule.sizeLargest},
      );

      expect(namesOf(result.entries), ['a.txt', 'b.txt']);
    });

    test('a search Listing uses the global Sort Rule, not a folder override', () {
      final result = listing(
        entries,
        scope: const SearchScope('/d'),
        folderOverrides: const {'/d': SortRule.sizeLargest},
      );

      expect(namesOf(result.entries), ['a.txt', 'b.txt']);
    });
  });

  group('Filter', () {
    final entries = [
      entry('/d/a.png'),
      entry('/d/b.txt'),
      entry('/d/c.mp3'),
      entry('/d/sub', isDirectory: true),
    ];

    test('narrows the Listing to the matching Kinds', () {
      final result = listing(entries, filter: FileFilterType.images);

      expect(namesOf(result.entries), ['sub', 'a.png']);
    });

    test('keeps the text files under a Filter of documents', () {
      final result = listing(
        [entry('/d/a.pdf'), entry('/d/b.txt'), entry('/d/c.png')],
        filter: FileFilterType.documents,
      );

      expect(namesOf(result.entries), ['a.pdf', 'b.txt']);
    });

    test('hides the folders when the user asked to hide them under a Filter', () {
      final result = listing(
        entries,
        filter: FileFilterType.images,
        showFoldersInFilter: false,
      );

      expect(namesOf(result.entries), ['a.png']);
    });

    test('a Filter of all keeps every entry', () {
      final result = listing(entries);

      expect(namesOf(result.entries), ['sub', 'a.png', 'b.txt', 'c.mp3']);
    });

    test('a search Listing is not narrowed by the directory Filter', () {
      // The search narrowed its own results with its own vocabulary; the Filter of
      // the directory does not narrow them again.
      final result = listing(
        [entry('/d/a.png'), entry('/d/b.txt')],
        scope: const SearchScope('/d'),
        filter: FileFilterType.images,
      );

      expect(namesOf(result.entries), ['a.png', 'b.txt']);
    });
  });

  group('Hidden entries', () {
    test('are absent unless the user asked to see them', () {
      final result = listing([
        entry('/d/.hidden.txt'),
        entry('/d/visible.txt'),
        entry('/d/.hidden-folder', isDirectory: true),
      ]);

      expect(namesOf(result.entries), ['visible.txt']);
    });

    test('appear when the user asked to see them', () {
      final result = listing(
        [
          entry('/d/.hidden.txt'),
          entry('/d/visible.txt'),
          entry('/d/.hidden-folder', isDirectory: true),
        ],
        showHiddenFiles: true,
      );

      expect(namesOf(result.entries), ['.hidden-folder', '.hidden.txt', 'visible.txt']);
    });
  });
}
