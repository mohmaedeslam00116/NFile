import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openfile/core/l10n/bidi.dart';
import 'package:openfile/ui/widgets/file_name_text.dart';

import 'app_test_harness.dart';

/// The direction a name reads.
///
/// The interface reads from the right in Arabic, but a file name keeps the
/// direction it is written in. A Latin name must keep its beginning visible,
/// and an Arabic name must stay right to left.
void main() {
  group('the direction a name reads', () {
    test('a Latin name reads left to right', () {
      expect(textDirectionOf('DESIGN-HANDOFF.md'), TextDirection.ltr);
    });

    test('an Arabic name reads right to left', () {
      expect(textDirectionOf('مجلس تاديب.pdf'), TextDirection.rtl);
    });

    test('numbers and punctuation alone read left to right', () {
      expect(textDirectionOf('2024-10-27.pdf'), TextDirection.ltr);
    });

    test('the first strong letter decides a mixed name', () {
      expect(textDirectionOf('report-تقرير.pdf'), TextDirection.ltr);
      expect(textDirectionOf('تقرير-report.pdf'), TextDirection.rtl);
    });

    test('an empty name reads left to right', () {
      expect(textDirectionOf(''), TextDirection.ltr);
    });
  });

  group('the alignment of a name', () {
    test('a name in the direction of the interface starts at the start', () {
      expect(textAlignFor(TextDirection.ltr, TextDirection.ltr), TextAlign.start);
      expect(textAlignFor(TextDirection.rtl, TextDirection.rtl), TextAlign.start);
    });

    test('a name against the direction of the interface keeps the start edge', () {
      expect(textAlignFor(TextDirection.ltr, TextDirection.rtl), TextAlign.end);
      expect(textAlignFor(TextDirection.rtl, TextDirection.ltr), TextAlign.end);
    });
  });

  group('the name the user reads', () {
    testWidgets('a Latin name in an Arabic interface keeps its start edge',
        (tester) async {
      await tester.pumpWidget(
        appUnderTest(
          home: const Directionality(
            textDirection: TextDirection.rtl,
            child: FileNameText('DESIGN-HANDOFF.md'),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('DESIGN-HANDOFF.md'));
      expect(text.textDirection, TextDirection.ltr);
      expect(text.textAlign, TextAlign.end);
    });

    testWidgets('an Arabic name in an Arabic interface reads right to left',
        (tester) async {
      await tester.pumpWidget(
        appUnderTest(
          locale: const Locale('ar'),
          home: const Directionality(
            textDirection: TextDirection.rtl,
            child: FileNameText('مجلس تاديب.pdf'),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('مجلس تاديب.pdf'));
      expect(text.textDirection, TextDirection.rtl);
      expect(text.textAlign, TextAlign.start);
    });

    testWidgets('a Latin name in an English interface reads left to right',
        (tester) async {
      await tester.pumpWidget(
        appUnderTest(
          home: const Directionality(
            textDirection: TextDirection.ltr,
            child: FileNameText('DESIGN-HANDOFF.md'),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('DESIGN-HANDOFF.md'));
      expect(text.textDirection, TextDirection.ltr);
      expect(text.textAlign, TextAlign.start);
    });
  });
}
