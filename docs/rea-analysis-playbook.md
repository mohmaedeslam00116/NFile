# REA Analysis Playbook — Competitive File-Manager Review

> Target: a competing Android file-manager APK (to be supplied).
> Purpose: learn how the competitor implements features we will build in **NFile**
> (fork: `mohmaedeslam00116/NFile` ← upstream `Senzme/NFile`).
> Method: static analysis with REA first, dynamic confirmation on an emulator second.
> Nothing in this repo is modified by the analysis; competitor APKs are read-only inputs.

---

## 1. Environment readiness (verified)

| Component | Value | Status |
|---|---|---|
| Flutter | 3.41.7 stable (`D:\developtool\flutter`) | ✅ |
| Dart | 3.11.5 | ✅ |
| JDK for Gradle | 17 (`C:\Program Files\Microsoft\jdk-17.0.9.8-hotspot`) | ✅ |
| Android SDK | `D:\Android\Sdk` — platforms 30/31/33/34/35/36/36.1, build-tools 36.1.0 | ✅ |
| NDK | 28.2.13676358 (required by `android/app/build.gradle.kts`) | ✅ |
| Android licenses | all accepted (`flutter doctor` clean) | ✅ |
| Emulator AVD | `UltraImage_API30` (Android 11, x86_64, Google APIs) | ✅ (idle) |
| Apktool | `C:\Users\Dell\.apklab\apktool_2.12.1.jar` | ✅ (REA launcher) |
| Build key | `android/key.properties` + `android/app/nfile-dev.keystore` (git-ignored) | ✅ |

> Gradle note: `JAVA_HOME` on this machine points to **JDK 25**, which Gradle 8.14
> (the wrapper version in this repo) does not support. Every build command must run
> with `JAVA_HOME` set to the JDK 17 path above.

---

## 2. Static analysis procedure (REA)

### Stage 0 — Intake
1. Record SHA-256, file size, and `aapt2 dump badging` summary of the competitor APK.
2. Detect the stack before choosing tools:
   - `lib/*/libapp.so` present → **Flutter / Dart AOT** (use `inspect_dart_aot` + Ghidra on `libapp.so`)
   - `lib/*/libunity.so` → Unity (use `open_binary` + `analyze_function`)
   - `classes*.dex` with large `assets/` → React Native / Cordova / native
   - only DEX + no native libs → Java/Kotlin app (use `search_android_classes`)

### Stage 1 — Package & manifest
- `rea.inspect_android_package` → package id, versions, min/target SDK, permissions, components.
- `rea.decode_android_resources` → decoded `AndroidManifest.xml`, `apktool.yml`, `res/values*/strings.xml`.
  Purpose: the manifest tells us the capability set (e.g. `MANAGE_EXTERNAL_STORAGE`,
  `QUERY_ALL_PACKAGES`, `REQUEST_INSTALL_PACKAGES`, MediaStore read perms) and the
  launcher/activities/services/receivers that define the app's feature surface.

### Stage 2 — Class inventory
- `rea.search_android_classes` (empty query = full inventory) → every top-level class.
- `rea.inspect_android_class` on the interesting ones → methods/fields.
- `rea.inspect_android_method` (with `overload_index`) for the hot paths.
- `rea.trace_android_references` → who calls a method (e.g. the delete/copy engine).

### Stage 3 — Native / AOT layer
- `rea.open_binary` on the extracted `libapp.so` (or other `.so`).
- `rea.analyze_function` + `rea.procedure_callers/callees` + `rea.trace_native_values`.
- `rea.inspect_dart_aot` for Flutter: locates the four snapshot symbols in the ELF
  dynamic symbol table (offsets/sizes) — the entry points for Dart AOT code.
- `rea.inspect_binary_layout` → sections/segments (useful to strip a `.so` before diffing).

### Stage 4 — Strings & resources
- `rea.search_strings` for feature keywords (see §4) — finds settings labels, feature names,
  and the strings the app ships (often the fastest way to enumerate features).
- Compare against the competitor's `res/values-*/strings.xml` for per-language coverage.

### Stage 5 — Dynamic confirmation (emulator)
1. Boot the AVD: `emulator -avd UltraImage_API30 -no-window -no-audio -gpu swiftshader_indirect`
2. `adb install <competitor.apk>` → `rea.inspect_adb_package` for the installed manifest.
3. Use `rea.list_adb_directory`, `rea.list_adb_processes`, `rea.list_adb_services` to observe.
4. Drive the UI (ADB input / `capture_process_scenario`) to record the real feature flows.

