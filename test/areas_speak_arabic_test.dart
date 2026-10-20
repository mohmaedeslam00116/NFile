import 'package:flutter_test/flutter_test.dart';

import 'support/label_scan.dart';

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
      final occurrences = labelsInSource(areas[area]!);
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
Set<String> _allowed() => technicalNames();
