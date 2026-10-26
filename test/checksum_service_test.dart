import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:flutter_test/flutter_test.dart';
import 'package:openfile/services/checksum_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('nfile_checksum_');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('computes sha256 of a file', () async {
    final f = File(p.join(tempDir.path, 'a.txt'))..writeAsStringSync('hello');
    final hash = await ChecksumService.compute(f.path, 'sha256');
    // sha256('hello')
    expect(hash, '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824');
  });

  test('computes md5 of a file', () async {
    final f = File(p.join(tempDir.path, 'a.txt'))..writeAsStringSync('hello');
    final hash = await ChecksumService.compute(f.path, 'md5');
    expect(hash, '5d41402abc4b2a76b9719d911017c592');
  });

  test('returns null for missing file', () async {
    final hash = await ChecksumService.compute(p.join(tempDir.path, 'nope.txt'), 'sha256');
    expect(hash, isNull);
  });
}