### Stage 6 — Evidence
- `rea.export_evidence_bundle` → deterministic JSON bundle of the whole analysis.
- `rea.close_binary` with a snapshot path so the analysis can be resumed later.

---

## 2.7 Rehearsal: validate the pipeline on our own APK first

Before pointing REA at the competitor, run the exact same procedure on
`build/app/outputs/flutter-apk/app-release.apk` (our own build). This validates every
tool in the chain and gives us a **ground-truth reference** for our own code.

Why it is a faithful rehearsal: NFile is Flutter/Dart, so its APK ships
`lib/<abi>/libapp.so` (Dart AOT) + `libflutter.so` — byte-for-byte the same structure as
any Flutter-based competitor. The `inspect_dart_aot` / `analyze_function` path we
rehearse here is the exact path we will need for a Flutter competitor, and it is also
the best way to learn our own shipped surface (permissions, components, assets, strings).

Rehearsal checklist:
- [ ] `inspect_android_package` → compare manifest against `android/app/src/main/AndroidManifest.xml`
- [ ] `decode_android_resources` → confirm decoded manifest + `res/` + `assets/`
- [ ] `search_android_classes` → inventory the Kotlin layer
      (`MainActivity` 53 KB, `NFileDocumentsProvider`, 2 foreground services)
- [ ] `inspect_dart_aot` → locate the 4 snapshot symbols in `libapp.so`
- [ ] `analyze_function` on one Dart AOT entry → confirm decompilation works
- [ ] `search_strings` → recover our own UI strings and compare with the code map
- [ ] `export_evidence_bundle` → confirm the bundle exports cleanly

---


For every feature row below, record for the competitor: **implementation mechanism**,
**API/plugin used**, **files touched**, **permission needed**, **UI surface**.

NFile column is pre-filled from a static code map of our fork
(`lib/` ≈ 45k LOC / 103 files, `provider` state management, no i18n layer).

