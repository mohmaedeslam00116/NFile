import 'dart:convert';
import 'dart:io';

/// The strings the user reads that are written in the source, with the place
/// they are written in.
///
/// Every string that is written in the source is a string the application
/// cannot translate: it is the same in every language. A string that is
/// technical — a name, a path, a format, an id — is kept in the ledger; a
/// string the user reads is asked for by name, and it lives in the
/// translation.
///
/// The guard of the areas and the guard of the whole source read the source
/// the same way, so that a string that is written outside the areas is held
/// against the source as well.
Map<String, List<String>> labelsInSource(List<String> paths) {
  final found = <String, List<String>>{};

  for (final path in paths) {
    final file = File(path);
    if (!file.existsSync()) {
      throw StateError('The file $path does not exist.');
    }

    final lines = file.readAsLinesSync();
    final kept = lines
        .where((line) => !line.contains('debugPrint'))
        .map((line) => line.replaceAll(RegExp(r'(?<!:)//.*$'), ''))
        .toList();
    final text = kept.join('\n');

    for (final match in _literal.allMatches(text)) {
      final raw = match.group(0)!;
      final value = raw.substring(1, raw.length - 1);
      if (!_looksLikeALabel(value)) continue;
      if (_isTechnical(value)) continue;
      if (_isKey(text, match.end)) continue;
      if (_isCompared(text, match.start)) continue;
      final line = '\n'.allMatches(text.substring(0, match.start)).length;
      found.putIfAbsent(value, () => <String>[]).add('$path:${line + 1}');
    }
  }

  return found;
}

/// Every string literal that is written in the source, with the place it is
/// written in.
///
/// The ledger holds the names that are technical. A name that the guard skips
/// by its shape — a path, a format — is in the ledger all the same, and this
/// scan is the one that says whether it is still written in the source.
Map<String, List<String>> literalsInSource(List<String> paths) {
  final found = <String, List<String>>{};

  for (final path in paths) {
    final file = File(path);
    if (!file.existsSync()) {
      throw StateError('The file $path does not exist.');
    }

    final lines = file.readAsLinesSync();
    final kept = lines
        .where((line) => !line.contains('debugPrint'))
        .map((line) => line.replaceAll(RegExp(r'(?<!:)//.*$'), ''))
        .toList();
    final text = kept.join('\n');

    for (final match in _literal.allMatches(text)) {
      final raw = match.group(0)!;
      final value = raw.substring(1, raw.length - 1);
      final line = '\n'.allMatches(text.substring(0, match.start)).length;
      found.putIfAbsent(value, () => <String>[]).add('$path:${line + 1}');
    }
  }

  return found;
}

/// The names that are technical, and that are never translated.
Set<String> technicalNames() {
  final content = json.decode(
    File('test/fixtures/hardcoded_strings.json').readAsStringSync(),
  ) as Map;
  final allow = (content['allow'] as List).cast<String>().toSet();
  final technical = (content['technical'] as List?)?.cast<String>().toSet() ??
      <String>{};
  return {...allow, ...technical};
}

/// Whether a string is a label the user reads, and not a name, a path or a
/// format.
///
/// A label is not only a sentence: `Copy` and `Home` are one word each, and
/// the user reads them as much as a sentence. A string that holds nothing but
/// a value and its marks is not a label: the user does not read it, the
/// program computes it.
///
/// The words inside an interpolation do not count: a string that holds
/// nothing but a call for the translation is not a label the user reads.
bool _looksLikeALabel(String value) {
  final words = _withoutInterpolations(value)
      .replaceAll(RegExp(r'\$[a-zA-Z_][a-zA-Z0-9_]*'), ' ');

  return RegExp('[A-Za-z]{2}').hasMatch(words);
}

/// Whether a string is technical, and is the same in every language.
///
/// A path, a link, an import, a format and an id are written in the source on
/// purpose: the program reads them, not the user. A name that is a brand —
/// `NFile`, `FTP` — is technical too: it is not translated, it is spelled.
bool _isTechnical(String value) {
  final bare = _withoutInterpolations(value);

  if (bare.contains(r'\')) return true;

  // A name with a space in it is a name the user reads: `SD Card` is a label,
  // and it is kept in the ledger when it is the name of a device.
  if (bare.contains(' ')) return false;

  // A path, a link or an import.
  if (bare.contains('/')) return true;

  // An import of a library of the language: `dart:io`.
  if (RegExp(r'^[a-z]+:[A-Za-z_]+$').hasMatch(bare)) return true;

  // A format.
  if (bare.startsWith('.')) return true;

  // An id: `label`, `count`, `close_others`.
  if (RegExp(r'^[a-z_][a-z0-9_]*$').hasMatch(bare)) return true;

  // A name of a package or of a file: `com.rubex.nfile.MainActivity`.
  if (RegExp(r'^[A-Za-z0-9_]+(\.[A-Za-z0-9_]+)+$').hasMatch(bare)) return true;

  return false;
}

/// Whether a string is the key of a map, and is therefore an id.
///
/// The key of a map is what the program looks up: a key is never translated.
/// The name the user reads is the value that belongs to it.
bool _isKey(String text, int end) => text.substring(end).startsWith(':');

/// Whether a string is compared with something, and is therefore an id.
///
/// `option == 'dateTime'` names a setting: the program looks it up. The name
/// the user reads is the one that is asked for by name.
bool _isCompared(String text, int start) {
  final before = text.substring(0, start).trimRight();
  return before.endsWith('==') || before.endsWith('!=');
}

/// The text of a string, without the interpolations.
String _withoutInterpolations(String value) {
  final buffer = StringBuffer();
  var depth = 0;

  for (var i = 0; i < value.length; i++) {
    final char = value[i];
    if (char == r'$' && i + 1 < value.length && value[i + 1] == '{') {
      depth++;
      i++;
      continue;
    }
    if (char == '}' && depth > 0) {
      depth--;
      continue;
    }
    if (depth == 0) buffer.write(char);
  }

  return buffer.toString();
}

/// The string literals of a line, with their quotes.
final RegExp _literal = RegExp(r'''('([^'\\\n]|\\.)*'|"([^"\\\n]|\\.)*")''');
