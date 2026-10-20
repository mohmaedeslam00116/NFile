// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'NFile';

  @override
  String get openingSharedDocument => 'Opening shared document...';

  @override
  String get resolvingSecureContent => 'Resolving secure content stream';

  @override
  String get storageAccessRequired => 'Storage Access Required';

  @override
  String get storageAccessExplanation =>
      'NFile requires storage permission to manage, organize, and display your media files seamlessly.';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String couldNotOpenLink(String url) {
    return 'Could not open link: $url';
  }

  @override
  String get aboutNFile => 'About NFile';

  @override
  String appVersionWithChannel(String version, String channel) {
    return 'v$version ($channel)';
  }

  @override
  String get aboutDescription =>
      'NFile is a beautiful, fluid, and open-source file manager and offline media hub built with Flutter. Designed for extreme performance, clean glassmorphic aesthetics, and seamless user experiences.';

  @override
  String get coreHighlights => 'Core Highlights';

  @override
  String get extremeSpeed => 'Extreme Speed';

  @override
  String get statelessCaching => 'Stateless caching & async scans';

  @override
  String get vaultSecure => 'Vault Secure';

  @override
  String get encryptedWorkspace => 'Encrypted safe workspace';

  @override
  String get serversHub => 'Servers Hub';

  @override
  String get richUi => 'Rich UI';

  @override
  String get amoledBlack => 'AMOLED Black & beautiful seeds';

  @override
  String get connectAndShare => 'Connect & Share';

  @override
  String get starOnRepository => 'Star on Repository';

  @override
  String get joinTelegramChannel => 'Join Telegram Channel';

  @override
  String get shareAppWithFriends => 'Share App with Friends';

  @override
  String get exploreSourceCode => 'Explore GitHub Source Code';

  @override
  String get madeWithLove => 'Made with ❤️ by Rubex';

  @override
  String get copyrightNotice => 'Copyright © 2026 NFile. All rights reserved.';

  @override
  String copiedItemsToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Copied $count items to clipboard',
      one: 'Copied 1 item to clipboard',
    );
    return '$_temp0';
  }

  @override
  String cutItemsToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cut $count items to clipboard',
      one: 'Cut 1 item to clipboard',
    );
    return '$_temp0';
  }

  @override
  String errorSharing(String error) {
    return 'Error sharing: $error';
  }

  @override
  String get noFilesToShare => 'No files available to share.';

  @override
  String get deleteSelected => 'Delete Selected';

  @override
  String get successfullyDeletedItems => 'Successfully deleted items';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get cutToClipboard => 'Cut to clipboard';

  @override
  String get enterNewName => 'Enter new name';

  @override
  String get deleteFile => 'Delete File';

  @override
  String get selectAll => 'Select All';

  @override
  String get noRecentFiles => 'No recent files';

  @override
  String get noRecentFilesHint =>
      'Newly created or downloaded files will show up here.';

  @override
  String selectedItemsWithSize(int count, String size) {
    return '$count Selected ($size)';
  }

  @override
  String get moreActions => 'More Actions';

  @override
  String get dashboardRefreshed => 'Dashboard refreshed successfully';

  @override
  String get exitApplication => 'Exit Application';

  @override
  String get confirmExitMessage =>
      'Are you sure you want to exit? Press back again or tap Exit to close the app.';

  @override
  String get pressBackAgainToExit => 'Press back again to exit';

  @override
  String get myFiles => 'My Files';

  @override
  String get refreshDashboard => 'Refresh Dashboard';

  @override
  String get newTab => 'New Tab';

  @override
  String get duplicateTab => 'Duplicate Tab';

  @override
  String get closeOtherTabs => 'Close Other Tabs';

  @override
  String get closeTab => 'Close Tab';

  @override
  String get showInLocation => 'Show in location';

  @override
  String countAndName(int count, String name) {
    return '$count $name';
  }

  @override
  String countAndDate(String count, String date) {
    return '$count • $date';
  }

  @override
  String labelActive(String label) {
    return '$label Active';
  }

  @override
  String get noMatchesFound => 'No matching directories or files found';

  @override
  String pathNotFound(String path) {
    return 'Path not found: $path';
  }

  @override
  String get enterAbsolutePath => 'Enter absolute path...';

  @override
  String copiedPath(String path) {
    return 'Copied: $path';
  }

  @override
  String get systemRoot => 'System Root';

  @override
  String get globalSearch => 'Global Search';

  @override
  String get recycleBin => 'Recycle Bin';

  @override
  String get serversAndTools => 'Servers & Tools';

  @override
  String get privateWallet => 'Private Wallet';

  @override
  String get ftpServer => 'FTP Server';

  @override
  String get webSharing => 'Web Sharing';

  @override
  String get addRemoteConnection => 'Add Remote Connection';

  @override
  String get quickCategories => 'Quick Categories';

  @override
  String get addShortcut => 'Add Shortcut';

  @override
  String get moreSettings => 'More Settings';

  @override
  String appVersion(String version) {
    return 'NFile v$version';
  }

  @override
  String get beautifulMediaSuite => 'Beautiful Media Suite';

  @override
  String get openWith => 'Open with...';

  @override
  String get builtInViewer => 'Built-in NFile Viewer';

  @override
  String get builtInViewerDescription => 'NFile\'s custom native experience';

  @override
  String get systemExternalApp => 'System External App';

  @override
  String get externalAppDescription => 'Open with third party apps on device';

  @override
  String get justOnce => 'Just once';

  @override
  String get goToParentDirectory => 'Go to Parent Directory';

  @override
  String get searchInTab => 'Search in tab';

  @override
  String get noResults => 'No results';

  @override
  String get emptyFolder => 'Empty Folder';

  @override
  String get internalStorage => 'Internal Storage';

  @override
  String get browseDeviceFiles => 'Browse device files';

  @override
  String storageUsed(String size) {
    return '$size used';
  }

  @override
  String storageTotal(String size) {
    return '$size total';
  }

  @override
  String storageUsedPercent(int percent) {
    return '$percent% Used';
  }

  @override
  String storageFree(String size) {
    return '$size free';
  }

  @override
  String get noShortcutsPinned => 'No shortcuts pinned. Tap Customize to add.';

  @override
  String get customizeShortcuts => 'Customize Shortcuts';

  @override
  String get dragToReorderHint =>
      'Drag items by the handle (=) to reorder icons on the Home Screen.';

  @override
  String get addFolderFileShortcut => 'Add Folder / File Shortcut';

  @override
  String get customPaths => 'Custom Paths';

  @override
  String customPathsCount(int count) {
    return '$count custom path(s)';
  }

  @override
  String get deleteShortcut => 'Delete Shortcut';

  @override
  String get defaultScanLocations => 'Default Scan Locations:';

  @override
  String get restoreLocation => 'Restore Location';

  @override
  String get excludeLocation => 'Exclude Location';

  @override
  String get customScanLocations => 'Custom Scan Locations:';

  @override
  String get noCustomPaths => 'No custom paths added.';

  @override
  String get addCustomPath => 'Add Custom Path';

  @override
  String get recentFiles => 'Recent Files';

  @override
  String get viewAll => 'View All';

  @override
  String get restrictedSystemFolder => 'Restricted System Folder';

  @override
  String get restrictedFolderExplanation =>
      'Android 11+ restricts standard access to Android/data and Android/obb folders to protect app data. To view and modify these files, NFile requires advanced permissions.';

  @override
  String get useRootAccess => 'Use Root Access (Superuser)';

  @override
  String get grantShizukuAccess => 'Grant Shizuku Access (No Root)';

  @override
  String get howToSetupShizuku => 'How to setup Shizuku?';

  @override
  String get searchSettings => 'Search settings...';

  @override
  String failedToTransfer(String error) {
    return 'Failed to transfer: $error';
  }

  @override
  String get operationCancelled => 'Operation Cancelled';

  @override
  String failedToConnect(String error) {
    return 'Failed to connect to remote server: $error';
  }

  @override
  String get compressionLimitExceeded => 'Compression Limit Exceeded';

  @override
  String get cannotMoveFolderIntoItself =>
      'Cannot move a folder inside itself or same location';

  @override
  String movedSuccessfully(String name) {
    return 'Moved $name successfully';
  }

  @override
  String failedToMoveItem(String error) {
    return 'Failed to move item: $error';
  }

  @override
  String get cannotCopyFolderIntoItself =>
      'Cannot copy a folder inside itself or same location';

  @override
  String copiedSuccessfully(String name) {
    return 'Copied $name successfully';
  }

  @override
  String failedToCopyItem(String error) {
    return 'Failed to copy item: $error';
  }

  @override
  String get sdCard => 'sdCard';

  @override
  String transferFailed(String error) {
    return 'Transfer failed: $error';
  }

  @override
  String get movedItemsSuccessfully => 'Moved items successfully';

  @override
  String get copiedItemsSuccessfully => 'Copied items successfully';

  @override
  String get releaseChannel => 'releaseChannel';

  @override
  String get preparingShare => 'Preparing folders for sharing...';

  @override
  String get compressingContents => 'Compressing contents, please wait';

  @override
  String get noShareableItems => 'No shareable items found.';

  @override
  String errorPreparingShare(String error) {
    return 'Error preparing files to share: $error';
  }

  @override
  String get newFile => 'New File';

  @override
  String get fileName => 'File name';

  @override
  String fileNameTaken(String fileName, String createdName) {
    return '\"$fileName\" already exists. Created \"$createdName\" instead.';
  }

  @override
  String get newFolder => 'New Folder';

  @override
  String get folderName => 'Folder name';

  @override
  String folderNameTaken(String folderName, String createdName) {
    return '\"$folderName\" already exists. Created \"$createdName\" instead.';
  }

  @override
  String get createNewDirectory => 'Create a new directory';

  @override
  String get createNewTextDocument => 'Create a new empty text document';

  @override
  String get newArchive => 'New Archive';

  @override
  String get compressFolderContents => 'Compress current folder contents';

  @override
  String get viewAndSortOptions => 'View & Sort Options';

  @override
  String get layoutMode => 'Layout Mode';

  @override
  String get listView => 'List View';

  @override
  String get gridView => 'Grid View';

  @override
  String get sizeAndPaddingOptions => 'Size & Padding Options';

  @override
  String get iconAndFolderSize => 'Icon & Folder Size';

  @override
  String get itemPaddingAndSpacing => 'Item Padding & Spacing';

  @override
  String get sortBy => 'Sort By';

  @override
  String get showHiddenFiles => 'Show Hidden Files';

  @override
  String get showHiddenHint =>
      'Display system files and folders starting with a dot (.)';

  @override
  String get onlyThisFolder => 'Only this folder';

  @override
  String get onlyThisFolderHint =>
      'Enable custom sorting specific to this folder';

  @override
  String get storageVolumes => 'Storage Volumes';

  @override
  String get networkConnections => 'Network Connections';

  @override
  String get addNetworkConnection => 'Add Network Connection';

  @override
  String connectionTypeAndHost(String type, String host) {
    return '$type • $host';
  }

  @override
  String get removeConnection => 'Remove Connection';

  @override
  String get createNew => 'Create New';

  @override
  String foldersCount(int count) {
    return 'folders: $count';
  }

  @override
  String filesCount(int count) {
    return 'files: $count';
  }

  @override
  String get noResultsFound => 'No results found';

  @override
  String nothingMatchesSearch(String query, String filter) {
    return 'We could not find anything matching \"$query\" under $filter';
  }

  @override
  String get emptyFolderHint =>
      'This directory does not contain any files or subfolders.';

  @override
  String get actionCancelled => 'Action cancelled / Clipboard cleared';

  @override
  String get pastedHoldingClipboard =>
      'Pasted (holding clipboard for multiple pastes)';

  @override
  String get pastedSuccessfully => 'Pasted successfully';

  @override
  String get pasteHere => 'Paste Here';

  @override
  String get selectMode => 'Select Mode';

  @override
  String get storageVolumesAndSdCard => 'Storage Volumes & SD Card';

  @override
  String labelFilterActive(String label) {
    return '$label Filter Active';
  }

  @override
  String get createFolder => 'Create Folder';

  @override
  String get enterFolderName => 'Enter folder name';

  @override
  String errorCreatingFolder(String error) {
    return 'Error creating folder: $error';
  }

  @override
  String get selectStorageDrive => 'Select Storage Drive';

  @override
  String get selectStorage => 'Select Storage';

  @override
  String get clearSelection => 'Clear Selection';

  @override
  String get folderIsEmpty => 'Folder is empty';

  @override
  String pinSelected(int count) {
    return 'Pin Selected ($count)';
  }

  @override
  String get pinThisFolder => 'Pin This Folder';

  @override
  String addSelected(int count) {
    return 'Add Selected ($count)';
  }

  @override
  String get overallProgress => 'Overall Progress';

  @override
  String get renamingFiles => 'Renaming files...';

  @override
  String get updatingFolderContent => 'Please wait, updating folder content';

  @override
  String get batchRename => 'Batch Rename';

  @override
  String configuringItems(int count) {
    return 'Configuring $count items';
  }

  @override
  String get placeholderName => '% (Name)';

  @override
  String get placeholderNameHint => 'Original name (%)';

  @override
  String get placeholderNum => '# (Num)';

  @override
  String get placeholderNumHint => 'Sequential number (#)';

  @override
  String get placeholderTripleHint => 'Triple sequential number (###)';

  @override
  String placeholderBase(String n) {
    return '$n (Base)';
  }

  @override
  String placeholderBaseHint(String n) {
    return 'File name without extension ($n)';
  }

  @override
  String placeholderExtensionWithDot(String de) {
    return '$de (.ext)';
  }

  @override
  String placeholderExtensionWithDotHint(String de) {
    return 'Extension with dot ($de)';
  }

  @override
  String placeholderExtension(String e) {
    return '$e (ext)';
  }

  @override
  String placeholderExtensionHint(String e) {
    return 'Extension without dot ($e)';
  }

  @override
  String placeholderFull(String N) {
    return '$N (Full)';
  }

  @override
  String placeholderFullHint(String N) {
    return 'Full name with extension ($N)';
  }

  @override
  String get namePattern => 'Name Pattern';

  @override
  String get namePatternExample => 'e.g. Image_#';

  @override
  String get startNumber => 'Start Number';

  @override
  String get findText => 'Find text';

  @override
  String get searchTerm => 'Search term';

  @override
  String get replaceWith => 'Replace with';

  @override
  String get renamePreview => 'Rename Preview';

  @override
  String reviewingItems(int count) {
    return 'Reviewing $count items';
  }

  @override
  String get backToEdit => 'Back to Edit';

  @override
  String get applyChanges => 'Apply Changes';

  @override
  String get fileAlreadyExists => 'File Already Exists';

  @override
  String fileConflictQuestion(String fileName) {
    return 'A file named \"$fileName\" already exists in the destination folder. What would you like to do?';
  }

  @override
  String get existingFile => 'Existing File';

  @override
  String get applyToAllConflicts => 'Apply to all remaining conflicts';

  @override
  String get cancelPaste => 'Cancel Paste';

  @override
  String get keepBoth => 'Keep Both';

  @override
  String get renameFile => 'Rename File';

  @override
  String get newFilename => 'New filename';

  @override
  String get createArchive => 'Create Archive';

  @override
  String get archiveName => 'Archive Name';

  @override
  String get archiveFormat => 'Archive Format';

  @override
  String compressionLevel(String level) {
    return 'Compression Level: $level';
  }

  @override
  String get passwordOptional => 'Password (Optional)';

  @override
  String get splitVolumeSize => 'Split Volume Size in MB (Optional)';

  @override
  String get splitVolumeSizeHint => 'Leave empty for single archive';

  @override
  String get deleteSourceAfter => 'Delete source files after completion';

  @override
  String get separateArchivePerFile => 'Create separate archive for each file';

  @override
  String get dragAndDropOptions => 'Drag & Drop Options';

  @override
  String get destinationLocation => 'Destination Location';

  @override
  String get droppedFolder => 'Dropped Folder';

  @override
  String get currentFolder => 'Current Folder';

  @override
  String get chooseAction => 'Choose Action';

  @override
  String get moveHere => 'Move here';

  @override
  String get moveHereHint => 'Cut & paste item into destination folder';

  @override
  String get copyHere => 'Copy here';

  @override
  String get copyHereHint => 'Leaves original file intact and duplicates here';

  @override
  String get archiveHere => 'Archive here';

  @override
  String get archiveHereHint => 'Compress item into a zip/tar archive here';

  @override
  String archiveCreated(String name) {
    return 'Archive \"$name\" created successfully!';
  }

  @override
  String failedToCreateArchive(String error) {
    return 'Failed to create archive: $error';
  }

  @override
  String get extractArchive => 'Extract Archive';

  @override
  String get extractToFolder => 'Extract to Folder';

  @override
  String get passwordIfEncrypted => 'Password (if encrypted)';

  @override
  String get allFiles => 'All Files';

  @override
  String get allFilesHint => 'Show all files and folders in this directory';

  @override
  String get documentsOnly => 'Documents only';

  @override
  String get documentsOnlyHint =>
      'PDFs, Word docs, spreadsheets, texts, and e-books';

  @override
  String get imagesOnly => 'Images only';

  @override
  String get imagesOnlyHint => 'JPEGs, PNGs, WebPs, and raw photo formats';

  @override
  String get audioOnly => 'Audio only';

  @override
  String get audioOnlyHint => 'MP3s, WAVs, AACs, and high-fidelity audios';

  @override
  String get videosOnly => 'Videos only';

  @override
  String get videosOnlyHint => 'MP4s, MKVs, WebMs, and high-res video clips';

  @override
  String get archivesOnly => 'Archives only';

  @override
  String get archivesOnlyHint => 'ZIPs, 7Zs, RARs, and other compressed assets';

  @override
  String get filterFilesByType => 'Filter Files By Type';

  @override
  String get filterFilesHint =>
      'Select a category to display matching files only';

  @override
  String processingItem(int current, int total) {
    return 'Processing item $current of $total';
  }

  @override
  String get transferSpeed => 'Transfer Speed';

  @override
  String get estimatedTime => 'Est. Time';

  @override
  String get dataProcessed => 'Data Processed';

  @override
  String get cancelOperation => 'Cancel Operation';

  @override
  String get pastedItemsSuccessfully => 'Pasted items successfully';

  @override
  String get calculatingSizes => 'Calculating sizes...';

  @override
  String get itemsSelected => 'Items Selected';

  @override
  String get totalSize => 'Total Size';

  @override
  String get selectedPaths => 'Selected Paths:';

  @override
  String copiedLabelToClipboard(String label) {
    return 'Copied $label to clipboard';
  }

  @override
  String get copySelected => 'Copy Selected';

  @override
  String get cutSelected => 'Cut Selected';

  @override
  String get archiveCompress => 'Archive (Compress)';

  @override
  String get propertiesAndInfo => 'Properties & Info';

  @override
  String get extractingBundle =>
      'Extracting package bundle for installation...';

  @override
  String get noInstallableApk => 'No installable APK found in package bundle';

  @override
  String get failedToTriggerInstaller =>
      'Failed to trigger split APK installer';

  @override
  String failedToExtractBundle(String error) {
    return 'Failed to extract package bundle: $error';
  }

  @override
  String get settingsBackedUp =>
      'Settings backed up to NFile/Backups/Settings/nfile_settings_backup.json';

  @override
  String failedToBackupSettings(String error) {
    return 'Failed to backup settings: $error';
  }

  @override
  String get settingsRestored => 'Settings restored successfully!';

  @override
  String failedToRestoreSettings(String error) {
    return 'Failed to restore settings: $error';
  }

  @override
  String get backupAndRestore => 'Backup & Restore';

  @override
  String get backupSettings => 'Backup Settings';

  @override
  String get backupSettingsHint =>
      'Save all your current settings to NFile/Backups/Settings/';

  @override
  String get restoreSettings => 'Restore Settings';

  @override
  String get restoreSettingsHint =>
      'Select and restore settings from a JSON backup file';

  @override
  String get selectValidBackupFile =>
      'Please select a valid .json settings backup file';

  @override
  String get settingsCategories => 'Settings Categories';

  @override
  String get generalAndBehavior => 'General & Behavior';

  @override
  String get generalAndBehaviorHint =>
      'Default screen, navigation controls, and shortcuts';

  @override
  String get appearanceAndThemes => 'Appearance & Themes';

  @override
  String get appearanceAndThemesHint =>
      'Themes, app icons, folder styles, and typography';

  @override
  String get fileExplorerOptions => 'File Explorer Options';

  @override
  String get fileExplorerOptionsHint =>
      'Address bar, hidden files, tabs, and drag & drop';

  @override
  String get listAndLayoutStyling => 'List & Layout Styling';

  @override
  String get listAndLayoutStylingHint =>
      'Folder sizes, counts, and time/date formats';

  @override
  String get mediaPreferences => 'Media Preferences';

  @override
  String get mediaPreferencesHint =>
      'Default album view and thumbnail previews';

  @override
  String get fileActionsAndViewers => 'File Actions & Viewers';

  @override
  String get fileActionsAndViewersHint =>
      'Open actions and default viewers configuration';

  @override
  String get recycleBinTrash => 'Recycle Bin (Trash)';

  @override
  String get recycleBinTrashHint =>
      'Recycle bin toggles and auto-delete duration';

  @override
  String get noSettingsFound => 'No settings found';

  @override
  String get tryAnotherKeyword => 'Try searching for another keyword';

  @override
  String get defaultToBrowseScreen => 'Default to Browse Screen';

  @override
  String get defaultToBrowseScreenHint =>
      'Directly launch into the Browse storage explorer on app start';

  @override
  String get rememberLastFolder => 'Remember Last Opened Folder';

  @override
  String get rememberLastFolderHint =>
      'Open the last folder you browsed when launching the app';

  @override
  String get showHomeBrowseBottomBar => 'Show Home & Browse Bottom Bar';

  @override
  String get showHomeBrowseBottomBarHint =>
      'Toggle bottom navigation bar visibility on the Home screen';

  @override
  String get hideBottomNavLabels => 'Hide Bottom Navigation Labels';

  @override
  String get hideBottomNavLabelsHint =>
      'Hide text labels of the bottom bar (Home/Browse) for a cleaner and compact look';

  @override
  String get hideAndroidNavBar => 'Hide Android Navigation Bar';

  @override
  String get hideAndroidNavBarHint =>
      'Hide bottom navigation bar to maximize screen real estate (swiping up displays it)';

  @override
  String get preventLeftBackGesture => 'Prevent Left Back Gesture for Drawer';

  @override
  String get preventLeftBackGestureHint =>
      'Excludes the left edge of the screen from Android system back gestures, making it easier to swipe open the drawer. You can still swipe from the right edge to go back.';

  @override
  String get appExitBehavior => 'App Exit Behavior';

  @override
  String get showBottomNavBar => 'Show Bottom Navigation Bar';

  @override
  String get showBottomNavBarHint =>
      'Enable bottom action bar on Browse screen';

  @override
  String get hideActionBarLabels => 'Hide Action Bar Text Labels';

  @override
  String get hideActionBarLabelsHint =>
      'Show only icons in selection action bar at bottom of Browse & Media screens';

  @override
  String get customizeShortcutsHint =>
      'Reorder and toggle visibility of quick category items';

  @override
  String get showRecentFiles => 'Show Recent Files';

  @override
  String get showRecentFilesHint =>
      'Display the list of recently accessed files on the Home screen';

  @override
  String get accentColorDynamicTheme => 'Accent Color / Dynamic Theme';

  @override
  String get folderIconStyle => 'Folder Icon Style';

  @override
  String get drawerButtonStyle => 'App Drawer Button Style';

  @override
  String get amoledBlackMode => 'AMOLED Black Mode';

  @override
  String get amoledBlackModeHint =>
      'Use pitch black background in Dark Mode for AMOLED screens';

  @override
  String get appIcon => 'App Icon';

  @override
  String get appTypographyFontFamily => 'App Typography / Font Family';

  @override
  String get useExpressiveIcons => 'Use Expressive Material Icons';

  @override
  String get useExpressiveIconsHint =>
      'Replace custom Broken icons with standard Material Design icons';

  @override
  String get showAddressBar => 'Show Address Bar';

  @override
  String get showAddressBarHint =>
      'Display an editable Windows-Explorer-style address bar at the top of file list';

  @override
  String get showFloatingAddButton => 'Show Floating \'+\' Button';

  @override
  String get showFloatingAddButtonHint =>
      'Enable quick creation (+) button at bottom of Browse screen';

  @override
  String get showHiddenFilesHint =>
      'Display system files and folders starting with a dot (.)';

  @override
  String get highlightExitedFolder => 'Highlight Exited Folder';

  @override
  String get highlightExitedFolderHint =>
      'Briefly flash and scroll to the folder you just exited when going back';

  @override
  String get enableMultipleTabs => 'Enable Multiple Tabs';

  @override
  String get enableMultipleTabsHint =>
      'Allow opening multiple folders in separate tabs for quick navigation';

  @override
  String get enableSplitScreen => 'Enable Split Screen';

  @override
  String get enableSplitScreenHint =>
      'Browse two directories side by side and transfer files easily';

  @override
  String get enableDragAndDrop => 'Enable Drag & Drop';

  @override
  String get enableDragAndDropHint =>
      'Long press and drag folders or files to move them into other folders';

  @override
  String get confirmDragAndDrop => 'Confirm Drag & Drop Actions';

  @override
  String get confirmDragAndDropHint =>
      'Show options popup (Copy, Move, Archive) when dropping files';

  @override
  String get showCountHeader => 'Show Folder & File Count Header';

  @override
  String get showCountHeaderHint =>
      'Display total folders and files count under storage title bar';

  @override
  String get showFolderContentCount => 'Show Folder Content Count';

  @override
  String get showFolderContentCountHint =>
      'Calculate and display total files and folders inside directory listings';

  @override
  String get showFolderSize => 'Show Folder Size';

  @override
  String get showFolderSizeHint =>
      'Calculate and display total size of all files inside directories (can affect listing performance)';

  @override
  String get use24HourTime => 'Use 24-Hour Time Format';

  @override
  String get use24HourTimeHint =>
      'Toggle between 12-hour (AM/PM) and 24-hour time formatting across lists';

  @override
  String get hideTimeAndDate => 'Hide Time & Date from Lists';

  @override
  String get hideTimeAndDateHint =>
      'Completely hide modification dates and times under files and folders';

  @override
  String get adaptiveMultiLineNames => 'Adaptive Multi-line Filenames';

  @override
  String get adaptiveMultiLineNamesHint =>
      'Allow filenames to wrap 3 lines instead of truncating';

  @override
  String get hideThreeDotButtons => 'Hide 3-Dot Action Buttons';

  @override
  String get hideThreeDotButtonsHint =>
      'Hide the three-dot option menu button next to folders and files';

  @override
  String get threeDotTrailingInfo => '3-Dot Disabled Trailing Info';

  @override
  String get defaultAlbumView => 'Default Album Preferred View';

  @override
  String get defaultAlbumViewHint =>
      'Open Images/Videos quick categories directly in Folders (Albums) preferred view';

  @override
  String get showMediaPreviews => 'Show Media Previews';

  @override
  String get showMediaPreviewsHint =>
      'Display actual image and video thumbnails instead of generic file icons';

  @override
  String get skipOpenWithDialog => 'Skip \"Open With\" Dialog';

  @override
  String get skipOpenWithDialogHint =>
      'Bypass the application choice dialog and immediately open files with default viewers';

  @override
  String get resetDefaultViewers => 'Reset Default File Viewers';

  @override
  String get resetDefaultViewersHint =>
      'Clear all remembered \"Open With\" associations for file viewers';

  @override
  String get viewersReset => 'All default viewer choices have been reset';

  @override
  String get enableRecycleBin => 'Enable Recycle Bin';

  @override
  String get enableRecycleBinHint =>
      'Move deleted files and folders to a hidden Recycle Bin instead of deleting permanently';

  @override
  String get autoDeleteDuration => 'Auto-Delete Trash Duration';

  @override
  String get autoDeleteDurationHint =>
      'Items in the Recycle Bin will be permanently deleted after this duration.';

  @override
  String get chooseTrailingInfoStyle => 'Choose Trailing Info Style';

  @override
  String get chooseTrailingInfoStyleHint =>
      'Choose what is displayed on the right side of files and folders when the 3-dot action buttons are hidden.';

  @override
  String get chooseExitBehavior => 'Choose Exit Behavior';

  @override
  String get chooseAccentTheme => 'Choose Accent Theme';

  @override
  String get chooseFolderIconStyle => 'Choose Folder Icon Style';

  @override
  String get chooseDrawerButtonStyle => 'Choose Drawer Button Style';

  @override
  String get appLauncherIcon => 'App Launcher Icon';

  @override
  String get appLauncherIconHint =>
      'Choose a custom logo for the application launcher icon. Note that some launchers may take a few seconds to update.';

  @override
  String get logo1 => 'Logo 1';

  @override
  String get logo2 => 'Logo 2';

  @override
  String get logo3 => 'Logo 3';

  @override
  String get logo4 => 'Logo 4';

  @override
  String appIconSwitched(String title) {
    return 'App icon switched to $title successfully!';
  }

  @override
  String get appTypography => 'App Typography';

  @override
  String get appTypographyHint =>
      'Select a beautiful typeface to customize NFile\\\'s overall visual theme';

  @override
  String customFontApplied(String name) {
    return 'Custom font \"$name\" applied successfully!';
  }

  @override
  String get failedToLoadFont => 'Failed to load the selected font file.';

  @override
  String get invalidFileType => 'Invalid File Type';

  @override
  String get invalidFontFileHint =>
      'Please select a valid OpenType (.otf) or TrueType (.ttf) font file.';

  @override
  String get removeCustomFont => 'Remove Custom Font';

  @override
  String get customFontRemoved => 'Custom font removed.';

  @override
  String get accentMaterialYou => 'Material You (Dynamic Wallpaper Colors)';

  @override
  String get accentVibrantOrange => 'Vibrant Orange';

  @override
  String get accentRoyalPurple => 'Royal Purple';

  @override
  String get accentEmeraldGreen => 'Emerald Green';

  @override
  String get accentCrimsonRed => 'Crimson Red';

  @override
  String get accentAmberGold => 'Amber Gold';

  @override
  String get accentCyberpunkPink => 'Cyberpunk Pink';

  @override
  String get accentSapphireBlue => 'Sapphire Blue';

  @override
  String get accentForestGreen => 'Forest Green';

  @override
  String get accentSunsetPeach => 'Sunset Peach';

  @override
  String get folderIconClassicSolid => 'Classic Solid (Material)';

  @override
  String get folderIconModernRounded => 'Modern Rounded (Material)';

  @override
  String get folderIconStarred => 'Starred Special (Material)';

  @override
  String get folderIconSnippet => 'Snippet Document (Material)';

  @override
  String get folderIconMinimalOutlined => 'Minimal Outlined (Material)';

  @override
  String get drawerStyleCategoryGrid => 'Category Grid / Vuesax Grid';

  @override
  String get drawerStyleHamburger => 'Hamburger / Classic Menu';

  @override
  String get defaultLogo => 'Default Logo';

  @override
  String get fontDotMatrix => 'Dot-Matrix & Sans';

  @override
  String get fontOutfit => 'Outfit Modern Sans';

  @override
  String get fontJetBrains => 'JetBrains Tech Mono';

  @override
  String get fontMontserrat => 'Montserrat Urban Sans';

  @override
  String get fontCustom => 'Custom Imported Font';

  @override
  String get trailingInfoDateTime => 'Date & Time';

  @override
  String get trailingInfoSizeCount => 'File Size / Item Count';

  @override
  String get backupAndRestoreHint =>
      'Backup your settings to a JSON file or restore them';

  @override
  String get compressingFiles => 'Compressing Files';

  @override
  String get extractingArchive => 'Extracting Archive';

  @override
  String errorReadingSharedFile(String error) {
    return 'Error reading shared file: $error';
  }

  @override
  String extractedTo(String item, String folder) {
    return 'Extracted $item to $folder';
  }

  @override
  String itemsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items copied to clipboard ✓',
      one: '1 item copied to clipboard ✓',
    );
    return '$_temp0';
  }

  @override
  String get deleteSelectedItems => 'Delete Selected Items';

  @override
  String deleteItemsFromArchiveQuestion(int count) {
    return 'Are you sure you want to delete precisely these $count item(s) from the archive? This cannot be undone.';
  }

  @override
  String get itemsDeletedSuccessfully => 'Items deleted successfully ✓';

  @override
  String get failedToDeleteItems => 'Failed to delete items';

  @override
  String addedToArchive(int count) {
    return 'Successfully added $count item(s) into archive ✓';
  }

  @override
  String pastedIntoArchive(int count) {
    return 'Pasted $count item(s) into archive ✓';
  }

  @override
  String selectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Selected',
      one: '1 Selected',
    );
    return '$_temp0';
  }

  @override
  String get couldNotReadArchive => 'Could not read archive';

  @override
  String get extractToCurrentFolder => 'Extract to Current Folder';

  @override
  String pasteHereCount(int count) {
    return 'Paste Here ($count)';
  }

  @override
  String get addFile => 'Add File';

  @override
  String get losslessAudio => 'Lossless Audio';

  @override
  String get soundFx => 'Sound FX';

  @override
  String get sleepTimer => 'Sleep Timer';

  @override
  String get playingQueue => 'Playing Queue';

  @override
  String minutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSet(int count) {
    return 'Sleep timer set for $count minutes.';
  }

  @override
  String get soundAndSpeedFx => 'Sound & Speed FX';

  @override
  String get playbackSpeed => 'Playback Speed';

  @override
  String get pitchAdjustment => 'Pitch Adjustment';

  @override
  String get resetToDefault => 'Reset to Default';

  @override
  String get backgroundPlaybackStopped => 'Background playback stopped';

  @override
  String get backgroundPlaybackEnabled => 'Background playback enabled';

  @override
  String get viewSynchronizedLyrics => 'View Synchronized Lyrics';

  @override
  String get soundFxAndEqualizer => 'Sound FX & Equalizer';

  @override
  String get setSleepTimer => 'Set Sleep Timer';

  @override
  String get audioFileInfo => 'Audio File Info';

  @override
  String playingQueueCount(int count) {
    return 'Playing Queue ($count)';
  }

  @override
  String get lyricsLoaded => 'Lyrics loaded successfully';

  @override
  String get noSynchronizedLyrics => 'No Synchronized Lyrics Found';

  @override
  String get noSynchronizedLyricsHint =>
      'Keep a .lrc file with the exact same name next to your song, or select it manually below.';

  @override
  String get loadLrcFile => 'Load LRC File';

  @override
  String get tapLineToSeek => 'Tap a line to seek playback';

  @override
  String get noDataToExport => 'No data to export.';

  @override
  String exportedTo(String file) {
    return 'Successfully exported to $file';
  }

  @override
  String exportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String get sqliteReader => 'SQLite Database Reader';

  @override
  String get failedToOpenDatabase => 'Failed to open database';

  @override
  String get noTablesFound => 'No tables found in this database.';

  @override
  String get exportTableToCsv => 'Export Table to CSV';

  @override
  String get searchRows => 'Search rows...';

  @override
  String get noRowsFound => 'No rows found';

  @override
  String showingRange(int from, int to) {
    return 'Showing $from - $to';
  }

  @override
  String get noSchemaLoaded => 'No schema details loaded.';

  @override
  String schemaType(String type) {
    return 'Type: $type';
  }

  @override
  String schemaDefault(String value) {
    return 'Default: $value';
  }

  @override
  String get sqlEditor => 'SQL Editor';

  @override
  String get selectTemplate => 'SELECT template';

  @override
  String get enterSelectQuery => 'Enter SELECT query here...';

  @override
  String get exportResultsToCsv => 'Export Results to CSV';

  @override
  String get runQuery => 'Run Query';

  @override
  String queryReturnedRows(int count) {
    return 'Query returned $count rows';
  }

  @override
  String errorLoading(String error) {
    return 'Error loading: $error';
  }

  @override
  String get savedSuccessfully => 'Saved successfully ✓';

  @override
  String errorSaving(String error) {
    return 'Error saving: $error';
  }

  @override
  String get pdfDisplaySettings => 'PDF Display Settings';

  @override
  String get pdfDisplaySettingsHint =>
      'Optimize rendering performance for large, design-heavy, or scanned documents.';

  @override
  String get quickPerformancePresets => 'Quick Performance Presets';

  @override
  String get standardMode => 'Standard Mode';

  @override
  String get standardModeHint => 'Best for text documents';

  @override
  String get lagFreeMode => 'Lag-Free Mode';

  @override
  String get lagFreeModeHint => 'Best for brochures & photos';

  @override
  String get detailedTuning => 'Detailed Tuning Options';

  @override
  String get pageLayout => 'Page Layout';

  @override
  String get singlePage => 'Single Page';

  @override
  String get scrollDirection => 'Scroll Direction';

  @override
  String get enableTextSelection => 'Enable Text Selection';

  @override
  String get enableTextSelectionHint =>
      'Disable to significantly boost page rendering speed and eliminate scroll stutter.';

  @override
  String get displaySettings => 'Display Settings';

  @override
  String get openWithLabel => 'Open with';

  @override
  String get emptySheet => 'Empty Sheet';

  @override
  String slideNumber(int number) {
    return 'SLIDE $number';
  }

  @override
  String get openWithApp => 'Open with App';

  @override
  String get shareComingSoon => 'Share coming soon';

  @override
  String get htmlPreview => 'HTML Preview';

  @override
  String get markdownPreview => 'Markdown Preview';

  @override
  String imageIndexOfTotal(int current, int total) {
    return '$current of $total';
  }

  @override
  String get failedToLoadImage => 'Failed to load image';

  @override
  String get confirmDeletion => 'Confirm Deletion';

  @override
  String confirmPermanentDelete(int count) {
    return 'Are you sure you want to permanently delete $count selected items?';
  }

  @override
  String deletedItemsCount(int count) {
    return 'Successfully deleted $count items';
  }

  @override
  String pastedItemsTo(int count, String folder) {
    return 'Pasted $count items to $folder';
  }

  @override
  String get noFilesToRename => 'No physical files found to rename';

  @override
  String get longPressToOpenWith => 'Long press to Open with...';

  @override
  String copiedNameToClipboard(String name) {
    return 'Copied $name to clipboard';
  }

  @override
  String cutNameToClipboard(String name) {
    return 'Cut $name to clipboard';
  }

  @override
  String permanentlyDeleteName(String name) {
    return 'Permanently delete \"$name\"?';
  }

  @override
  String deletedName(String name) {
    return 'Deleted $name';
  }

  @override
  String get fileNotShareable => 'File not found or not shareable.';

  @override
  String get sortOptions => 'Sort Options';

  @override
  String get sortNewestFirst => 'Newest First';

  @override
  String get sortOldestFirst => 'Oldest First';

  @override
  String get sortDateWise => 'Date Wise';

  @override
  String get sortNewestGrouped => 'Newest First (Grouped per month)';

  @override
  String get sortOldestGrouped => 'Oldest First (Grouped per month)';

  @override
  String get sortSizeLargeFirst => 'Size (Large First)';

  @override
  String get sortSizeSmallFirst => 'Size (Small First)';

  @override
  String noItemsOfKindFound(String kind) {
    return 'No $kind found';
  }

  @override
  String get allItems => 'All Items';

  @override
  String countItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String restoredSuccessfully(int count) {
    return 'Restored $count item(s) successfully';
  }

  @override
  String errorRestoringItems(String error) {
    return 'Error restoring items: $error';
  }

  @override
  String get deletePermanentlyQuestion => 'Delete Permanently?';

  @override
  String deletePermanentlyQuestionHint(int count) {
    return 'Are you sure you want to permanently delete these $count item(s)? This action cannot be undone.';
  }

  @override
  String permanentlyDeleted(int count) {
    return 'Permanently deleted $count item(s)';
  }

  @override
  String errorDeletingItems(String error) {
    return 'Error deleting items: $error';
  }

  @override
  String get emptyRecycleBinQuestion => 'Empty Recycle Bin?';

  @override
  String get emptyRecycleBinQuestionHint =>
      'Are you sure you want to permanently delete all items in the Recycle Bin? This action is irreversible.';

  @override
  String get emptyBin => 'Empty Bin';

  @override
  String get binEmptied => 'Recycle Bin emptied successfully';

  @override
  String errorEmptyingBin(String error) {
    return 'Error emptying bin: $error';
  }

  @override
  String get searchDeletedFiles => 'Search deleted files...';

  @override
  String get emptyRecycleBinAction => 'Empty Recycle Bin';

  @override
  String originalPath(String path) {
    return 'Original Path: $path';
  }

  @override
  String deletedAtAndSize(String date, String size) {
    return 'Deleted: $date • $size';
  }

  @override
  String get deletePermanently => 'Delete Permanently';

  @override
  String get recycleBinIsEmpty => 'Recycle Bin is Empty';

  @override
  String get recycleBinIsEmptyHint =>
      'Items you delete when Recycle Bin is enabled will appear here. You can restore them or permanently delete them.';

  @override
  String errorLoadingFile(String error) {
    return 'Error loading file: $error';
  }

  @override
  String get fileSavedSuccessfully => 'File saved successfully';

  @override
  String errorSavingFile(String error) {
    return 'Error saving file: $error';
  }

  @override
  String replacedOccurrences(int count) {
    return 'Replaced $count occurrences';
  }

  @override
  String get selectSyntax => 'Select Syntax';

  @override
  String get findAndReplace => 'Find / Replace';

  @override
  String get saveFile => 'Save File';

  @override
  String get moreOptions => 'More Options';

  @override
  String defaultZoom(int size) {
    return 'Default Zoom (${size}pt)';
  }

  @override
  String syntaxOf(String language) {
    return 'Syntax ($language)';
  }

  @override
  String get replaceWithDots => 'Replace with...';

  @override
  String get replaceAll => 'Replace All';

  @override
  String get slideToUnlock => 'Slide / Tap to Unlock';

  @override
  String get lockControls => 'Lock Controls';

  @override
  String get repeatMode => 'Repeat Mode';

  @override
  String get copyUrl => 'Copy URL';

  @override
  String get mediaPathCopied => 'Media path copied to clipboard.';

  @override
  String speedValue(double speed) {
    return 'Speed ${speed}x';
  }

  @override
  String get continuousLayout => 'Continuous';

  @override
  String editorLanguageAndLines(String language, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lines',
      one: '1 line',
    );
    return '$language  $_temp0';
  }

  @override
  String get editorModified => 'editorModified';
}
