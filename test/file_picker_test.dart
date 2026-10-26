import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openfile/providers/file_manager_provider.dart';
import 'package:openfile/services/preferences_service.dart';
import 'package:openfile/ui/screens/internal_file_picker_screen.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({'cached_total_storage': 1024});
    await PreferencesService.init();
  });

  testWidgets(
    'the picker orders its entries with the Sort Rule of the application',
    (tester) async {
      late Directory dir;
      // A widget test runs in a fake clock: the real reading of the disk has to
      // happen in the real zone, or it never finishes.
      await tester.runAsync(() async {
        dir = await Directory.systemTemp.createTemp('nfile-picker');
        // The names and the sizes order these two files differently.
        await File(p.join(dir.path, 'a.txt')).writeAsString('aa');
        await File(p.join(dir.path, 'b.txt')).writeAsString('b' * 20);
      });
      addTearDown(() => dir.delete(recursive: true));

      final provider = FileManagerProvider();
      provider.setSortType(SortRule.sizeLargest);

      // The screen reads the disk when it starts, so it has to be built in the
      // real zone: in the fake zone the reading never finishes.
      await tester.runAsync(() async {
        await tester.pumpWidget(
          ChangeNotifierProvider.value(
            value: provider,
            child: appUnderTest(home: InternalFilePickerScreen(rootPath: dir.path)),
          ),
        );
        await Future<void>.delayed(const Duration(milliseconds: 300));
      });
      await tester.pump();

      final names = tester
          .widgetList<Text>(find.byType(Text))
          .map((text) => text.data)
          .whereType<String>()
          .toList();

      expect(names, containsAll(['a.txt', 'b.txt']));
      expect(names.indexOf('b.txt'), lessThan(names.indexOf('a.txt')));
    },
    timeout: const Timeout(Duration(seconds: 30)),
  );
}
