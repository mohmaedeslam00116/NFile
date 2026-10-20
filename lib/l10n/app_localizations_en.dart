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
  String get noFilesToShare => 'No files available to share';

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
}
