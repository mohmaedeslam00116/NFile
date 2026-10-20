import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// A string the user reads that is written in the source.
///
/// The application speaks two languages, and a string that is written in the
/// source cannot be translated: it is the same in every language. Every string
/// the user reads has to be asked for by name, so that a translation has a
/// place to live.
///
/// The ledger is the inventory of what is left. It holds two lists:
///
/// - `allow`: the strings that are technical and will never be translated — a
///   mime type, a path, a date format.
/// - `todo`: the strings the user reads and that are still hardcoded.
///
/// The source and the ledger must agree exactly: a string that is not in the
/// ledger is a string that slipped in, and an entry that is not in the source
/// is an entry that rotted.
void main() {
  final ledger = _readLedger();

  test('the source holds no string that is not in the ledger', () {
    final occurrences = _hardcodedStrings();
    final allow = ledger['allow']!.toSet();
    final found = occurrences.keys.toSet().difference(allow);
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
    final occurrences = _hardcodedStrings().keys.toSet();
    final rotted = ledger['allow']!.toSet().difference(occurrences);

    expect(
      rotted,
      isEmpty,
      reason: 'These strings are kept out of the translation, but they are '
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
}

/// The strings of the source that the user reads, with the place they are
/// written in.
Map<String, List<String>> _hardcodedStrings() {
  final found = <String, List<String>>{};

  for (final file in Directory('lib').listSync(recursive: true)) {
    if (file is! File || !file.path.endsWith('.dart')) continue;

    final path = file.path.replaceAll('\\', '/');
    // The translation itself is written in the source: it holds the English
    // strings on purpose.
    if (path.contains('lib/l10n/')) continue;

    final lines = file.readAsLinesSync();
    // A line that writes to the log is not read by the user.
    final kept = lines
        .where((line) => !line.contains('debugPrint'))
        .map((line) => line.replaceAll(RegExp(r'(?<!:)//.*$'), ''))
        .toList();
    final text = kept.join('\n');

    for (final match in _marker.allMatches(text)) {
      final rest = text.substring(match.end);
      final literal = _literal.firstMatch(rest);
      if (literal == null) continue;

      final raw = literal.group(0)!;
      final value = raw.substring(1, raw.length - 1);
      if (!_looksLikeProse(value)) continue;

      final line = '\n'.allMatches(text.substring(0, match.end)).length;
      found.putIfAbsent(value, () => <String>[]).add('$path:${line + 1}');
    }
  }

  return found;
}

/// Whether a string is a sentence the user reads, and not a name, a path or a
/// format.
bool _looksLikeProse(String value) =>
    value.contains(' ') && RegExp('[A-Za-z]{3}').hasMatch(value);

/// The places where a string is read by the user.
final RegExp _marker = RegExp(
  r'''\b(?:Text|title|label|tooltip|hintText|hint|subtitle|semanticLabel|contentText|labelText|helperText|placeholder|counterText|prefixText|suffixText|errorText|displayName|filterLabel|primaryLabel|secondaryLabel)\s*:\s*|\bText\s*\(\s*''',
);

/// The string literals of a line, with their quotes. The anchor matters: only
/// the literal that follows the marker is the one the user reads.
final RegExp _literal = RegExp(r'''^('([^'\\\n]|\\.)*'|"([^"\\\n]|\\.)*")''');

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
