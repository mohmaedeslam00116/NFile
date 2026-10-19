import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/listing/listing_builder.dart';
import 'package:nfile/core/listing/sort_rule.dart';
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

void main() {
  group('Listing', () {
    test('places folders before files, each group ordered by the Sort Rule', () {
      final listing = ListingBuilder().build(
        entries: [
          entry('/d/b', isDirectory: true),
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
