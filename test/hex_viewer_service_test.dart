import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/services/hex_viewer_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('nfile_hex_');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('reads bytes as hex', () async {
    final f = File(p.join(tempDir.path, 'a.bin'))..writeAsBytesSync([0x48, 0x69, 0x21]);
    final hex = await HexViewerService.readHex(f.path);
    expect(hex, '486921');
  });

  test('returns null for missing file', () async {
    final hex = await HexViewerService.readHex(p.join(tempDir.path, 'nope.bin'));
    expect(hex, isNull);
  });
}
