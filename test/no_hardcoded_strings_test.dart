import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'support/label_scan.dart';

/// A string the user reads that is written in the source.
///
/// The application speaks two languages, and a string that is written in the
/// source cannot be translated: it is the same in every language. Every string
/// the user reads has to be asked for by name, so that a translation has a
/// place to live.
///
/// The ledger is the inventory of what is left. It holds two lists:
///
/// - `allow`: the names that are technical and will never be translated — a
///   mime type, a path, a date format, an id.
/// - `todo`: the strings the user reads and that are still hardcoded.
///
/// The source and the ledger must agree exactly: a string that is not in the
/// ledger is a string that slipped in, and an entry that is not in the source
/// is an entry that rotted.
void main() {
  final ledger = _readLedger();

  test('the source holds no string that is not in the ledger', () {
    final occurrences = _hardcodedStrings();
    final known = technicalNames();
    final found = occurrences.keys.toSet().difference(known);
    final expected = ledger['todo']!.toSet();

    final slippedIn = found.difference(expected).toList()..sort();
    final rotted = expected.difference(found).toList()..sort();

    expect(
      slippedIn,
      isEmpty,
      reason: 'These strings are written in the source and are not in the '
          'ledger. A string the user reads must be asked for by name, so '
          'that it can be translated.\n'
          '${slippedIn.join('\n')}\n\n'
          'They are written in:\n${_where(occurrences, slippedIn)}',
    );

    expect(
      rotted,
      isEmpty,
      reason: 'These strings are in the ledger and are not written in the '
          'source any more. The ledger must follow the source.\n'
          '${rotted.join('\n')}',
    );
  });

  test('the ledger keeps no name that means nothing', () {
    final occurrences = _literals().keys.toSet();
    final rotted = technicalNames().difference(occurrences);

    expect(
      rotted,
      isEmpty,
      reason: 'These names are kept out of the translation, but they are '
          'not written in the source any more.\n'
          '${rotted.join('\n')}',
    );
  });

  test('the ledger holds every string of the source, and nothing more', () {
    // The ledger is the work list: it is the set of the strings that are still
    // hardcoded, and it must be exactly that. The two lists above agree with
    // the source, so the two lists above agree with each other.
    expect(
      ledger['allow']!.toSet().intersection(ledger['todo']!.toSet()),
      isEmpty,
      reason: 'A string cannot be in both lists of the ledger.',
    );
  });

  test('the ledger is empty', () {
    // The work is done: no string the user reads is written in the source.
    expect(
      ledger['todo'],
      isEmpty,
      reason: 'These strings are still written in the source:\n'
          '${ledger['todo']!.join('\n')}',
    );
  });

  test('no key of a map is a translation', () {
    // A label is what the user reads, an id is what the program stores. A key
    // of a map is an id: the program looks it up, and a translation would
    // break the lookup without translating anything the user reads.
    final offenders = <String>[];

    for (final file in Directory('lib').listSync(recursive: true)) {
      if (file is! File || !file.path.endsWith('.dart')) continue;

      final path = file.path.replaceAll('\\', '/');
      if (path.contains('lib/l10n/')) continue;

      final lines = file.readAsLinesSync();
      for (var index = 0; index < lines.length; index++) {
        if (RegExp(r'^\s*AppLocalizations\.of\(context\)\.\w+\s*:')
            .hasMatch(lines[index])) {
          offenders.add('$path:${index + 1}');
        }
      }
    }

    expect(
      offenders,
      isEmpty,
      reason: 'A key of a map is an id, and an id is never translated.\n'
          '${offenders.join('\n')}',
    );
  });
}

/// The strings of the source that the user reads, with the place they are
/// written in.
Map<String, List<String>> _hardcodedStrings() => labelsInSource(_paths());

/// Every string literal of the source, with the place it is written in.
Map<String, List<String>> _literals() => literalsInSource(_paths());

/// The files of the source, the translation apart.
List<String> _paths() {
  final paths = <String>[];
  for (final file in Directory('lib').listSync(recursive: true)) {
    if (file is! File || !file.path.endsWith('.dart')) continue;

    final path = file.path.replaceAll('\\', '/');
    // The translation itself is written in the source: it holds the English
    // strings on purpose.
    if (path.contains('lib/l10n/')) continue;

    paths.add(path);
  }
  return paths;
}

/// The ledger of the hardcoded strings.
Map<String, List<String>> _readLedger() {
  final content = json.decode(
    File('test/fixtures/hardcoded_strings.json').readAsStringSync(),
  ) as Map;
  return {
    'allow': (content['allow'] as List).cast<String>(),
    'todo': (content['todo'] as List).cast<String>(),
  };
}

/// Where the strings are written, for the message of a failure.
String _where(Map<String, List<String>> found, List<String> strings) =>
    strings.expand((string) => found[string]!).join('\n');
