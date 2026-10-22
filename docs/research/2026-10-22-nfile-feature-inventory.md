# What NFile offers today

> Read from the source at commit `bd1b7c0` of the fork `mohmaedeslam00116/NFile`; this answers the issue "What NFile offers today".

Repo root: `D:\ai\wizard\project game` (git repo, branch `main`, upstream fork `Senzme/NFile` → `mohmaedeslam00116/NFile`)

## 1. The shape of the app

### `lib/` tree (2–3 levels, file counts)

```
lib/                          128 .dart files, 67,845 total lines (120 files / 52,803 lines excl. generated l10n)
├─ core/                      (4)  app_version.dart, kind.dart, theme.dart, utils.dart
│  ├─ icon_fonts/             (1)  broken_icons.dart
│  ├─ l10n/                   (5)  app_locale.dart, app_localization.dart, app_translation.dart,
│  │                               filter_labels.dart, volume_labels.dart
│  ├─ listing/                (8)  listing.dart, listing_builder.dart, listing_cache.dart,
│  │                               listing_inputs.dart, listing_scope.dart, filter_rule.dart,
│  │                               path_facts.dart, sort_rule.dart
│  ├─ ssh/                    (1)  ephemeral_ssh_key.dart
│  └─ vault/                  (3)  vault_file.dart, vault_legacy.dart, vault_password.dart
├─ l10n/                      (3)  app_localizations.dart (generated), _en.dart (generated), _ar.dart (generated)
│                                  + app_en.arb, app_ar.arb  (5 files total in dir)
├─ models/                    (7)  file_item_model.dart, folder_tab_model.dart, file_filter_type.dart,
│                                  network_connection_model.dart, app_info_model.dart,
│                                  custom_shortcut_model.dart, drag_payload.dart
├─ providers/                 (2)  file_manager_provider.dart (3,101), media_provider.dart (1,640)
├─ services/                  (16) archive_service, apk_installer_service, app_manager_service,
│                                  audio_background_handler, background_archive_service,
│                                  folder_share_service, ftp_server_service, intent_handler_service,
│                                  network_connections_service, pin_service, preferences_service (636),
│                                  recycle_bin_service, root_shizuku_service, settings_backup_service,
│                                  vault_service, web_sharing_service (2,217)
│  └─ remote/                 (6)  remote_client.dart (abstract + RemoteFileItem), ftp_client.dart,
│                                  sftp_client.dart, webdav_client.dart, lan_client.dart, saf_client.dart
└─ ui/                        (0)
   ├─ screens/                (23) home_screen, directory_screen (2,921), media_category_screen (2,457),
   │                               more_settings_screen (2,746), remote_explorer_screen (1,454),
   │                               document_viewer_screen, text_editor_screen, archive_viewer_screen,
   │                               global_search_screen (769), all_recent_files_screen,
   │                               network_connection_wizard_screen (983), web_sharing_screen (953),
   │                               vault_explorer_screen, vault_lock_screen, recycle_bin_screen,
   │                               database_reader_screen, image_viewer_screen, html_viewer_screen,
   │                               markdown_viewer_screen, internal_file_picker_screen,
   │                               ftp_server_screen, backup_settings_screen, about_screen
   │  ├─ audio_player/         (7)  audio_player_screen, lyrics_dialog, audio_queue_sheet,
   │                               audio_artwork_widget, audio_controls_widget, audio_waveform_widget,
   │                               audio_particles_widget
   │  ├─ video_player/         (5)  video_player_screen, video_controls_overlay, vertical_slider_widget,
   │                               video_loading_indicator, video_seek_indicator
   │  └─ storage_analyzer/     (2 + 4 in widgets/) storage_analyzer_screen (649), app_manager_screen;
   │                              widgets/: app_list_tab, app_options_sheet, app_batch_action_bar, backup_list_tab
   └─ widgets/                (30) pane_browser (1,271), quick_categories_grid (696), nfile_address_bar (675),
                                  batch_rename_dialog (878), drag_drop_action_dialog (659),
                                  selection_action_bar (602), file_item (520), file_grid_item (460),
                                  nfile_drawer (436), folder_item (348), folder_grid_item (290),
                                  background_operation_progress_dialog, file_operation_progress_dialog,
                                  selection_context_bottom_sheet, drag_drop_handler, open_with_sheet,
                                  file_filter_bottom_sheet, conflict_dialog (350), create_archive_dialog,
                                  tab_options_sheet, directory_tab_bar, extract_archive_dialog,
                                  file_action_dialogs, storage_overview, premium_storage_overview,
                                  swipable_storage_overview (378), restricted_folder_banner,
                                  recent_files_section, settings_search (64), nfile_icon
```

Biggest files (actual line counts): `l10n/app_localizations.dart` 6,914 · `l10n/app_localizations_ar.dart` 4,008 · `l10n/app_localizations_en.dart` 3,981 · `providers/file_manager_provider.dart` 3,101 · `ui/screens/directory_screen.dart` 2,921 · `ui/screens/more_settings_screen.dart` 2,746 · `ui/screens/media_category_screen.dart` 2,457 · `services/web_sharing_service.dart` 2,217.

### Entry point
- `lib/main.dart` (503 lines) → `void main()`: `WidgetsFlutterBinding.ensureInitialized()`, `MediaKit.ensureInitialized()`, then `PreferencesService.init()`, `PinService.init()`, `NetworkConnectionsService.init()`, `RecycleBinService.init()`, custom font load, `AudioService.init(...)`, then `runApp(MultiProvider(providers: [FileManagerProvider, MediaProvider], child: NFileApp()))`.
- `NFileApp` (StatefulWidget) builds `MaterialApp` with `navigatorKey`, `localizationsDelegates: AppLocalization.delegates`, `supportedLocales`, `localeListResolutionCallback: AppLocalization.resolve`, dynamic color via `DynamicColorBuilder`, theme from `AppTheme.getAppTheme(...)`; `home:` is a permission gate (`_StoragePermissionShield`) → `HomeScreen`.

### State management
- **`provider`** (ChangeNotifier). Two providers: `FileManagerProvider` (3,101 lines) and `MediaProvider` (1,640 lines). No Bloc, no Riverpod, no GetX.
- No DI container: services are mostly `static` singletons / static classes (`PreferencesService`, `PinService`, `NetworkConnectionsService`, `RecycleBinService`, `ArchiveService`, `VaultService`, `SettingsBackupService`, `AppManagerService`, `RootShizukuService`, `IntentHandlerService`, `ApkInstallerService`, `FolderShareService`, `BackgroundArchiveService.instance`, `WebSharingService.instance`).
- `FileManagerProvider` also exposes a `ValueNotifier<FileOperationProgress?> progressNotifier`.

### Routing / navigation
- **Navigator 1.0 imperative only.** 53 `Navigator.push` / `Navigator.pushReplacement` call sites. No `onGenerateRoute`, no named routes, no `go_router`/`auto_route`. `Navigator.push(context, MaterialPageRoute(builder: (_) => ...))` everywhere; `globalKey<NavigatorState> navigatorKey` in `main.dart` used for system-UI and intent dispatch.
- Shell: `HomeScreen` = `IndexedStack` of 2 (Home tab / `DirectoryScreen`) + `NavigationBar` (Home, Browse) + `Drawer` (`NFileDrawer`).

