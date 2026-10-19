import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/listing/path_facts.dart';
import 'package:nfile/core/listing/sort_rule.dart';
import 'package:path/path.dart' as p;

void main() {
  group('per-path facts', () {
    test('follow a renamed folder', () {
      final facts = PathFacts(
        folderOverrides: {'/d/old': FileSortType.sizeLargest},
        pinnedPaths: const {'/d/old', '/d/old/inside'},
      );

      final moved = facts.moved('/d/old', '/d/new');

      expect(moved.folderOverrides, {'/d/new': FileSortType.sizeLargest});
      expect(moved.pinnedPaths, {'/d/new', p.join('/d/new', 'inside')});
    });

    test('follow a moved folder', () {
      final facts = PathFacts(
        folderOverrides: {'/d/old': FileSortType.sizeLargest},
        pinnedPaths: const {'/d/old'},
      );

      final moved = facts.moved('/d/old', '/e/other');

      expect(moved.folderOverrides, {'/e/other': FileSortType.sizeLargest});
      expect(moved.pinnedPaths, {'/e/other'});
    });

    test('leave the facts of other paths alone', () {
      final facts = PathFacts(
        folderOverrides: {
          '/d/old': FileSortType.sizeLargest,
          '/d/other': FileSortType.nameDesc,
        },
        pinnedPaths: const {'/d/old', '/d/other', '/d/oldish'},
      );

      final moved = facts.moved('/d/old', '/d/new');

      expect(moved.folderOverrides['/d/other'], FileSortType.nameDesc);
      expect(moved.pinnedPaths, containsAll(['/d/other', '/d/oldish']));
    });

    test('end with a deleted folder', () {
      final facts = PathFacts(
        folderOverrides: {
          '/d/gone': FileSortType.sizeLargest,
          '/d/gone/inside': FileSortType.nameDesc,
          '/d/other': FileSortType.nameAsc,
        },
        pinnedPaths: const {'/d/gone', '/d/gone/inside', '/d/other'},
      );

      final after = facts.deleted('/d/gone');

      expect(after.folderOverrides, {'/d/other': FileSortType.nameAsc});
      expect(after.pinnedPaths, {'/d/other'});
    });
  });
}
