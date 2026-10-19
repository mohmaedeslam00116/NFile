import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/kind.dart';
import 'package:nfile/core/listing/filter_rule.dart';
import 'package:nfile/models/file_filter_type.dart';
import 'package:nfile/providers/file_manager_provider.dart';

void main() {
  group('Kind', () {
    test('a file may answer to more than one Kind', () {
      // `.ts` is code and a transport stream. The application has always shown it
      // under both filters, and the Kind vocabulary does not re-judge that.
      expect(kindsOf('/d/app.ts'), contains(Kind.text));
      expect(kindsOf('/d/app.ts'), contains(Kind.video));
    });

    test('a file with no extension is text', () {
      expect(kindsOf('/d/LICENSE'), contains(Kind.text));
    });

    test('a file of no known kind answers to one kind only', () {
      expect(kindsOf('/d/thing.xyz'), {Kind.other});
    });
  });

  group('the Filter of the application', () {
    test('keeps a TypeScript file under documents and under videos', () {
      expect(
        FileManagerProvider.matchesFilterForType(
          '/d/app.ts',
          FileFilterType.documents,
        ),
        isTrue,
      );
      expect(
        FileManagerProvider.matchesFilterForType(
          '/d/app.ts',
          FileFilterType.videos,
        ),
        isTrue,
      );
    });

    test('keeps a text file under documents and not under images', () {
      expect(
        FileManagerProvider.matchesFilterForType(
          '/d/notes.txt',
          FileFilterType.documents,
        ),
        isTrue,
      );
      expect(
        FileManagerProvider.matchesFilterForType(
          '/d/notes.txt',
          FileFilterType.images,
        ),
        isFalse,
      );
    });

    test('agrees with the Kind vocabulary about every file', () {
      const files = [
        '/d/a.png',
        '/d/b.txt',
        '/d/c.mp3',
        '/d/d.zip',
        '/d/e.pdf',
        '/d/app.ts',
        '/d/LICENSE',
        '/d/thing.xyz',
      ];

      for (final file in files) {
        for (final filter in FileFilterType.values) {
          expect(
            FileManagerProvider.matchesFilterForType(file, filter),
            matchesFilter(kindsOf(file), filter),
            reason: '$file under $filter',
          );
        }
      }
    });
  });
}
