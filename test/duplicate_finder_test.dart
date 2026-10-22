import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/services/duplicate_finder_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('nfile_dup_');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('findDuplicates groups files with identical content', () async {
    // Two files with identical content, one with different content.
    final a = File(p.join(tempDir.path, 'a.txt'))..writeAsStringSync('hello');
    final b = File(p.join(tempDir.path, 'b.txt'))..writeAsStringSync('hello');
    final c = File(p.join(tempDir.path, 'c.txt'))..writeAsStringSync('world');

    final groups = await DuplicateFinderService.findDuplicates(tempDir.path);

    // Exactly one group of duplicates, containing a and b.
    expect(groups.length, 1);
    final group = groups.values.first;
    expect(group.toSet(), {a.path, b.path});
    expect(group, isNot(contains(c.path)));
  });

  test('findDuplicates returns empty when no duplicates', () async {
    File(p.join(tempDir.path, 'a.txt')).writeAsStringSync('one');
    File(p.join(tempDir.path, 'b.txt')).writeAsStringSync('two');

    final groups = await DuplicateFinderService.findDuplicates(tempDir.path);

    expect(groups, isEmpty);
  });
}
