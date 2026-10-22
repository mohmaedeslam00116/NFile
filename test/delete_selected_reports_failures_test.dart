import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/models/folder_tab_model.dart';
import 'package:nfile/providers/file_manager_provider.dart';
import 'package:nfile/services/pin_service.dart';
import 'package:nfile/services/preferences_service.dart';
import 'package:nfile/services/recycle_bin_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const pathProviderChannel = MethodChannel('plugins.flutter.io/path_provider');

  late Directory tempDir;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await PreferencesService.init();
    await PinService.init();
    await RecycleBinService.init();
    tempDir = await Directory.systemTemp.createTemp('nfile_delete_selected_');

    // `loadDirectory` (called at the end of `deleteSelected`) probes the
    // storage volumes through path_provider, which has no implementation in
    // a unit test. Pretend the documents directory is the temp dir.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProviderChannel, (call) async {
      if (call.method == 'getApplicationDocumentsDirectory') {
        return tempDir.path;
      }
      return null;
    });
  });

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProviderChannel, null);
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('deleteSelected reports a partial failure instead of claiming success', () async {
    // Two real files that can be deleted, plus one path that does not exist.
    final fileA = File('${tempDir.path}/a.txt')..writeAsStringSync('a');
    final fileB = File('${tempDir.path}/b.txt')..writeAsStringSync('b');
    final missing = '${tempDir.path}/does-not-exist.txt';

    final tab = FolderTab(
      id: 'tab-1',
      currentPath: tempDir.path,
      selectedPaths: {fileA.path, fileB.path, missing},
    );

    final provider = FileManagerProvider();
    provider.tabs.add(tab);

    final failures = await provider.deleteSelected();

    // The two real files are gone...
    expect(await fileA.exists(), isFalse);
    expect(await fileB.exists(), isFalse);
    // ...and the one that could not be deleted is reported, not hidden.
    expect(failures, 1);
  });
}