| Feature | NFile (ours) | Competitor | Notes |
|---|---|---|---|
| File browser / listing | `file_manager_provider.dart` (`loadDirectory` L1621) + `directory_screen.dart`; address bar `nfile_address_bar.dart`; tabs `directory_tab_bar.dart` | | |
| Copy / cut / paste / move | `file_manager_provider.dart` (`setClipboard` L1277, `pasteFile` L1887, `moveItem` L2955, `copyItem` L3036); drag&drop `drag_drop_handler.dart` | | |
| Rename / delete | `renameFile` L2563, `deleteSelected` L1853; batch rename `batch_rename_dialog.dart` (pattern/padding/find-replace) | | |
| Recycle bin | ✅ `recycle_bin_service.dart` (trash `.nfile_trash`) + `recycle_bin_screen.dart` | | |
| Search | Hybrid: MediaStore index + streamed recursive `Directory.list()` (`executeSearchForTab` L1063); `global_search_screen.dart` | | |
| Sorting / filtering | `FileSortType` L44 + per-folder overrides (`preferences_service` L192); `FileFilterType`; natural sort `utils.dart` L232 | | |
| Storage overview | `StatFs` over MethodChannel + **marketing-tier rounding** (`updateStorageSpace` L1379); radial chart `storage_analyzer_screen.dart` | | |
| App manager | `app_manager_service.dart` (list/uninstall/launch/APK backup/split-install, app-icon switching) | | |
| Media indexing | `media_provider.dart` (1642) — `photo_manager` + `on_audio_query`; disk-cached index; `ThumbnailCache` 300×300 on-disk; custom/excluded category paths | | |
| Video player | `media_kit` — playlist, 2× long-press, double-tap ±N s seek, vertical vol/brightness (`video_player_screen.dart`) | | |
| Audio player | `media_kit` + `audio_service` background; waveform bar, particle visualiser, LRC lyrics, pitch/speed (`audio_player_screen.dart`) | | |
| Image viewer | `photo_view` + gallery siblings/preload; **AVIF** via forked `flutter_avif` | | |
| Text / code editor | `text_editor_screen.dart` — regex syntax highlight (HTML/XML/JSON/C), 50k-char cutoff, write-back to `content://` URI | | |
| Document viewers | PDF (`syncfusion`), Markdown, HTML, DOCX, XLS/XLSX, XML tree, SQLite browser | | |
| Archive support | ✅ `archive_service.dart` — zip/tar/gz/bz2/**lz4**/**zst**, AES password, **multi-volume split**, background isolate + cancellable notification | | |
| Remote / SMB / FTP | `services/remote/` — FTP, SFTP (`dartssh2`), WebDAV, SAF, LAN discovery (254-host port scan) | | |
| Built-in FTP server | ✅ `ftp_server_service.dart` (hand-written control+passive sockets) + native foreground service | | |
| Web / internet sharing | ✅ `web_sharing_service.dart` (2218) — HTTP server + SSH reverse tunnel (hard-coded ed25519 key!) | | |
| Cloud storage | ❌ none (no Drive/Dropbox/OneDrive) | | |
| Root / Shizuku privileged ops | ✅ `root_shizuku_service.dart` — shell commands via `su`/Shizuku → `/android/data`, `/android/obb`, `/data` | | |
| Vault / private files | ✅ `vault_service.dart` — XOR+SHA-256 scrambling, tag `NFILE_VAULT_V1`, PIN lock screen | | |
| Split-screen dual pane | ✅ `pane_browser.dart` (drag&drop between two independent FolderTabs) | | |
| Dark / AMOLED theme | `theme.dart` — Material 3 `fromSeed` (fidelity), AMOLED pitch-black, dynamic_color (Material You), 6 font families + runtime custom TTF | | |
| Icons | Custom "Broken" icon font pack (913 glyphs) + 5 launcher `activity-alias` icons, switchable | | |
| Localization / RTL | ❌ **none** — hard-coded English, no `flutter_localizations`, no ARB/JSON | | ← biggest gap |
| Ads / analytics / telemetry | none observed | | |
| Permission surface | `MANAGE_EXTERNAL_STORAGE`, `READ_MEDIA_AUDIO`, `ACCESS_MEDIA_LOCATION`, `QUERY_ALL_PACKAGES`, `PACKAGE_USAGE_STATS`, `REQUEST_INSTALL_PACKAGES`, `REQUEST_DELETE_PACKAGES` | | |
| DocumentsProvider | ✅ `NFileDocumentsProvider.kt` (exposes NFile to the system picker) | | |

### NFile complexity hot-spots (where a competitor may out-perform us)
| File | LOC | Area |
|---|---|---|
| `lib/providers/file_manager_provider.dart` | 3118 | everything file-system |
| `lib/ui/screens/directory_screen.dart` | 2917 | main browse UI |
| `lib/ui/screens/more_settings_screen.dart` | 2747 | settings hub + 7 sub-screens |
| `lib/ui/screens/media_category_screen.dart` | 2429 | 8 media types in one screen |
| `lib/services/web_sharing_service.dart` | 2218 | HTTP + SSH tunnel |
| `lib/providers/media_provider.dart` | 1642 | media index + thumbnails |

---

## 4. Feature-detection keyword bank

Search these strings in the competitor APK to detect capabilities:
`copy`, `move`, `rename`, `delete`, `recycle`, `trash`, `search`, `filter`, `sort`,
`zip`, `unzip`, `compress`, `extract`, `hash`, `checksum`, `md5`, `sha256`,
`app manager`, `uninstall`, `apk`, `split apk`, `smb`, `ftp`, `sftp`, `webdav`,
`ssh`, `sftp`, `cloud`, `drive`, `onedrive`, `dropbox`, `nfs`, `webdav`, `lan`,
`root`, `su `, `shizuku`, `media store`, `exif`, `metadata`, `thumbnail`,
`storage analyzer`, `disk usage`, `duplicate`, `large files`, `empty folder`,
`share`, `shortcut`, `home screen widget`, `notification`, `background service`.

---

## 5. Definition of done for the analysis

- [ ] Competitor APK hashed and identified (stack, version, target SDK)
- [ ] Manifest capabilities enumerated (permissions → feature mapping)
- [ ] Feature matrix in §3 filled for the competitor
- [ ] At least 5 features traced to concrete code (class/method or AOT symbol)
- [ ] 3 features identified where the competitor is **better** than NFile → backlog items
- [ ] 2 features identified where NFile is better → do not regress
- [ ] Evidence bundle exported
- [ ] Findings turned into an ordered NFile implementation backlog
