import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openfile/providers/file_manager_provider.dart';
import 'package:openfile/ui/widgets/storage_overview_grid.dart';

import 'app_test_harness.dart';

/// The storage overview on the home screen.
///
/// One volume fills the width of the screen, and two or more volumes sit side
/// by side so the user sees all of them without swiping. The free and total
/// values keep their left-to-right reading in an Arabic interface.
void main() {
  StorageVolume volume({
    required String path,
    required bool isInternal,
    required double totalGiB,
    required double freeGiB,
    String name = 'Internal Storage',
  }) {
    final totalBytes = (totalGiB * 1024 * 1024 * 1024).round();
    final freeBytes = (freeGiB * 1024 * 1024 * 1024).round();
    return StorageVolume(
      name: name,
      path: path,
      isInternal: isInternal,
      totalBytes: totalBytes,
      usedBytes: totalBytes - freeBytes,
    );
  }

  testWidgets('one volume fills the width and shows its free and total values',
      (tester) async {
    final internal = volume(
      path: '/storage/emulated/0',
      isInternal: true,
      totalGiB: 64,
      freeGiB: 15.54,
    );
    String? browsed;

    await tester.pumpWidget(
      appUnderTest(
        home: Scaffold(
          body: StorageOverviewGrid(
            volumes: [internal],
            onBrowseVolume: (path) => browsed = path,
          ),
        ),
      ),
    );

    final card = find.byKey(const ValueKey('storage-card-/storage/emulated/0'));
    expect(card, findsOneWidget);
    expect(tester.getSize(card).width, 800 - 32);

    expect(find.text('free'), findsOneWidget);
    expect(find.text('total'), findsOneWidget);

    final free = tester.widget<Text>(find.text('15.54 GB'));
    expect(free.textDirection, TextDirection.ltr);

    await tester.tap(card);
    expect(browsed, '/storage/emulated/0');
  });

  testWidgets('two volumes share one row', (tester) async {
    final internal = volume(
      path: '/storage/emulated/0',
      isInternal: true,
      totalGiB: 64,
      freeGiB: 15.54,
    );
    final sdCard = volume(
      name: 'SD Card (7E5E-1A)',
      path: '/storage/7E5E-1A',
      isInternal: false,
      totalGiB: 64,
      freeGiB: 24.39,
    );

    await tester.pumpWidget(
      appUnderTest(
        home: Scaffold(
          body: StorageOverviewGrid(
            volumes: [internal, sdCard],
            onBrowseVolume: (_) {},
          ),
        ),
      ),
    );

    final internalRect = tester.getRect(
      find.byKey(const ValueKey('storage-card-/storage/emulated/0')),
    );
    final sdRect = tester.getRect(
      find.byKey(const ValueKey('storage-card-/storage/7E5E-1A')),
    );

    expect(internalRect.width, closeTo(378, 0.5));
    expect(sdRect.width, closeTo(378, 0.5));
    expect(internalRect.top, sdRect.top);
  });

  testWidgets('an odd last volume spans the row on its own', (tester) async {
    final volumes = [
      volume(
        path: '/storage/emulated/0',
        isInternal: true,
        totalGiB: 64,
        freeGiB: 15.54,
      ),
      volume(
        name: 'SD Card (7E5E-1A)',
        path: '/storage/7E5E-1A',
        isInternal: false,
        totalGiB: 64,
        freeGiB: 24.39,
      ),
      volume(
        name: 'SD Card / USB (1234-ABCD)',
        path: '/storage/1234-ABCD',
        isInternal: false,
        totalGiB: 32,
        freeGiB: 8,
      ),
    ];

    await tester.pumpWidget(
      appUnderTest(
        home: Scaffold(
          body: StorageOverviewGrid(
            volumes: volumes,
            onBrowseVolume: (_) {},
          ),
        ),
      ),
    );

    final first = tester.getRect(
      find.byKey(const ValueKey('storage-card-/storage/emulated/0')),
    );
    final last = tester.getRect(
      find.byKey(const ValueKey('storage-card-/storage/1234-ABCD')),
    );

    expect(first.width, closeTo(378, 0.5));
    expect(last.width, closeTo(768, 0.5));
    expect(last.top, greaterThan(first.top));
  });
}
