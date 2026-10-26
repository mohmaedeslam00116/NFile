import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:openfile/services/vault_service.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// The records of the vault say what the locked files were: their names, where
/// they came from. That is what the vault hides, so the records are sealed with
/// the password as well.
class _FakePathProvider extends PathProviderPlatform {
  _FakePathProvider(this.root);

  final String root;

  @override
  Future<String?> getApplicationDocumentsPath() async => root;

  @override
  Future<String?> getTemporaryPath() async => root;
}

void main() {
  late Directory root;

  final record = VaultFileRecord(
    id: '1',
    originalName: 'secret.txt',
    originalPath: '/sdcard/secret.txt',
    scrambledPath: '/vault/secret.nfv',
    size: 10,
    lockedAt: '2026-10-20T00:00:00.000Z',
    isInPlace: false,
  );

  setUp(() async {
    root = await Directory.systemTemp.createTemp('nfile-vault');
    PathProviderPlatform.instance = _FakePathProvider(root.path);
  });

  tearDown(() async {
    if (await root.exists()) {
      await root.delete(recursive: true);
    }
  });

  group('the records of the vault', () {
    test('hold no name of the file in the clear', () async {
      await VaultService.saveRecords([record], 'the password');

      final file = await VaultService.getMetadataFile();
      final bytes = await file.readAsBytes();

      expect(
        utf8.decode(bytes, allowMalformed: true),
        isNot(contains('secret.txt')),
        reason: 'The name of a locked file is what the vault hides.',
      );
    });

    test('are read back', () async {
      await VaultService.saveRecords([record], 'the password');

      final records = await VaultService.loadRecords('the password');

      expect(records, hasLength(1));
      expect(records.first.originalName, 'secret.txt');
      expect(records.first.originalPath, '/sdcard/secret.txt');
    });

    test('are not read with the wrong password', () async {
      await VaultService.saveRecords([record], 'the password');

      expect(await VaultService.loadRecords('another password'), isEmpty);
    });

    test('the ones the old version wrote in the clear are still read', () async {
      final file = await VaultService.getMetadataFile();
      await file.writeAsString(jsonEncode([record.toJson()]));

      final records = await VaultService.loadRecords('the password');

      expect(records, hasLength(1));
      expect(records.first.originalName, 'secret.txt');
    });
  });
}