### `pubspec.yaml` dependencies
| Package | Version |
|---|---|
| flutter | sdk: flutter |
| flutter_localizations | sdk: flutter |
| flutter_avif | ^3.1.0 |
| cupertino_icons | ^1.0.8 |
| path_provider | ^2.1.3 |
| shared_preferences | ^2.2.3 |
| permission_handler | ^12.0.1 |
| **provider** | ^6.1.2 |
| open_filex | ^4.4.0 |
| intl | ^0.20.2 |
| mime | ^2.0.0 |
| path | ^1.9.0 |
| photo_manager | ^3.3.0 |
| on_audio_query | git MSOB7YY/on_audio_query (packages/on_audio_query) |
| photo_view | ^0.15.0 |
| media_kit / media_kit_video / media_kit_libs_video | any |
| syncfusion_flutter_pdfviewer | ^33.2.6 |
| archive | ^3.6.1 |
| dart_lz4 | ^1.0.0 |
| just_zstd | ^0.2.0 |
| flutter_markdown | ^0.7.3 |
| flutter_widget_from_html | ^0.17.2 |
| docx_to_text | ^1.0.1 |
| excel | ^4.0.6 |
| xml | ^6.6.1 |
| excel2003 | ^1.0.0 |
| receive_sharing_intent | ^1.8.1 |
| dynamic_color | ^1.7.0 |
| url_launcher | ^6.2.6 |
| sqflite | ^2.4.2+1 |
| share_plus | ^12.0.2 |
| google_fonts | ^6.2.1 |
| crypto | ^3.0.3 |
| **ftpconnect** | ^2.0.10 |
| **dartssh2** | ^2.8.2 |
| audio_service | ^0.18.17 |
| device_info_plus | ^12.4.0 |
| qr_flutter | ^4.1.0 |
| cryptography | ^2.9.0 |

Dev deps: `flutter_test` (sdk), `flutter_lints ^6.0.0`, `path_provider_platform_interface ^2.1.3`.
`dependency_overrides`: `on_audio_query_platform_interface` → git MSOB7YY; `flutter_avif_android` → git yekeskin/flutter_avif.

### SDK constraints / version
- `environment: sdk: ^3.11.5` (no separate `flutter:` constraint in pubspec).
- `version: 1.0.44+44`. `lib/core/app_version.dart` hardcodes `current = '1.0.44'`, `channel = 'Stable'` (guarded by `test/app_version_test.dart`).
- CI pins Flutter **3.41.7** (checks.yml); build.yml uses `flutter-version: '3.x'`.
- Android: `applicationId com.rubex.nfile`, `ndkVersion 28.2.13676358`, min/target/compile SDK from Flutter defaults, ABI-split version codes (`variant.versionCode * 10 + abiVersionCode`).
## 2. Features that exist today

### A. Browser / listing
| Feature | File | Note |
|---|---|---|
| Derived Listing (folders first, sort, filter, hidden, pinned hoist) | `lib/core/listing/listing_builder.dart` | Pure function; folders before files, each group by Sort Rule |
| Listing value + cache | `lib/core/listing/listing.dart`, `listing_cache.dart` | Cache keyed by `ListingInputs` equality |
| Listing Scope (directory vs search) | `lib/core/listing/listing_scope.dart` | `DirectoryScope`/`SearchScope` sealed class |
| Sort Rules (7) | `lib/core/listing/sort_rule.dart` | nameAsc, nameDesc, dateNewest, dateOldest, sizeLargest, sizeSmallest, type |
| Folder Sort Override | `provider.setFolderOverrideEnabled` / `getSortTypeForPath` + `PreferencesService.getFolderSortTypes()`; UI in `directory_screen.dart` (~L799–L880) | Per-folder override map `Map<String, SortRule>` |
| Filter (6) | `lib/models/file_filter_type.dart` + `lib/core/listing/filter_rule.dart` + `ui/widgets/file_filter_bottom_sheet.dart` | all/documents/images/audio/videos/archives; folder hiding toggle (`showFoldersInFilter`) |
| Hidden files | `FileItemModel.isHidden` (`name.startsWith('.')`), `ListingBuilder._narrow` | Global toggle `toggleHiddenFiles()` |
| Pinned Paths | `lib/services/pin_service.dart` (SharedPreferences set), hoisted in `ListingBuilder._sort` | Pin/unpin from `selection_action_bar` and `directory_screen` |
| Per-path facts follow rename/move/delete | `lib/core/listing/path_facts.dart` | `moved()` / `deleted()` |
| Tabs (multi-tab) | `lib/models/folder_tab_model.dart` (`FolderTab`), `FileManagerProvider.addTab/closeTab/duplicateTab/closeOtherTabs/togglePinTab`; UI `ui/widgets/directory_tab_bar.dart`, `tab_options_sheet.dart` | Each tab has own path, selection, search, scroll |
| Split screen (2 panes) | `FileManagerProvider.toggleSplitScreen`, `ui/widgets/pane_browser.dart` | |
| View modes | grid/list (`isGridView`), icon scale 0.7–1.5, item padding 0.4–2.0, adaptive multi-line names | `file_item.dart` / `file_grid_item.dart` / `folder_item.dart` / `folder_grid_item.dart` |
| Search (per-tab + global) | `FileManagerProvider.executeSearchForTab` (recursive stream + media index), `ui/screens/global_search_screen.dart` | Filters: All / Folders / Images / Videos / Audio / Docs (string ids, `core/l10n/filter_labels.dart`) |
| Selection | `FolderTab.selectedPaths`, `toggleSelection/selectAll/clearSelection`; UI `selection_action_bar.dart`, `selection_context_bottom_sheet.dart` | |
| Storage volumes | `FileManagerProvider._detectStorageVolumes`, `StorageVolume` class | Internal + SD cards |
| Address bar / breadcrumbs | `ui/widgets/nfile_address_bar.dart` | |
| Drag & drop move/copy | `ui/widgets/drag_drop_handler.dart`, `drag_drop_action_dialog.dart` | Toggleable + confirm dialog |
| Restricted-folder banner | `ui/widgets/restricted_folder_banner.dart` | Android 11+ scoped storage / `/Android/data` |

Status: **complete**. The Listing pipeline is the most finished area; ADR-0001 governs it.

### B. File operations
| Feature | File | Note |
|---|---|---|
| Copy / cut / paste (local) | `FileManagerProvider.setClipboard/clearClipboard/pasteFile/copyItem/moveItem` | Copy+cut modes, progress dialog, progressNotifier |
| Copy / cut / paste (remote→local) | `FileManagerProvider._pasteFromRemoteToLocal`, `_downloadRemoteDirectory` | |
| Rename | `FileManagerProvider.renameFile` (+ batch `ui/widgets/batch_rename_dialog.dart`) | |
| Delete | `FileManagerProvider.deleteSelected/deleteFile` → Recycle Bin or hard delete (root/Shizuku aware) | |
| Recycle Bin | `lib/services/recycle_bin_service.dart` (records in SharedPreferences, restore/delete permanently/empty/auto-cleanup by days), `ui/screens/recycle_bin_screen.dart` | Toggleable, auto-delete days setting |
| Name-conflict handling | `ui/widgets/conflict_dialog.dart` — overwrite / keep both / skip / rename, "apply to all" | |
| Compress | `lib/services/archive_service.dart` (zip, tar, tar.gz, tar.bz2, tar.lz4, tar.zst; password; split volumes; level), `lib/services/background_archive_service.dart` (foreground-service notification), `ui/widgets/create_archive_dialog.dart` | Formats: zip/tar/tar.gz/tar.bz2/tar.lz4/tar.zst |
| Extract | `archive_service.extractArchive`, `ui/widgets/extract_archive_dialog.dart`, `ArchiveViewerScreen` | |
| Archive browse/edit | `ui/screens/archive_viewer_screen.dart` (read, add file, delete items inside archive) | |
| Share | `lib/services/folder_share_service.dart` (share_plus), `FileManagerProvider` | |
| Batch operations | `ui/widgets/selection_action_bar.dart` (copy/cut/delete/rename/properties/archive/paste-here/share/select-all/pin) + `batch_rename_dialog.dart` (placeholders `%`, `#`, `###`, `{n}`, `{e}`, `{de}`, `{N}`) | |
| Duplicate detection | **Only name-collision detection** (ConflictDialog). No content-hash duplicate finder exists (no md5/sha/checksum code anywhere). | Gap |
| Root / Shizuku mode | `lib/services/root_shizuku_service.dart` (`RootShizukuStatus`, list/copy/move/delete/rename/create) | |

