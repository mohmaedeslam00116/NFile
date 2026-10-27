import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openfile/l10n/app_localizations.dart';
import 'package:openfile/providers/file_manager_provider.dart';
import 'package:openfile/providers/media_provider.dart';
import 'package:openfile/ui/widgets/nfile_drawer.dart';
import 'package:provider/provider.dart';

import 'app_test_harness.dart';

/// The drawer: the old name is gone, and the file menu no longer offers the
/// system root. (Upstream #107.)
void main() {
  Future<void> pumpDrawer(
    WidgetTester tester, {
    Locale locale = const Locale('en'),
  }) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FileManagerProvider()),
          ChangeNotifierProvider(create: (_) => MediaProvider()),
        ],
        child: appUnderTest(
          locale: locale,
          home: Scaffold(
            body: OpenFileDrawer(toggleTheme: () {}),
          ),
        ),
      ),
    );
  }

  testWidgets('the header reads OpenFile, not NFile', (tester) async {
    await pumpDrawer(tester);

    expect(find.text('OpenFile'), findsOneWidget);
    expect(find.text('NFile'), findsNothing);
  });

  testWidgets('the file menu has no System root entry', (tester) async {
    await pumpDrawer(tester, locale: const Locale('ar'));

    final context = tester.element(find.byType(OpenFileDrawer));
    final l10n = AppLocalizations.of(context);

    expect(find.text(l10n.systemRoot), findsNothing);
  });
}
