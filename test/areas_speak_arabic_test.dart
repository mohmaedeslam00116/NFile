import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The areas of the application, and the files of each of them.
///
/// An area is a group of files that the user sees together. Every area speaks
/// Arabic when its turn comes, and the test says so: a string that is written
/// in the source of an area is a string that the area does not speak Arabic
/// yet.
void main() {
  final areas = <String, List<String>>{
    'the frame': [
      'lib/ui/screens/home_screen.dart',
      'lib/ui/widgets/nfile_drawer.dart',
      'lib/ui/widgets/quick_categories_grid.dart',
      'lib/ui/screens/global_search_screen.dart',
      'lib/ui/screens/all_recent_files_screen.dart',
      'lib/ui/screens/about_screen.dart',
      'lib/ui/widgets/pane_browser.dart',
      'lib/ui/widgets/storage_overview.dart',
      'lib/ui/widgets/premium_storage_overview.dart',
      'lib/ui/widgets/swipable_storage_overview.dart',
      'lib/ui/widgets/recent_files_section.dart',
      'lib/ui/widgets/drag_drop_handler.dart',
      'lib/ui/widgets/directory_tab_bar.dart',
      'lib/ui/widgets/nfile_address_bar.dart',
      'lib/ui/widgets/tab_options_sheet.dart',
      'lib/ui/widgets/open_with_sheet.dart',
      'lib/ui/widgets/restricted_folder_banner.dart',
      'lib/ui/widgets/folder_grid_item.dart',
      'lib/ui/widgets/file_item.dart',
      'lib/ui/widgets/folder_item.dart',
      'lib/providers/file_manager_provider.dart',
      'lib/ui/widgets/settings_search.dart',
    ],
    'the directory': [
      'lib/ui/screens/directory_screen.dart',
      'lib/ui/widgets/selection_action_bar.dart',
      'lib/ui/widgets/selection_context_bottom_sheet.dart',
      'lib/ui/widgets/batch_rename_dialog.dart',
      'lib/ui/widgets/drag_drop_action_dialog.dart',
      'lib/ui/widgets/file_filter_bottom_sheet.dart',
      'lib/ui/widgets/create_archive_dialog.dart',
      'lib/ui/widgets/conflict_dialog.dart',
      'lib/ui/widgets/extract_archive_dialog.dart',
      'lib/ui/widgets/file_operation_progress_dialog.dart',
      'lib/ui/widgets/background_operation_progress_dialog.dart',
      'lib/services/folder_share_service.dart',
      'lib/ui/screens/internal_file_picker_screen.dart',
    ],
    'the settings': [
      'lib/ui/screens/more_settings_screen.dart',
      'lib/ui/screens/backup_settings_screen.dart',
      'lib/services/settings_backup_service.dart',
      'lib/services/apk_installer_service.dart',
    ],
    'the media and the viewers': [
      'lib/ui/screens/media_category_screen.dart',
      'lib/ui/screens/document_viewer_screen.dart',
      'lib/ui/screens/archive_viewer_screen.dart',
      'lib/ui/screens/text_editor_screen.dart',
      'lib/ui/screens/database_reader_screen.dart',
      'lib/ui/screens/audio_player/audio_player_screen.dart',
      'lib/ui/screens/audio_player/lyrics_dialog.dart',
      'lib/ui/screens/audio_player/audio_controls_widget.dart',
      'lib/ui/screens/audio_player/audio_queue_sheet.dart',
      'lib/ui/screens/audio_player/audio_artwork_widget.dart',
      'lib/ui/screens/video_player/video_controls_overlay.dart',
      'lib/ui/screens/video_player/video_seek_indicator.dart',
      'lib/ui/screens/video_player/vertical_slider_widget.dart',
      'lib/ui/screens/video_player/video_player_screen.dart',
      'lib/ui/screens/image_viewer_screen.dart',
      'lib/ui/screens/markdown_viewer_screen.dart',
      'lib/ui/screens/html_viewer_screen.dart',
      'lib/ui/screens/recycle_bin_screen.dart',
      'lib/services/intent_handler_service.dart',
      'lib/services/background_archive_service.dart',
    ],
    'the connections and the vault': [
      'lib/ui/screens/web_sharing_screen.dart',
      'lib/ui/screens/ftp_server_screen.dart',
      'lib/ui/screens/network_connection_wizard_screen.dart',
      'lib/ui/screens/remote_explorer_screen.dart',
      'lib/ui/screens/vault_explorer_screen.dart',
      'lib/ui/screens/vault_lock_screen.dart',
    ],
    'the storage analyzer': [
      'lib/ui/screens/storage_analyzer/storage_analyzer_screen.dart',
      'lib/ui/screens/storage_analyzer/app_manager_screen.dart',
      'lib/ui/screens/storage_analyzer/widgets/app_options_sheet.dart',
      'lib/ui/screens/storage_analyzer/widgets/backup_list_tab.dart',
      'lib/ui/screens/storage_analyzer/widgets/app_batch_action_bar.dart',
      'lib/ui/screens/storage_analyzer/widgets/app_list_tab.dart',
    ],
  };

  // The areas that speak Arabic. An area joins the list when its strings are
  // in the translation.
  const migrated = <String>[
    'the frame',
    'the directory',
    'the media and the viewers',
    'the storage analyzer',
    'the settings',
    'the connections and the vault',
  ];

  for (final area in migrated) {
    test('$area speaks Arabic', () {
      final occurrences = _stringsIn(areas[area]!);
      final found = occurrences.keys.toSet().difference(_allowed());

      expect(
        found,
        isEmpty,
        reason: 'These strings are written in the source of $area. They must '
            'be asked for by name, so that they can be translated.\n'
            '${found.join('\n')}\n\n'
            'They are written in:\n'
            '${found.expand((string) => occurrences[string]!).join('\n')}',
      );
    });
  }
}

/// The strings that are technical, and that are never translated.
Set<String> _allowed() {
  final content = json.decode(
    File('test/fixtures/hardcoded_strings.json').readAsStringSync(),
  ) as Map;
  final allow = (content['allow'] as List).cast<String>().toSet();
  final technical = (content['technical'] as List?)?.cast<String>().toSet() ??
      <String>{};
  return {...allow, ...technical};
}

/// The strings that are written in the source of the files.
///
/// Every string that is written in the source of an area is a string the area
/// cannot translate: it is the same in every language. A string that is
/// technical — a name, a path, a format, an id — is kept in the ledger; a
/// string the user reads is asked for by name, and it lives in the
/// translation.
Map<String, List<String>> _stringsIn(List<String> paths) {
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
bool _isKey(String text, int end) {
  final rest = text.substring(end);
  return rest.startsWith(':');
}

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