Status: complete except **no content-based duplicate detection**.

### C. Media
| Feature | File | Note |
|---|---|---|
| Native media index | `lib/providers/media_provider.dart` — `photo_manager` for images/videos/albums, `on_audio_query` for audio; recursive dir scan for documents/archives/downloads/APKs; disk cache (`_loadFromDiskCache`/`_saveCache`) | `MediaSortOrder` enum |
| Thumbnails | `media_provider.ThumbnailCache` (static LRU-ish cache, `get(asset)`), used in `file_item.dart`, `file_grid_item.dart`, `pane_browser.dart`, `image_viewer_screen.dart`, `media_category_screen.dart` | |
| Image viewer | `ui/screens/image_viewer_screen.dart` — photo_view pinch-zoom | |
| Video player | `ui/screens/video_player/video_player_screen.dart` + `video_controls_overlay.dart`, `vertical_slider_widget.dart`, `video_loading_indicator.dart`, `video_seek_indicator.dart` | media_kit; playlist from folder; volume/brightness swipe; long-press 2×; speed; seek indicator |
| Audio player | `ui/screens/audio_player/audio_player_screen.dart` + `lyrics_dialog.dart`, `audio_queue_sheet.dart`, `audio_artwork_widget.dart`, `audio_controls_widget.dart`, `audio_waveform_widget.dart`, `audio_particles_widget.dart` | media_kit; queue, shuffle, repeat (none/one/all), playback speed, sleep timer, equalizer/SFX dialog, lyrics, artwork |
| Background audio | `lib/services/audio_background_handler.dart` (`audio_service`, `BaseAudioHandler`), notification channel `com.rubex.nfile.audio` | |
| Galleries / categories | `ui/screens/media_category_screen.dart` (2,457) — album grid + asset grid, folders-mode, media info sheet (dimensions/duration/size/date), "show in location" | |
| Metadata | dimensions/duration via photo_manager `AssetEntity`; audio `SongModel`; EXIF not extracted beyond `ACCESS_MEDIA_LOCATION` permission | |
| Quick categories | `ui/widgets/quick_categories_grid.dart` — Images, Videos, Audio, Documents, Archives, Downloads, APKs, Screenshots, App Manager, Recycle Bin, Settings; reorderable, custom categories, custom shortcuts, excluded default paths | |

Status: substantial and complete-looking.

### D. Storage analyzer
- `ui/screens/storage_analyzer/storage_analyzer_screen.dart` (649): recursive scan of the volume categorised into **apps / images / videos / audio / documents / system-other**, plus total/used from the provider. Presented as a radial/pie chart with an animated sweep (`AnimationController` 1200 ms) + progress bar + free/used figures. Rescan action in the AppBar.
- `ui/screens/storage_analyzer/app_manager_screen.dart` (379): 3 tabs (user apps / system apps / backups), search, sort by name/size/date, multi-select, batch action bar, per-app options sheet (launch, open details, uninstall, backup, share APK, change icon), `widgets/backup_list_tab.dart` (394).
- `lib/services/app_manager_service.dart` (266): `getInstalledApps`, `getAppIcon`, `getApkIcon`, `launchApp`, `openAppDetails`, `uninstallApp`, `checkUsageStatsPermission`/`requestUsageStatsPermission`, `changeAppIcon`, `backupApp`, `batchBackupApps`, `shareAppApk`, `batchShareAppApks`, `deleteBackup`, `installSplitApks`.
- `lib/ui/widgets/swipable_storage_overview.dart` (378): swipeable per-volume overview card with shimmer placeholder; `storage_overview.dart` and `premium_storage_overview.dart` are **unused** cards (see §3).

Status: complete.
### E. Connections — what is real, what is stubbed
Protocols offered by the wizard (`ui/screens/network_connection_wizard_screen.dart`): **LAN/SMB, FTP, SFTP, WebDav, SAF Folder**.

| Protocol | Client file | Status |
|---|---|---|
| FTP | `lib/services/remote/ftp_client.dart` (192) — `ftpconnect` | **Real.** list/mkdir/delete/download/upload with progress. No FTPS/TLS (the `secureFtpHint` l10n string "Secure FTP connection over explicit TLS" exists in `app_en.arb:795` but is **never referenced in code**). |
| FTPS | — | **Not implemented / not offered.** |
| SFTP | `lib/services/remote/sftp_client.dart` (142) — `dartssh2` | **Real.** list/mkdir/rmdir/remove/download/upload with progress. Password auth only (no key auth in the wizard). |
| WebDAV | `lib/services/remote/webdav_client.dart` (276) — raw `HttpClient` | **Real.** PROPFIND listing (XML via `xml` pkg), MKCOL, DELETE, GET, PUT; Basic auth; http/https. Contains leftover `stderr.writeln('[WebDAV DEBUG] …')` logging of the full response body (lines 93, 102, 108, 109). |
| LAN / SMB | `lib/services/remote/lan_client.dart` (260) | **STUB / MOCK.** No SMB protocol code. `connect()` loads a JSON "virtual filesystem" from SharedPreferences or seeds a fake tree (`Shared_Media`, `Office_Documents`, `lan_read_me.txt`); `downloadFile` writes **synthetic text** ("NFile LAN/SMB Virtual Storage Bridge …") with a simulated 10-step progress; `uploadFile` simulates a 5-step transfer and appends to the virtual FS. `scanSubnet()` does real TCP connect probes on ports 21/22/445/80/8080 over the /24. |
| SAF (Android Storage Access Framework) | `lib/services/remote/saf_client.dart` (78) — MethodChannel `com.rubex.nfile/saf` | **Real** — delegates to native Kotlin (list/create/delete/download/upload). |
| Cloud accounts (Google Drive / Dropbox / OneDrive / Box) | — | **Not implemented.** `ui/screens/directory_screen.dart` L1213–L1224 only maps `conn.type` strings to icon glyphs; no client code, no wizard option, no OAuth. |
| Connection storage | `lib/services/network_connections_service.dart` — list of `NetworkConnectionModel` (id, name, type, host, port, username, **password stored in plaintext JSON in SharedPreferences**, rootPath, protocol) | |
| Remote explorer UI | `ui/screens/remote_explorer_screen.dart` (1,454) — browse, copy/cut/paste remote clipboard, upload/download to device, move to device, delete, mkdir, retry-on-connection-lost, breadcrumb | |
| LAN scanner UI | in the wizard (`_selectedType == 'LAN/SMB'` → `LanClient`) | Discovery is real; the resulting "server" is the mock above. |

