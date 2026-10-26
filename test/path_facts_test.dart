import 'package:flutter_test/flutter_test.dart';
import 'package:openfile/core/listing/path_facts.dart';
import 'package:openfile/core/listing/sort_rule.dart';
import 'package:path/path.dart' as p;

void main() {
  group('per-path facts', () {
    test('follow a renamed folder', () {
      final facts = PathFacts(
        folderOverrides: {'/d/old': SortRule.sizeLargest},
        pinnedPaths: const {'/d/old', '/d/old/inside'},
      );

      final moved = facts.moved('/d/old', '/d/new');

      expect(moved.folderOverrides, {'/d/new': SortRule.sizeLargest});
      expect(moved.pinnedPaths, {'/d/new', p.join('/d/new', 'inside')});
    });

    test('follow a moved folder', () {
      final facts = PathFacts(
        folderOverrides: {'/d/old': SortRule.sizeLargest},
        pinnedPaths: const {'/d/old'},
      );

      final moved = facts.moved('/d/old', '/e/other');

      expect(moved.folderOverrides, {'/e/other': SortRule.sizeLargest});
      expect(moved.pinnedPaths, {'/e/other'});
    });

    test('leave the facts of other paths alone', () {
      final facts = PathFacts(
        folderOverrides: {
          '/d/old': SortRule.sizeLargest,
          '/d/other': SortRule.nameDesc,
        },
        pinnedPaths: const {'/d/old', '/d/other', '/d/oldish'},
      );

      final moved = facts.moved('/d/old', '/d/new');

      expect(moved.folderOverrides['/d/other'], SortRule.nameDesc);
      expect(moved.pinnedPaths, containsAll(['/d/other', '/d/oldish']));
    });

    test('end with a deleted folder', () {
      final facts = PathFacts(
        folderOverrides: {
          '/d/gone': SortRule.sizeLargest,
          '/d/gone/inside': SortRule.nameDesc,
          '/d/other': SortRule.nameAsc,
        },
        pinnedPaths: const {'/d/gone', '/d/gone/inside', '/d/other'},
      );

      final after = facts.deleted('/d/gone');

      expect(after.folderOverrides, {'/d/other': SortRule.nameAsc});
      expect(after.pinnedPaths, {'/d/other'});
    });
  });
}
