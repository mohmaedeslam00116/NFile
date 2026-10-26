import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:openfile/main.dart';
import 'package:openfile/providers/file_manager_provider.dart';
import 'package:openfile/providers/media_provider.dart';

void main() {
  testWidgets('OpenFileApp initialization smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FileManagerProvider()),
          ChangeNotifierProvider(create: (_) => MediaProvider()),
        ],
        child: const OpenFileApp(),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