### F. FTP server (outbound)
- `lib/services/ftp_server_service.dart` (517): a **real minimal FTP server** on a `ServerSocket` — USER/PASS, PWD/CWD, LIST (MLSD-style listing), RETR, STOR, DELE, MKD, RMD, RNFR/RNTO, SIZE, TYPE, PASV (passive), and active-mode support. Unsupported commands answer `'502 Command not implemented.'` (L266).
- UI: `ui/screens/ftp_server_screen.dart` (510); native foreground service `android/.../FtpForegroundService.kt`.
- No FTPS server.

### G. Web sharing server
- `lib/services/web_sharing_service.dart` (2,217): real `HttpServer` on port 8080 bound to `anyIPv4`.
  - Local share: browse directory tree, **POST upload** (binary stream), **GET download with HTTP Range support** (206 / 416, `acceptRanges`), 64 KB chunked streaming, `Content-Disposition`, directory-traversal guard (`..` → 403).
  - Internet tunnel: real SSH reverse-forward via `dartssh2` to a public host using an **ephemerally generated SSH key** (`lib/core/ssh/ephemeral_ssh_key.dart`) — no key material in source (guarded by `test/no_private_key_in_source_test.dart`).
  - Live per-client stats: device, current file, bytes transferred, MB/s speed (1 s timer), active client list.
  - HTML explorer UI generated server-side (`_generateExplorerHtml`, ~1,600 lines of embedded HTML/JS), with `<video>`/`<audio>` fallback messages.
  - UI: `ui/screens/web_sharing_screen.dart` (953) — local URL, copy URL, QR code (`qr_flutter`), tunnel activation, connected-client list, share-directory picker.
  - Native service: `WebSharingForegroundService.kt`, channel `com.rubex.nfile/web_sharing_service`.

### H. Vault (encrypted store)
- `lib/core/vault/vault_password.dart` (91): master-password verifier using **Argon2id** (`cryptography` pkg, hashLength 32) with per-process salt; legacy SHA-256 verifier detection/migration.
- `lib/core/vault/vault_file.dart` (160): sealed file format — encrypted content **and** encrypted metadata, non-deterministic (fresh nonce), rejects tampered bytes.
- `lib/core/vault/vault_legacy.dart` (80): reads files written by the old (SHA-256-derived, repeating XOR) scheme.
- `lib/services/vault_service.dart` (364): vault dir under app documents, `metadata.json` sealed with the password, records (`VaultFileRecord`: id, originalName, originalPath, scrambledPath, size, lockedAt, isInPlace, isFolder), `lockFile` / `unlockFile` / `lockDirectory` / `decryptTemporary`.
- UI: `ui/screens/vault_lock_screen.dart` (429, set/verify master password), `ui/screens/vault_explorer_screen.dart` (929, list/unlock/lock, preview images/video/audio/text).

### I. Backup / restore
- **Settings backup/restore**: `lib/services/settings_backup_service.dart` (115) + `ui/screens/backup_settings_screen.dart` (119) — export/import SharedPreferences as a JSON file via the internal file picker.
- **App backup**: `AppManagerService.backupApp` / `batchBackupApps` / `deleteBackup` / `installSplitApks`, listed in `storage_analyzer/widgets/backup_list_tab.dart`.
- No full-app or full-storage backup.

### J. Settings, themes, locale
- `ui/screens/more_settings_screen.dart` (2,746) — 9 sections (General & Behaviour, Appearance & Themes, File Explorer Options, List & Layout Styling, Media Preferences, File Actions & Viewers, Recycle Bin / Trash, Backup & Restore, Categories), with a built-in settings search (`_shouldShow` filtering).
- Themes: `lib/core/theme.dart` (154) — Material 3, seed colours, AMOLED/pitch-black, dynamic colour (`dynamic_color`), custom font family (default / Ndot57 / NType82 / LexendDeca / **custom TTF loaded at runtime**), folder icon style, menu icon style, app icon alias (5 launcher aliases), material-icons vs "Broken" icon pack.
- ~70 individual preference toggles in `lib/services/preferences_service.dart` (636) (all `SharedPreferences`).
- **Locale**: `lib/core/l10n/app_locale.dart` — the app has **no language switch**; it follows the system locale. Only **English** and **Arabic** supported (`AppLocale.supported = [en, ar]`), unknown → English; country is dropped. `core/l10n/app_localization.dart` wires the delegates; `core/l10n/app_translation.dart` gives context-less services access to the current `AppLocalizations`.
- l10n: `lib/l10n/app_en.arb` (84 KB, **1,130 keys** + 199 `@`-metadata entries) and `app_ar.arb` (78 KB, **1,130 keys**), generated into `app_localizations.dart` / `_en.dart` / `_ar.dart` (committed; CI asserts `flutter gen-l10n` produces no diff).

### K. Other user-facing
- Home dashboard (`ui/screens/home_screen.dart`): storage overview carousel, quick categories grid, recent files section, pull-to-refresh, light/dark toggle, exit behaviour (confirm dialog / double-press), bottom nav bar toggle.
- Recent files: `ui/widgets/recent_files_section.dart`, `ui/screens/all_recent_files_screen.dart`.
- Share-intent receiver: `receive_sharing_intent` + `lib/services/intent_handler_service.dart` (copies content:// URIs to a cache file, then opens natively); 4 intent filters in the manifest (PDF, image/*, media+docs+zips, SEND / SEND_MULTIPLE).
- "Open with" sheet + per-extension default action (`native` / `external`), `ui/widgets/open_with_sheet.dart`, `lib/services/preferences_service.dart` `getDefaultOpenAction`/`saveDefaultOpenAction`/`clearAllDefaultOpenActions`.
- Documents provider: `android/.../NFileDocumentsProvider.kt` — `DocumentsProvider` exposing the filesystem (`com.rubex.nfile.documents`).
- Settings search widget `ui/widgets/settings_search.dart` — **unused** (see §3).
- **No clipboard-history feature** (grep for "clipboard history" → 0 hits; only copy/cut + a remote clipboard).
- **No hash/checksum tool** (no md5/sha/checksum user feature; `crypto` is used only for vault keys).
## 3. Gaps visible in the code

### TODO / FIXME / HACK
**Zero occurrences** of `TODO`, `FIXME`, `HACK`, `XXX` in `lib/` (excluding `l10n/`).

### "coming soon" / placeholder / unimplemented
| Location | Line | Content |
|---|---|---|
| `lib/ui/screens/document_viewer_screen.dart` | 1045 | `SnackBar(content: Text(AppLocalizations.of(context).shareComingSoon)),` — the **share action inside the document viewer is a stub**; it shows "Share coming soon" / "المشاركة قريبًا". |
| `lib/l10n/app_en.arb` | 962 | `"shareComingSoon": "Share coming soon"` (also `app_ar.arb:962`) — key used only by the above. |
| `lib/services/ftp_server_service.dart` | 266 | `sendResponse('502 Command not implemented.');` — FTP commands outside the implemented set. |
| `lib/services/background_archive_service.dart` | 374, 673 | `'Unsupported format'` error path for archive formats the background service cannot handle. |

### Stubs / mock implementations
| Location | What is stubbed |
|---|---|
| `lib/services/remote/lan_client.dart` (whole file, 260 lines) | **LAN/SMB is a mock.** `_loadDefaultStructure()` (L138–162) seeds a fake tree; `downloadFile` (L212–245) writes **synthetic text** (`'NFile LAN/SMB Virtual Storage Bridge…'`) with a fake 10-step progress; `uploadFile` (L248–281) simulates a 5-step transfer and appends to the persisted virtual FS. No SMB wire protocol exists. `disconnect()` is a no-op (L176–178). |
| `lib/services/remote/saf_client.dart` L13, L18 | `connect()` / `disconnect()` are `// No-op` (SAF needs none) — legitimate, not a stub. |
| Cloud types `'Google Drive'`, `'Dropbox'`, `'OneDrive'`, `'Box'` | `lib/ui/screens/directory_screen.dart` L1213–L1224 maps these connection `type` strings to icons only. **No client, no wizard entry, no auth.** |
| `secureFtpHint` | `lib/l10n/app_en.arb:795` = "Secure FTP connection over explicit TLS" — **never referenced from code**; FTPS is neither client nor server. |
| `lib/services/remote/webdav_client.dart` L93, 102, 108, 109 | Leftover `stderr.writeln('[WebDAV DEBUG] …')` including dumping the **entire PROPFIND response body** to stderr. |

### Dead code / unreachable from the UI
| Symbol | File | Evidence |
|---|---|---|
| `GlobalSearchScreen` | `lib/ui/screens/global_search_screen.dart` (769 lines) | **No reference anywhere else.** The drawer "Global Search" tile (`nfile_drawer.dart` L95–L114) instead switches to the Browse tab and calls `provider.toggleSearchForActiveTab()` + `executeSearchForTab`. The screen is never pushed. |
| `SettingsSearchBar` | `lib/ui/widgets/settings_search.dart` (64 lines) | **No reference anywhere else.** `more_settings_screen.dart` implements its own search field inline. |
| `StorageOverviewCard` | `lib/ui/widgets/storage_overview.dart` (112 lines) | **No reference anywhere else** (only `SwipableStorageOverview` and `PremiumStorageOverview` are wired; the latter is also unused). |
| `PremiumStorageOverview` | `lib/ui/widgets/premium_storage_overview.dart` (166 lines) | **No reference anywhere else.** |
| `StorageVolume.totalBytes/usedBytes` fields | `providers/file_manager_provider.dart` L61–62 | Set in the constructor but never read by any UI (the overview reads `totalStorageBytes`/`usedStorageBytes` ints instead). |
| `FolderTab.searchFilter` is a raw `String` | `models/folder_tab_model.dart` L27 | Values `'All' | 'Folders' | 'Images' | 'Videos' | 'Audio' | 'Docs'` are string literals scattered in `file_manager_provider.dart` (L1081, L1101, L1144–1158) and `core/l10n/filter_labels.dart` — a second, stringly-typed vocabulary parallel to `FileFilterType`. |
| `DragPayload.paths` | `models/drag_payload.dart` L4 | Constructed with a single `path`; the multi-path field is not used for multi-item drags. |

### Deliberate suppressions
- `analysis_options.yaml` L13–18: `use_build_context_synchronously: ignore` — "The application uses a BuildContext after an await in **53 places** … the screens have **no tests** to catch a mistake made there."
- `lib/services/remote/lan_client.dart` L28: `static const String _smbPrefix = 'smb_virtual_fs_'` — the SMB name is only a SharedPreferences key prefix.

## 4. The domain model in the code

### Entities in the code → `CONTEXT.md` vocabulary

| `CONTEXT.md` term | Code symbol | File | Notes |
|---|---|---|---|
| **Listing** | `class Listing { List<FileItemModel> entries; int folderCount; int fileCount; }` | `lib/core/listing/listing.dart` | Exactly matches the glossary; doc comment cites ADR-0001. |
| **Entry** | `class FileItemModel { FileSystemEntity entity; String name; String path; bool isDirectory; int size; DateTime modified; bool get isHidden; }` | `lib/models/file_item_model.dart` | The code calls it **`FileItemModel`**, not "Entry" — the glossary's "Avoid: item, node, entity" is violated by the class name (though `listing.dart` doc comments say "Entries"). `FileItemModel` also carries the raw `FileSystemEntity`. |
| **Listing Source** | *No class.* | — | **Not modelled.** The closest thing is `FolderTab.sourceEntries` (`entries` vs `searchEntries`) + `FolderTab.scope`. There is no `ListingSource` type; the source is implied by `isSearchActive`. |
| **Listing Scope** | `sealed class ListingScope` → `DirectoryScope(location)` / `SearchScope(root)` | `lib/core/listing/listing_scope.dart` | Exact match. Decides `ruleOf()` (folder override applies or not) and `filterOf()` (search not narrowed by a directory filter). |
| **Search Query** | `FolderTab.searchQuery` (a `String`) + `FileManagerProvider.executeSearchForTab(tabIndex, query, filter, mediaProvider)` | `models/folder_tab_model.dart`, `providers/file_manager_provider.dart` | The query is a plain `String`, not a `SearchQuery` type. The **search filter** is a raw `String` id (`'All'/'Folders'/…`) — *not* `FileFilterType`. |
| **Filter** | `enum FileFilterType { all, documents, images, audio, videos, archives }` | `lib/models/file_filter_type.dart` | The code names it **`FileFilterType`**, not "Filter". A second string filter vocabulary (`'All'|'Folders'|'Images'|'Videos'|'Audio'|'Docs'`) exists for searches — **two filter vocabularies**. |
| **Kind** | `enum Kind { image, video, audio, document, archive, text, other }` + `Set<Kind> kindsOf(String path)` | `lib/core/kind.dart` | Exact match with the glossary ("A file may answer to more than one Kind"). `Kind.text` is not in the glossary's list ("image, video, audio, document, archive, text" — actually it is). |
| **Sort Rule** | `enum SortRule { nameAsc, nameDesc, dateNewest, dateOldest, sizeLargest, sizeSmallest, type }` | `lib/core/listing/sort_rule.dart` | Exact match. Re-exported from the provider (`export '../core/listing/sort_rule.dart' show SortRule;`) to keep old import paths working. Note the plan document still calls it `FileSortType`. |
| **Folder Sort Override** | `Map<String, SortRule> _folderSortTypes` in the provider + `PreferencesService.getFolderSortTypes()/saveFolderSortTypes()`; `isFolderOverrideEnabled(path)`, `setFolderOverrideEnabled(path, enabled)`, `getSortTypeForPath(path)` | `providers/file_manager_provider.dart` L348–L381 | Not a type; a map keyed by absolute path. The map is the **global** store for all folders' overrides — the per-folder fact is not scoped/owned by a folder object. |
| **Pinned Path** | `Set<String> pinnedPaths` in `PinService` (SharedPreferences) + `PathFacts.pinnedPaths` | `lib/services/pin_service.dart`, `lib/core/listing/path_facts.dart` | Matches: hoisted within its own group. |
| **Tab** | `class FolderTab` | `lib/models/folder_tab_model.dart` | Matches: own location, selection (`selectedPaths`), search (`searchQuery`/`searchFilter`/`isSearchActive`), scroll (`scrollOffset`/`scrollPositions`). Extra fields not in the glossary: `isRestrictedMode`, `needsPermission`, `useRootMode`, `useShizukuMode`, `isRootAvailable`, `isPinned`. |
| **Location** | `FolderTab.currentPath` (a `String`); `DirectoryScope.location`; `SearchScope.root`; `FileManagerProvider.rootPath` | `models/folder_tab_model.dart`, `core/listing/listing_scope.dart` | **Not a type.** The code calls it "path" / "currentPath" / "rootPath" — the glossary explicitly says avoid "path (when meaning the place being shown)". There is no `Location` class. |
| **Selection** | `Set<String> selectedPaths` on `FolderTab`; `FileManagerProvider.selectedPaths` (active tab) | `models/folder_tab_model.dart`, `providers/file_manager_provider.dart` | Matches (set of entry paths). |

### Where the code contradicts the glossary

1. **"Listing Source" has no representation.** No `ListingSource` type; a tab's source is implied by a boolean (`isSearchActive`) plus two parallel lists (`entries` / `searchEntries`). The glossary says a source "produces entries; it does not order them" — the code has no such seam.
2. **"Location" has no representation.** Everything is a raw `String` path; the glossary asks for a distinct concept.
3. **"Search Query" has no representation.** It is a bare `String` with no type.
4. **Two Filter vocabularies.** `FileFilterType` (the listing filter) vs the string search filter `'All'|'Folders'|'Images'|'Videos'|'Audio'|'Docs'` (used in `executeSearchForTab` and `filter_labels.dart`). `ListingScope.filterOf` returns `FileFilterType.all` for a search — i.e. a search's own filter vocabulary is *not* the listing filter vocabulary, and the glossary has no word for the search's narrowing.
5. **"Entry" is called `FileItemModel`** — the glossary explicitly lists "item" under _Avoid_.
6. **"Filter" is called `FileFilterType`**; **"Sort Rule" is called `SortRule`** (fine), but the plan document `docs/plans/2026-10-19-listing-builder.md` still names it `FileSortType` (stale; the code renamed it to `SortRule`).
7. **Folder Sort Override is global state, not per-folder.** `PreferencesService.getFolderSortTypes()` is one flat `Map<String, SortRule>` for the whole app; the glossary says a Folder Sort Override "applies to the Listing of one folder", which the code honours at read time (`DirectoryScope.ruleOf`) but stores globally.
8. **Kind vs the code's other classifiers.** `Kind` (core/kind.dart) is the declared single vocabulary, but the code still classifies independently elsewhere: `FileUtils.isArchive/isImage/isVideo/isAudio/isTextOrCode` (`core/utils.dart`), `hasNativeViewer`'s `docExts` list (`file_manager_provider.dart` L2736), `openFileNatively`'s `docExts` (L2753), `storage_analyzer_screen.dart` L122 `docExts`, `file_manager_provider.dart` L142 `docExts` (a 4th list), and `core/kind.dart`'s own `_documentExtensions` (a 5th list). The lists differ: e.g. `core/kind.dart` has 12 doc extensions; `file_manager_provider.dart` L142/L2736/L2753 have 9; `storage_analyzer_screen.dart` L122 has 14 (adds `.txt .csv .ods .odp .rtf`); `core/utils.dart` `isTextOrCode` has 40+ extensions + a mime fallback. So "two vocabularies may not disagree about the same file" is violated by these parallel lists.
9. **Pinned Path semantics differ from the glossary's wording.** The glossary: "Its entries are hoisted to the top of their own group, not above other groups." The code matches that in `ListingBuilder._sort` — but the pinned set is global (`PinService.pinnedPaths`) and hoisting is applied per group *after* sorting, so a pinned file is hoisted among files and a pinned folder among folders. Consistent with the glossary.
10. **`FolderTab.searchFilter` is a `String` but `FolderTab` also has `searchEntries`** — the glossary's "Listing Source" would have unified these two.
## 5. The tests

`test/` — **20 Dart files, 2,026 lines**; **90 `test()` / `testWidgets()` declarations** in 18 files (plus `app_test_harness.dart` helper and `test/support/label_scan.dart` helper).

| File | Tests | What it guards |
|---|---|---|
| `listing_test.dart` | 12 | Folders-before-files, group ordering, pinned hoist; folder override applies to its directory only, not to a search; filter narrowing (documents keep text), folder hiding under a filter, filter=all; hidden entries absent unless asked for. |
| `listing_provider_test.dart` | 12 | `listingFor(tab)` honours override/global rule; search listing ignores override; `activeListing`; cache returns the same Listing until inputs change, rebuilds on Sort Rule change; tab knows its source; per-path facts follow a renamed folder; pinning during a search leaves the directory entries untouched; search list ordered by Sort Rule; list narrowed by Filter not by the load. |
| `filter_rule_test.dart` | 6 | Kind vocabulary: a file may have several Kinds; extension-less file is text; unknown file has one Kind; filter keeps `.ts` under documents *and* videos; text kept under documents not images; filter agrees with Kind vocabulary over every file. |
| `path_facts_test.dart` | 4 | Facts follow a renamed folder, a moved folder, leave other paths alone, end with a deleted folder. |
| `vault_password_test.dart` | 7 | Verifier is not SHA-256(password+salt); accepts right / refuses wrong password; fresh salt each time; constant-time-ish work factor; legacy verifier distinguished and still verified. |
| `vault_master_password_test.dart` | 4 | Master password kept behind Argon2id not one SHA-256; verified; legacy verifier migrated on success; legacy verifier left alone when the password is wrong. |
| `vault_file_test.dart` | 8 | Locked file holds metadata + content; not the same bytes twice; no plaintext of content or metadata; opened only with the right password; refused when a byte changed; old-version file still opened. |
| `vault_records_test.dart` | 4 | Records hold no filename in the clear; read back; not read with the wrong password; legacy cleartext records still read. |
| `app_locale_test.dart` | 8 | Arabic when the system speaks Arabic; English for English/unknown/empty; country dropped; first known system language wins; supported languages are exactly en+ar and are told apart from unsupported ones. |
| `app_localizations_test.dart` | 8 | ARB key parity; Arabic value is a translation not a copy; supported locales; widget tests that the app renders Arabic/English and that the framework strings are Arabic too; delegates wired. |
| `areas_speak_arabic_test.dart` | 1 (parameterised over 6 areas) | Scans 60+ source files for hard-coded user-visible strings; each of the 6 areas ("the frame", "the directory", "the settings", "the media and the viewers", "the connections and the vault", "the storage analyzer") must have no untranslated literal. |
| `no_hardcoded_strings_test.dart` | 5 | Source holds no string outside the ledger; the ledger holds no meaningless name; ledger is exactly the set of source strings; no map key is a translation. |
| `manifest_permissions_test.dart` | 3 | The merged manifest takes `READ_MEDIA_IMAGES` / `READ_MEDIA_VIDEO` out but keeps `READ_MEDIA_AUDIO` (needed by on_audio_query). |
| `no_private_key_in_source_test.dart` | 1 | No PEM private-key block in `lib/**/*.dart`. |
| `ephemeral_ssh_key_test.dart` | 3 | The tunnel's SSH identity is a usable key, signs with the key it was generated with, and is new for every process. |
| `app_version_test.dart` | 2 | The shown version equals the pubspec version; the release channel is named. |
| `file_picker_test.dart` | 1 | The internal picker orders its entries with the app's Sort Rule. |
| `widget_test.dart` | 1 | `NFileApp` boots (smoke). |
| `app_test_harness.dart` | — | Helper: `appUnderTest({home, locale})` with the real localizations. |
| `support/label_scan.dart` | — | Helper: scans source for string literals / builds the label ledger. |

### Areas with NO tests
- Every screen and widget except the internal file picker and the app smoke test: `directory_screen`, `pane_browser`, `home_screen`, `nfile_drawer`, `media_category_screen`, all media viewers/players (image, video, audio, document, text, archive, database, markdown, html), `more_settings_screen`, `global_search_screen`, `all_recent_files_screen`, `recycle_bin_screen`, `vault_*`, `ftp_server_screen`, `web_sharing_screen`, `remote_explorer_screen`, `network_connection_wizard_screen`, `storage_analyzer/*`, `app_manager_screen`, `about_screen`, `quick_categories_grid`, `selection_action_bar`, `batch_rename_dialog`, `conflict_dialog`, `create/extract_archive_dialog`, `drag_drop_*`, `tab_options_sheet`, `file_filter_bottom_sheet`, `open_with_sheet`.
- All services: `ArchiveService`, `BackgroundArchiveService`, `WebSharingService`, `FtpServerService`, `VaultService` (only its crypto primitives are tested), `RecycleBinService`, `PreferencesService`, `PinService`, `NetworkConnectionsService`, `SettingsBackupService`, `AppManagerService`, `RootShizukuService`, `IntentHandlerService`, `FolderShareService`, `MediaProvider`, and **all remote clients** (`FtpRemoteClient`, `SftpRemoteClient`, `WebDavRemoteClient`, `LanClient`, `SafRemoteClient`).
- `PreferencesService` round-tripping, `MediaProvider` indexing/caching/sorting, `ThumbnailCache`.
- `analysis_options.yaml` L17 itself states "the screens have **no tests** to catch a mistake made there".

## 6. The shipping surface

### `fastlane/`
```
fastlane/metadata/android/en-US/
  title.txt             "NFile"
  short_description.txt "A beautiful Material Design file manager with premium UI/UX."
  full_description.txt  12 lines: premium UI/UX, native media indexing, built-in media players,
                        built-in text editor, advanced sorting & categories, complete file
                        operations, recycle bin, storage overview, smooth navigation
  images/icon.png       199 KB
  images/phoneScreenshots/1.png … 4.png   (4 phone screenshots, ~104–133 KB each)
```
**Languages present: `en-US` only** (no `ar` translation folder — the fastlane listing has never been translated, even though the app itself is bilingual).

### `metadata/`
- One file: `metadata/com.rubex.nfile.yml` (113 lines) — F-Droid-style metadata: Categories `File Manager`, `System`; License `GPL-3.0-only`; Author `Senzme`; WebSite/SourceCode/IssueTracker all point at **`https://github.com/Senzme/NFile`** (the upstream, not the fork); `AutoName: NFile`; `Repo: https://github.com/Senzme/NFile.git`; 3 `Builds` all pinned at `versionName 1.0.42` (versionCodes 421/422/423, all on commit `3afa5995b4b23f62d34c5c3cb1a505723c13ed92`, armeabi-v7a / arm64-v8a / x86_64); `AllowedAPKSigningKeys: f6e86eca…c2ca`; `UpdateCheckMode: Tags`; `VercodeOperation: 10 * %c + 1|2|3`; `CurrentVersion: 1.0.42`, `CurrentVersionCode: 423`. **Stale relative to pubspec 1.0.44+44.**

### `README.md` (50 lines)
Claims: "A beautiful File Manager application built with Flutter"; premium UI/UX with an exclusive "Broken" icon pack, dynamic AMOLED-friendly dark mode; "transitions from a simple file explorer to a comprehensive media hub with built-in high-performance players and viewers"; features list = premium UI/UX, native media indexing (images/videos/audio via native device indexing), built-in video player (`media_kit`), elegant audio player with album art, pinch-to-zoom image viewer, built-in text editor (`.txt .md .json` and code), advanced sorting (newest/oldest/date-wise), complete file operations (copy, cut, paste, rename, delete), quick categories, storage overview, iOS-style bouncy physics. Permissions section lists `MANAGE_EXTERNAL_STORAGE`, `READ_MEDIA_IMAGES`, `READ_MEDIA_VIDEO`, `READ_MEDIA_AUDIO` — **the last two are contradicted by the app's own manifest (which removes READ_MEDIA_IMAGES/VIDEO) and by `test/manifest_permissions_test.dart`**. Build instructions say API 21+; technologies listed: Flutter & Dart, `provider`, `media_kit`, `photo_manager` & `on_audio_query`, `permission_handler`, `photo_view` & `open_filex`. License: GNU GPL v3. 4 screenshots (remote GitHub user-attachment URLs).

### `.github/workflows/`
**`build.yml` — "Build APK"** (on push & PR to `main`, ignoring `**.md`, `.gitignore`, `LICENSE`, `docs/**`, `fastlane/**`, `metadata/**`; concurrency cancel-in-progress):
1. Checkout (`actions/checkout@v4`).
2. Read `version:` from pubspec.yaml → `APP_VERSION=v<version>`.
3. Skip the whole build if `gh release view $APP_VERSION` already exists.
4. `setup-java` zulu 17 + `subosito/flutter-action@v2` with `flutter-version: '3.x'` stable.
5. `flutter pub get`.
6. Patch `FlutterAvifPlugin.java` in the pub-cache (duplicate class with the Kotlin file).
7. Decode `secrets.KEYSTORE_BASE64` → `android/app/upload-keystore.jks` + `android/key.properties` (skipped if the secret is absent → unsigned build).
8. `flutter build apk --release --split-per-abi --obfuscate --split-debug-info=build/app/outputs/symbols --no-tree-shake-icons`.
9. **Merged-manifest permission check** (`if: always()`): fails the job if `READ_MEDIA_IMAGES` or `READ_MEDIA_VIDEO` survive into the merged manifest.
10. Rename the 3 APKs to `NFile-<version>-{arm64-v8a,armeabi-v7a,x86_64}.apk`.
11. `upload-artifact@v4` as `nfile-<version>-apks`.
12. On push to `main` only: `softprops/action-gh-release@v2` creating release tag `v<version>`, title "NFile Release v<version>", body describing the architecture split, R8 + Dart obfuscation; `draft: false`, `prerelease: false`, `make_latest: true`.

**`checks.yml` — "Checks"** (on push & PR to `main`; concurrency cancel-in-progress): one job "Analysis and Tests" on `ubuntu-latest`: checkout → `subosito/flutter-action@v2` with **pinned `flutter-version: '3.41.7'`** (comment: pinning keeps the gate from breaking without code changes) + `cache: true` → `flutter pub get` → **translation freshness check** (`flutter gen-l10n` then `git diff --exit-code lib/l10n`) → `flutter analyze` → `flutter test`.

### `docs/`
- `docs/agents/domain.md` (51 lines): how to consume the domain docs — read `CONTEXT.md` (or `CONTEXT-MAP.md` if present) and `docs/adr/`; proceed silently if absent; use the glossary's vocabulary; flag ADR conflicts explicitly.
- `docs/agents/issue-tracker.md` (50+ lines): GitHub Issues via `gh`; **the repo is pinned to the fork** `mohmaedeslam00116/NFile` (`gh repo set-default`) because `gh` otherwise infers the `upstream` remote and would target `Senzme/NFile`; issue/PR command conventions; "PRs as a request surface: **no**"; GitHub shares the number space between issues and PRs.
- `docs/agents/triage-labels.md` (15 lines): maps the 5 canonical triage roles to actual label strings (`needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`).
- `docs/adr/0001-derived-listing.md` (20 lines): **the only ADR.** Decision — the visible Listing is always **derived** from Entries plus rules (entries, sort rule, filter, pinned paths, location, hidden-files preference) by a single `ListingBuilder`; nothing writes the user's visible order into storage; a derived Listing may be cached but the cache is keyed by its inputs and is never the source of truth. Reasons: the old `currentFiles` list was re-sorted and written back by **seven** call sites, and because the getter returned search results during a search, pinning/re-sorting during a search silently replaced the directory listing with the search results. Consequences: `FolderTab` keeps raw Entries + a description of the Listing Source and no visible list; a search Listing uses the global Sort Rule (no Folder Sort Override across a searched subtree); per-path facts (Folder Sort Override, Pinned Path) follow the path they name.
- `docs/plans/2026-10-19-listing-builder.md` (33,530 bytes, ~780 lines): the implementation plan for ADR-0001 — 9 tasks (1: the Listing orders entries; 2: a Folder Sort Override applies to one directory's Listing only; 3: a Filter narrows the Listing and hidden entries stay hidden; 4: the provider derives Listings; 5: the seven call sites stop writing the visible order; 6: the Tab holds one set of Entries and a Source; 7: per-path facts follow their path; 8: the other Listings share the builder; 9: CI runs the analysis and the tests), each with failing-test-first steps (all checked `[x]`), plus a whole-branch review, a review-focus list, and an "out of scope" section. States tech stack "Flutter 3.41 / Dart 3.11, `provider`, `flutter_test` only (no mocking library — the seam is pure)". It still uses the old name `FileSortType` for the Sort Rule (code now calls it `SortRule`).
- `docs/rea-analysis-playbook.md` (11,674 bytes): "REA Analysis Playbook — Competitive File-Manager Review". Method for statically (Apktool/REA) and dynamically analysing a **competing Android file-manager APK** to learn how it implements features NFile will build; documents the local toolchain (Flutter 3.41.7, Dart 3.11.5, JDK 17, Android SDK platforms 30–36.1, NDK 28.2.13676358, AVD `UltraImage_API30`, apktool 2.12.1, `android/key.properties` + `android/app/nfile-dev.keystore` git-ignored), and a 5-stage procedure (intake → package/manifest → class inventory → native/AOT layer → …). States "Nothing in this repo is modified by the analysis".

### Android manifest (`android/app/src/main/AndroidManifest.xml`)
**Permissions:** `INTERNET`, `ACCESS_NETWORK_STATE`, `ACCESS_WIFI_STATE`, `READ_EXTERNAL_STORAGE` (maxSdk 32), `WRITE_EXTERNAL_STORAGE` (maxSdk 32), `MANAGE_EXTERNAL_STORAGE`, `READ_MEDIA_IMAGES` (**`tools:node="remove"`**), `READ_MEDIA_VIDEO` (**`tools:node="remove"`**), `READ_MEDIA_AUDIO`, `ACCESS_MEDIA_LOCATION`, `REQUEST_INSTALL_PACKAGES`, `REQUEST_DELETE_PACKAGES`, `QUERY_ALL_PACKAGES`, `PACKAGE_USAGE_STATS`, `FOREGROUND_SERVICE`, `FOREGROUND_SERVICE_DATA_SYNC`, `FOREGROUND_SERVICE_MEDIA_PLAYBACK`, `POST_NOTIFICATIONS`.

**Application:** `android:label="NFile"`, `android:icon="@mipmap/ic_launcher"`, `requestLegacyExternalStorage="true"`, `enableOnBackInvokedCallback="true"`.

**Components:**
- Activity `.MainActivity` (exported, `singleTask`, `taskAffinity=""`, `adjustResize`, `configChanges` incl. locale/layoutDirection/fontScale) — intent filters: VIEW PDF; VIEW image/*; VIEW audio/*, video/*, text/*, zip/rar/7z/tar/gz/bz2 + msword/excel/pptx MIME types; SEND and SEND_MULTIPLE with `*/*`.
- Activity aliases: `.MainActivityDefault` (enabled, LAUNCHER), `.MainActivityLogo1`…`Logo4` (disabled by default, LAUNCHER, alternate icons).
- Provider `rikka.shizuku.ShizukuProvider`.
- Provider `.NFileDocumentsProvider` (authority `com.rubex.nfile.documents`, `MANAGE_DOCUMENTS`, `DOCUMENTS_PROVIDER` intent filter).
- Services `.FtpForegroundService` (dataSync), `.WebSharingForegroundService` (dataSync), `com.ryanheise.audioservice.AudioService` (mediaPlayback).
- Receiver `com.ryanheise.audioservice.MediaButtonReceiver`.
- `<queries>`: VIEW `*/*`, PROCESS_TEXT `text/plain`, package `moe.shizuku.privileged.api`, Shizuku REQUEST_PERMISSION.
## 7. The release state

- **Version in `pubspec.yaml`: `1.0.44+44`** (`lib/core/app_version.dart` mirrors `1.0.44`, channel `Stable`).
- **`gh release list --repo mohmaedeslam00116/NFile` → empty (0 releases).** `gh api repos/…/releases` returns `[]`; `releases/tags/v1.0.44` → **404 Not Found**. **There are no GitHub Release objects.**
- **Git *tags* do exist** (31): `v1.0.44, v1.0.43, v1.0.42, v1.0.41, v1.0.40, v1.0.39, v1.0.38, v1.0.37, v1.0.36, v1.0.35, v1.0.34, v1.0.33, v1.0.32, v1.0.31, v1.0.30, v1.0.29, v1.0.28, v1.0.27, v1.0.26, v1.0.25, v1.0.24, v1.0.23, v1.0.22, v1.0.21, v1.0.20, v1.0.17, v1.0.15, v1.0.14, v1.0.13, v1.0.11, latest`. (Missing: v1.0.18, v1.0.19, v1.0.10 and below v1.0.11.)
- **`gh pr list --repo mohmaedeslam00116/NFile --state open` → empty (0 open PRs).** All **15 PRs are closed and MERGED** (#11 "Derive the visible Listing from Entries and rules", #16 manifest media permissions, #17 ephemeral SSH identity, #19 vault seals the file, #20 vault master password Argon2id, #23–#41 the Arabic-l10n migration, one per area).
- **Open issues: 2** — #21 "The application speaks the language of the system: English and Arabic" (enhancement, opened 2026-10-20) and #1 "Architecture: derive the visible Listing from Entries and rules" (enhancement, opened 2026-10-19).
- Repo: `mohmaedeslam00116/NFile`, public, default branch `main`, not archived, last push 2026-10-20T18:31:54Z, 0 stars.
- `build.yml` would create a GitHub Release on the next push to `main` that bumps the version past `v1.0.44`; because the release object for `v1.0.44` does not exist, the version check would **not** skip and would re-build.

---

## Key absolute paths

- `D:\ai\wizard\project game\lib\main.dart`
- `D:\ai\wizard\project game\lib\providers\file_manager_provider.dart`
- `D:\ai\wizard\project game\lib\providers\media_provider.dart`
- `D:\ai\wizard\project game\lib\core\listing\listing_builder.dart` (and siblings in `lib\core\listing\`)
- `D:\ai\wizard\project game\lib\core\kind.dart`
- `D:\ai\wizard\project game\lib\models\folder_tab_model.dart`
- `D:\ai\wizard\project game\lib\services\remote\lan_client.dart` (the SMB stub)
- `D:\ai\wizard\project game\lib\services\web_sharing_service.dart`
- `D:\ai\wizard\project game\lib\services\vault_service.dart`
- `D:\ai\wizard\project game\lib\ui\screens\directory_screen.dart`
- `D:\ai\wizard\project game\lib\ui\screens\global_search_screen.dart` (unreachable)
- `D:\ai\wizard\project game\CONTEXT.md`, `D:\ai\wizard\project game\docs\adr\0001-derived-listing.md`, `D:\ai\wizard\project game\docs\plans\2026-10-19-listing-builder.md`
- `D:\ai\wizard\project game\pubspec.yaml`, `D:\ai\wizard\project game\android\app\src\main\AndroidManifest.xml`
- `D:\ai\wizard\project game\.github\workflows\build.yml`, `D:\ai\wizard\project game\.github\workflows\checks.yml`