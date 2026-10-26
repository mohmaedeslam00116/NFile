// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'OpenFile';

  @override
  String get openingSharedDocument => 'Opening shared document...';

  @override
  String get resolvingSecureContent => 'Resolving secure content stream';

  @override
  String get storageAccessRequired => 'Storage Access Required';

  @override
  String get storageAccessExplanation =>
      'OpenFile requires storage permission to manage, organize, and display your media files seamlessly.';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String couldNotOpenLink(String url) {
    return 'Could not open link: $url';
  }

  @override
  String get aboutNFile => 'About OpenFile';

  @override
  String appVersionWithChannel(String version, String channel) {
    return 'v$version ($channel)';
  }

  @override
  String get aboutDescription =>
      'OpenFile is a beautiful, fluid, and open-source file manager and offline media hub built with Flutter. Designed for extreme performance, clean glassmorphic aesthetics, and seamless user experiences.';

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
  String get copyrightNotice =>
      'NFile — licensed under GPL-3.0. Source: github.com/mohmaedeslam00116/NFile';

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
  String duplicateGroupFiles(Object count) {
    return '$count files';
  }

  @override
  String get findDuplicates => 'Find duplicates';

  @override
  String get noDuplicatesFound => 'No duplicate files found.';

  @override
  String deleteFailedItems(Object count) {
    return 'Failed to delete $count item(s)';
  }

  @override
  String pasteFailedItems(Object count) {
    return 'Failed to paste $count item(s)';
  }

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
    return 'OpenFile v$version';
  }

  @override
  String get beautifulMediaSuite => 'Beautiful Media Suite';

  @override
  String get openWith => 'Open with...';

  @override
  String get builtInViewer => 'Built-in OpenFile Viewer';

  @override
  String get builtInViewerDescription => 'OpenFile\'s custom native experience';

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
      'Android 11+ restricts standard access to Android/data and Android/obb folders to protect app data. To view and modify these files, OpenFile requires advanced permissions.';

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
  String get sdCard => 'SD Card';

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
  String get filterAll => 'All';

  @override
  String get filterFolders => 'Folders';

  @override
  String deleteSelectedItemsQuestion(int count) {
    return 'Are you sure you want to delete $count selected item(s)? This cannot be undone.';
  }

  @override
  String deleteItemsQuestion(int count) {
    return 'Are you sure you want to delete $count items? This cannot be undone.';
  }

  @override
  String get deleteItemQuestion =>
      'Are you sure you want to delete this item? This cannot be undone.';

  @override
  String get cannotCutPasteSameFolder =>
      'Cannot cut and paste a file into the same folder.';

  @override
  String shareAppMessage(String url) {
    return 'Check out OpenFile, a beautiful offline file manager and media hub: $url';
  }

  @override
  String get deviceGalleryAuto => 'Device Gallery (Auto)';

  @override
  String get deviceAudioLibraryAuto => 'Device Audio Library (Auto)';

  @override
  String get deviceGalleryScreenshots => 'Device Gallery (Screenshots)';

  @override
  String get internalStorageAllFolders =>
      'Internal Storage (All Folders Scanned)';

  @override
  String get searchYourStorage => 'Search your storage';

  @override
  String get searchThisFolder => 'Search this folder';

  @override
  String get searchEverythingHint =>
      'Find any file, folder, document or media instantly across your device';

  @override
  String searchInFolderNamed(String folder) {
    return 'Search files and subfolders in: $folder';
  }

  @override
  String noMatchForQuery(String query, String filter) {
    return 'We could not find anything matching \"$query\" under $filter';
  }

  @override
  String get rootDirectory => 'Root';

  @override
  String get copyFileSuffix => '(copy)';

  @override
  String get tarFormatsMemoryWarning =>
      'TAR.ZSTD and TAR.LZ4 formats are highly memory-intensive and optimized for files under 600MB. Please use the ZIP or TAR format for larger files.';

  @override
  String get actionApply => 'Apply';

  @override
  String get actionCreate => 'Create';

  @override
  String get actionMore => 'More';

  @override
  String get actionOk => 'OK';

  @override
  String get actionPinToTop => 'Pin to Top';

  @override
  String get actionUnpinFromTop => 'Unpin from Top';

  @override
  String get actionPreview => 'Preview';

  @override
  String get actionReplace => 'Replace';

  @override
  String get actionSkip => 'Skip';

  @override
  String get chooseAnyDestination => 'Choose any destination';

  @override
  String get customLocation => 'Custom Location';

  @override
  String get selectCustomLocation => 'Select Custom Location...';

  @override
  String get propertyContains => 'Contains';

  @override
  String get propertyExtension => 'Extension';

  @override
  String get propertyModified => 'Modified';

  @override
  String get propertyName => 'Name';

  @override
  String get propertyPath => 'Path';

  @override
  String get propertyPermissions => 'Permissions';

  @override
  String get permissionRead => 'Read';

  @override
  String get permissionWrite => 'Write';

  @override
  String get propertySize => 'Size';

  @override
  String get propertyType => 'Type';

  @override
  String get propertyFolderDirectory => 'Folder / Directory';

  @override
  String get itemFiles => 'Files';

  @override
  String fileWithExtension(String extension) {
    return 'File ($extension)';
  }

  @override
  String get fileLongPressHint => 'File (Long press to Open with)';

  @override
  String get compressionFast => 'Fast';

  @override
  String get compressionMaximum => 'Maximum';

  @override
  String get compressionNone => 'None (Store)';

  @override
  String get compressionStandard => 'Standard';

  @override
  String get batchRenamePadding => 'Padding';

  @override
  String get batchRenameReplacement => 'Replacement';

  @override
  String get lessOptions => 'Less Options';

  @override
  String get conflictNewer => 'Newer';

  @override
  String get sortNameAscending => 'Name (A-Z)';

  @override
  String get sortNameDescending => 'Name (Z-A)';

  @override
  String get sortNewest => 'Newest';

  @override
  String get sortOldest => 'Oldest';

  @override
  String get sortSizeLarge => 'Size (Large)';

  @override
  String get sortSizeSmall => 'Size (Small)';

  @override
  String get showFolders => 'Show Folders';

  @override
  String get hideFolders => 'Hide Folders';

  @override
  String get selectFilesAndFolders => 'Select Files & Folders';

  @override
  String get selectAndPinFolders => 'Select & Pin Folders';

  @override
  String get pinnedItemsToTop => 'Pinned selected item(s) to top';

  @override
  String get unpinnedItems => 'Unpinned selected item(s)';

  @override
  String get emptyLabel => '(empty)';

  @override
  String get runInBackground => 'Background';

  @override
  String get processingFiles => 'Processing...';

  @override
  String get copyingFiles => 'Copying Files...';

  @override
  String get movingFiles => 'Moving Files...';

  @override
  String get calculating => 'calculating...';

  @override
  String get searchInThisDirectory =>
      'Search files and subfolders in this directory';

  @override
  String countItemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items selected',
      one: '1 item selected',
    );
    return '$_temp0';
  }

  @override
  String sizeWithBytes(String size, int bytes) {
    return '$size ($bytes bytes)';
  }

  @override
  String containsFoldersAndFiles(int folders, int files) {
    String _temp0 = intl.Intl.pluralLogic(
      folders,
      locale: localeName,
      other: '$folders subfolders',
      one: '1 subfolder',
      zero: 'no subfolders',
    );
    String _temp1 = intl.Intl.pluralLogic(
      files,
      locale: localeName,
      other: '$files files',
      one: '1 file',
      zero: 'no files',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String processedOfTotal(String processed, String total) {
    return '$processed of $total';
  }

  @override
  String speedMegabytesPerSecond(String speed) {
    return '$speed MB/s';
  }

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String get analyzerApplications => 'Applications';

  @override
  String get analyzerBreakdown => 'Breakdown';

  @override
  String get analyzerCalculatingAppsCapacity => 'Calculating Apps capacity...';

  @override
  String get analyzerInitializing => 'Initializing...';

  @override
  String get analyzerReadingSystemMemory => 'Reading system memory...';

  @override
  String get analyzerBackedUpApks => 'Backed Up APKs';

  @override
  String get analyzerInstalledUserApps => 'Installed User Apps';

  @override
  String get analyzerSystemPackages => 'System Packages';

  @override
  String get analyzerSearchBackups => 'Search backups...';

  @override
  String get analyzerSearchPackagesHint => 'Search packages or names...';

  @override
  String get analyzerSortByBackupDate => 'Sort by Backup Date';

  @override
  String get analyzerSortByInstallDate => 'Sort by Install Date';

  @override
  String get analyzerBackup => 'Backup';

  @override
  String get analyzerClear => 'Clear';

  @override
  String get analyzerUninstall => 'Uninstall';

  @override
  String get analyzerSingleApk => 'Single APK';

  @override
  String get analyzerSplitBundle => 'Split Bundle';

  @override
  String get analyzerSplitBundleApks => 'Split Bundle (APKS)';

  @override
  String get analyzerApkBackedUp =>
      'APK backed up successfully to NFile/Backups/Apps/';

  @override
  String get analyzerApkBackupFailed => 'Failed to back up APK';

  @override
  String get analyzerBackupsListHint =>
      'A list of your backed up APK and APKS files will show here.';

  @override
  String analyzerNoBackupsMatch(String query) {
    return 'We couldn\'t find any backups matching \"$query\"';
  }

  @override
  String get categoryAudios => 'Audios';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionInfo => 'Info';

  @override
  String get actionReload => 'Reload';

  @override
  String get actionRestore => 'Restore';

  @override
  String get actionSave => 'Save';

  @override
  String get actionUndo => 'Undo';

  @override
  String get actionRedo => 'Redo';

  @override
  String get editorFind => 'Find...';

  @override
  String get editorLockZoom => 'Lock Zoom';

  @override
  String get editorUnlockZoom => 'Unlock Zoom';

  @override
  String get editorWordWrapOn => 'Word Wrap: ON';

  @override
  String get editorWordWrapOff => 'Word Wrap: OFF';

  @override
  String get editorEditLockOn => 'Edit Lock: ON';

  @override
  String get editorEditLockOff => 'Edit Lock: OFF';

  @override
  String get editorShowLineNumbers => 'Show Line Numbers';

  @override
  String get editorHideLineNumbers => 'Hide Line Numbers';

  @override
  String get editorSaveFailed =>
      'Failed to save changes back to external storage.';

  @override
  String get viewerEmptySlide => '(Empty Slide)';

  @override
  String get viewerEmptyFile => '(Empty file)';

  @override
  String get viewerContinuous => 'Continuous (Vertical scrolling list)';

  @override
  String get viewerSinglePage => 'Single Page (Instant page-by-page swipe)';

  @override
  String get viewerHorizontalSwipe => 'Horizontal (Left to right swipe)';

  @override
  String get viewerVerticalScroll => 'Vertical (Top to bottom scroll)';

  @override
  String get viewerHorizontal => 'Horizontal';

  @override
  String get viewerVertical => 'Vertical';

  @override
  String viewerSizeMegabytes(String size) {
    return '$size MB';
  }

  @override
  String viewerSizeKilobytes(String size) {
    return '$size KB';
  }

  @override
  String get databaseBrowseData => 'Browse Data';

  @override
  String get databaseSqlConsole => 'SQL Console';

  @override
  String get databaseTableSchema => 'Table Schema';

  @override
  String get databaseSelectHint => 'Execute a SELECT query to view results.';

  @override
  String get databaseQueryError => 'Error executing query.';

  @override
  String get audioLyrics => 'Lyrics';

  @override
  String get audioMute => 'Mute';

  @override
  String get audioUnmute => 'Unmute';

  @override
  String get audioPlayInBackground => 'Play in Background';

  @override
  String get audioBackgroundOn => 'Background: On';

  @override
  String get audioNotificationControlsHint =>
      'Shows notification with controls';

  @override
  String get audioTapToStopHint => 'Tap to stop background playback';

  @override
  String get audioShuffleOn => 'Shuffle: On';

  @override
  String get audioShuffleOff => 'Shuffle: Off';

  @override
  String get audioRepeatAll => 'Repeat: All';

  @override
  String get audioRepeatOne => 'Repeat: One';

  @override
  String get audioRepeatOff => 'Repeat: Off';

  @override
  String get audioSingleTrack => 'Single Track';

  @override
  String get lyricsReadFailed => 'Failed to read the chosen LRC file.';

  @override
  String get lyricsNoValidLines =>
      'No valid lyrics lines found in chosen LRC file.';

  @override
  String get lyricsSelectValidFile =>
      'Please select a valid file ending with .lrc';

  @override
  String get videoBrightness => 'Brightness';

  @override
  String get videoVolume => 'Volume';

  @override
  String get videoFullScreen => 'Full Screen';

  @override
  String get videoExitFullScreen => 'Exit Full Screen';

  @override
  String get videoLabel => 'Video';

  @override
  String get imageLabel => 'Image';

  @override
  String get mediaInfoTitle => 'Media Info';

  @override
  String get mediaFileSize => 'File Size';

  @override
  String get mediaOriginalLocation => 'Original Location';

  @override
  String get mediaRecycledDate => 'Recycled Date';

  @override
  String get mediaDirectory => 'Directory';

  @override
  String get mediaUnknownDate => 'Unknown Date';

  @override
  String mediaCopiedToClipboard(int count) {
    return 'Copied $count items to clipboard';
  }

  @override
  String mediaCutToClipboard(int count) {
    return 'Cut $count items to clipboard';
  }

  @override
  String get markdownFileNotFound => '# File not found';

  @override
  String markdownLoadError(String error) {
    return '# Error loading file\n\n`$error`';
  }

  @override
  String get htmlFileNotFound => '<p>File not found.</p>';

  @override
  String htmlLoadError(String error) {
    return '<p>Error loading HTML: $error</p>';
  }

  @override
  String get archiveCreatedSuccessfully => 'Archive created successfully';

  @override
  String get archiveExtractedSuccessfully => 'Archive extracted successfully';

  @override
  String get archiveFileNotFound => 'Archive file not found';

  @override
  String archiveCompressionFailed(String error) {
    return 'Compression failed: $error';
  }

  @override
  String archiveExtractionFailed(String error) {
    return 'Extraction failed: $error';
  }

  @override
  String get archiveOperationFailed => 'Compression/extraction failed.';

  @override
  String get archiveNoFilesToCompress => 'No files found to compress';

  @override
  String get archiveScanningFiles => 'Scanning files...';

  @override
  String get archiveSavingToDisk => 'Saving archive to disk...';

  @override
  String get archiveEncodingStructure => 'Encoding archive structure...';

  @override
  String get archiveApplyingGzip => 'Applying GZIP compression...';

  @override
  String get archiveApplyingBzip2 => 'Applying BZIP2 compression...';

  @override
  String get archiveApplyingLz4 => 'Applying LZ4 compression...';

  @override
  String get archiveApplyingZstd => 'Applying ZSTD compression...';

  @override
  String get archiveOpeningZip => 'Opening zip...';

  @override
  String get archiveReading => 'Reading archive...';

  @override
  String get archiveExtractingTar => 'Extracting tar...';

  @override
  String get archiveOpeningTar => 'Opening tar...';

  @override
  String get archiveDecompressingGzip => 'Decompressing gzip...';

  @override
  String get archiveDecompressing => 'Decompressing archive...';

  @override
  String get archiveExtractingFiles => 'Extracting files...';

  @override
  String get archiveOpening => 'Opening archive...';

  @override
  String archiveProcessedSuccessfully(String name) {
    return '$name processed successfully.';
  }

  @override
  String get operationSuccessful => 'Successful';

  @override
  String get operationFailed => 'Operation Failed';

  @override
  String get archiveUnsupportedFormat => 'Unsupported format';

  @override
  String get actionBack => 'Back';

  @override
  String get actionBackspace => 'Backspace';

  @override
  String get actionClose => 'Close';

  @override
  String get actionDetails => 'Details';

  @override
  String get actionPaste => 'Paste';

  @override
  String get actionStart => 'Start';

  @override
  String get actionStop => 'Stop';

  @override
  String get actionUpload => 'Upload';

  @override
  String get settingsAppIconPicker => 'App Icon Picker';

  @override
  String get settingsLogo => 'Logo';

  @override
  String get settingsFileExplorer => 'File Explorer & Navigation';

  @override
  String get settingsMediaActions => 'Media & Default Actions';

  @override
  String get settingsExitConfirmation => 'Confirmation Dialog';

  @override
  String get settingsExitConfirmationHint =>
      'Prompt for exit verification before closing';

  @override
  String get settingsDoublePressExit => 'Double-Press to Exit';

  @override
  String get settingsDoublePressExitHint =>
      'Tap the back button twice within a short window to exit';

  @override
  String get settingsShowConfirmation => 'Show confirmation dialog';

  @override
  String get settingsDoublePressBackHint => 'Double-press back button to exit';

  @override
  String get settingsExitBehaviourHint =>
      'Choose between exit confirmation dialog or double-pressing back button to exit';

  @override
  String get settingsTrailingInfoHint =>
      'Choose what to show on the right side of files and folders when 3-dot is hidden';

  @override
  String get recycleBinDays7 => '7 Days';

  @override
  String get recycleBinDays15 => '15 Days';

  @override
  String get recycleBinDays30 => '30 Days (Recommended)';

  @override
  String get recycleBinNeverManual => 'Never (Manually clean bin)';

  @override
  String get recycleBinNeverAuto => 'Never (Auto-delete disabled)';

  @override
  String get recycleBinAfterOneDay => 'After 1 Day';

  @override
  String recycleBinAfterDays(int days) {
    return 'After $days Days';
  }

  @override
  String get trailingInfoNone => 'None / Hide Info';

  @override
  String get trailingInfoNoneHint =>
      'Do not display additional information on the right side';

  @override
  String get trailingInfoDateHint => 'Display the last modified date and time';

  @override
  String get trailingInfoSizeHint =>
      'Display file size for files and item count for folders';

  @override
  String get themeSignatureDefault => 'Signature Default (Lexend Deca)';

  @override
  String get themeOriginalDefault => 'Original Default (Signature Blue)';

  @override
  String get themeBrokenOutline => 'OpenFile Broken Outline (Default)';

  @override
  String get themeOriginalGeometric => 'Original OpenFile clean geometric look';

  @override
  String get themeNothingDotMatrix => 'Nothing Dot-Matrix & Sans';

  @override
  String get themeDotMatrixHint =>
      'High-tech retro dot matrix headings + clean body';

  @override
  String get themeMonospaceHint =>
      'Clean and futuristic developer monospaced look';

  @override
  String get themeGeometricHint =>
      'Super sleek, minimal, and premium geometric aesthetic';

  @override
  String get themeBoldHint => 'Bold, modern, and striking typographic scale';

  @override
  String get themeCustomFontHint => 'Your custom loaded font file';

  @override
  String themeCustomFontName(String name) {
    return 'Custom Font ($name)';
  }

  @override
  String get themeImportCustomFont => 'Import Custom Font File (.ttf/.otf)';

  @override
  String get themeReplaceCustomFont => 'Replace Custom Font File';

  @override
  String get connectionActive => 'Active';

  @override
  String get connectionInactive => 'Inactive';

  @override
  String get connectionConnected => 'Connected';

  @override
  String get connectionConnect => 'Connect';

  @override
  String get connectionPort => 'Port';

  @override
  String get connectionProtocol => 'Protocol';

  @override
  String get connectionName => 'Connection Name';

  @override
  String get connectionServerAddress => 'Server Address / IP';

  @override
  String get connectionUsername => 'Username';

  @override
  String get connectionUsernameOptional => 'Username (Optional)';

  @override
  String get connectionRemoteDirectory => 'Remote Directory';

  @override
  String get connectionAuthenticating => 'Authenticating credentials...';

  @override
  String get connectionCheckingPort => 'Checking port status...';

  @override
  String get connectionResolvingHost => 'Resolving host address...';

  @override
  String get connectionMounting => 'Mounting storage volume...';

  @override
  String connectionTitle(String protocol) {
    return '$protocol Connection';
  }

  @override
  String get connectionServerAddressHint =>
      'e.g., 192.168.1.100 or 192.168.1.100/dav';

  @override
  String get connectionServerAddressHint2 => 'e.g., 192.168.1.100 or nas.local';

  @override
  String get protocolAndroidSaf =>
      'Android Storage Access Framework (SD Card / External)';

  @override
  String get protocolHttp => 'HTTP Web Distributed Authoring';

  @override
  String get protocolLan => 'Local Area Network & SMB NAS Share';

  @override
  String get protocolSafFolder => 'SAF Folder';

  @override
  String get protocolSsh => 'SSH Secure File Transfer Server';

  @override
  String get protocolFtp => 'Standard File Transfer Protocol';

  @override
  String get ftpAnonymous => 'Anonymous';

  @override
  String get webStartServer => 'Start Web Server';

  @override
  String get webStopServer => 'Stop Web Server';

  @override
  String get webCloudShare => 'Cloud Share';

  @override
  String get webLocalShare => 'Local Share';

  @override
  String get webActivateLink => 'Activate Internet Share Link';

  @override
  String get webDeactivateCloud => 'Deactivate Cloud Share';

  @override
  String get remoteMoveToDevice => 'Move to Device';

  @override
  String get remoteCopyToDevice => 'Copy to Device';

  @override
  String get remotePasteClipboard => 'Paste remote clipboard';

  @override
  String get remotePasteSameLocation => 'Cannot paste to the same location';

  @override
  String get remoteClipboardEmpty =>
      'Local clipboard is empty. Copy files in the file manager first.';

  @override
  String remoteTransferFailed(String error) {
    return 'Transfer failed: $error';
  }

  @override
  String get remoteTransferring => 'Transferring...';

  @override
  String get remoteCopying => 'Copying...';

  @override
  String get remoteMoving => 'Moving...';

  @override
  String get remoteDownloading => 'Downloading from server...';

  @override
  String get remoteUploading => 'Uploading to server...';

  @override
  String remoteUploaded(int count) {
    return 'Uploaded $count file(s) successfully';
  }

  @override
  String remoteUploadFailed(String name, String error) {
    return 'Upload failed for \"$name\": $error';
  }

  @override
  String remoteDownloadFailed(String error) {
    return 'Download failed: $error';
  }

  @override
  String remoteCreateFolderFailed(String error) {
    return 'Failed to create folder: $error';
  }

  @override
  String remoteDeleteFailed(String error) {
    return 'Failed to delete: $error';
  }

  @override
  String remoteCopiedToClipboard(String name) {
    return 'Copied \"$name\" to clipboard';
  }

  @override
  String remoteCutToClipboard(String name) {
    return 'Cut \"$name\" to clipboard';
  }

  @override
  String remoteDeleted(String name) {
    return 'Deleted \"$name\"';
  }

  @override
  String remoteDownloadedToClipboard(String name) {
    return '\"$name\" downloaded → local clipboard ready to paste';
  }

  @override
  String remoteFilesReadyToUpload(int count) {
    return '$count local file(s) ready to upload';
  }

  @override
  String remoteItemsCut(int count) {
    return '$count remote item(s) cut';
  }

  @override
  String remoteItemsCopied(int count) {
    return '$count remote item(s) copied';
  }

  @override
  String get vaultEnterPin => 'Enter PIN to Unlock Wallet';

  @override
  String get vaultSetPin => 'Set your 4-digit Wallet PIN';

  @override
  String get vaultConfirmPin => 'Confirm your 4-digit PIN';

  @override
  String get vaultIncorrectPin => 'Incorrect PIN. Try again!';

  @override
  String get vaultPinsDoNotMatch => 'PINs do not match. Try again!';

  @override
  String get vaultPinSet => 'PIN Set Successfully!';

  @override
  String get vaultEnterPassword => 'Enter Password to Unlock';

  @override
  String get vaultLockOption => 'Lock Option';

  @override
  String vaultLockFailed(int count) {
    return 'Failed to lock $count items.';
  }

  @override
  String get vaultNoMatchingFiles => 'No Matching Files';

  @override
  String get vaultEmpty => 'Your Secure Vault is Empty';

  @override
  String get vaultSearchHint =>
      'Try modifying your search text to locate hidden items.';

  @override
  String vaultScrambleDescription(String action) {
    return 'XOR scrambled signature obfuscation keeps files completely unopenable and hidden from system scanner database. Tap $action below to protect them.';
  }

  @override
  String get vaultInPlace => 'In-Place';

  @override
  String get vaultSandbox => 'Sandbox';

  @override
  String get vaultProtectionMode => 'Protection Mode';

  @override
  String get vaultLockedAt => 'Locked At';

  @override
  String get vaultOriginalName => 'Original Name';

  @override
  String get vaultOriginalPath => 'Original Path';

  @override
  String get vaultScrambledPath => 'Scrambled Path';

  @override
  String get vaultInPlaceScrambling => '⚡ In-Place Scrambling';

  @override
  String get vaultIsolatedMove => '🔒 Isolated Move (Sandbox)';

  @override
  String get settingsBackupFileMissing => 'Backup file does not exist';

  @override
  String get settingsBackupInvalidFormat => 'Invalid backup file format';

  @override
  String get webBrowser => 'Web Browser';

  @override
  String get webBrowsingDirectories => 'Browsing Directories';

  @override
  String get webCloseModal => 'Close Modal';

  @override
  String get downloadFile => 'Download File';

  @override
  String get webFailedToCopyLink => 'Failed to copy link.';

  @override
  String get webLinkCopied => 'Link copied to clipboard!';

  @override
  String get webGridView => 'Grid View';

  @override
  String get webListView => 'List View';

  @override
  String get networkError => 'Network error';

  @override
  String get webSearchFiles => 'Search files & folders...';

  @override
  String get webUploadToFolder => 'Upload Files to this Folder';

  @override
  String get webUploadCompleted => 'Upload completed successfully!';

  @override
  String get webUploadFailed => 'Upload failed';

  @override
  String get webUploadSuccessful => 'Upload successful';

  @override
  String mediaCannotOpenDirectory(String path) {
    return 'Cannot open directory: $path';
  }

  @override
  String mediaCannotOpenRemoteDirectory(String path) {
    return 'Cannot open remote directory: $path';
  }

  @override
  String mediaWebdavConnectFailed(String status) {
    return 'Failed to connect to WebDAV: $status';
  }

  @override
  String get vaultIncorrectPassword => 'Incorrect password or corrupted file';

  @override
  String vaultFileDoesNotExist(String path) {
    return 'File does not exist: $path';
  }

  @override
  String vaultDirectoryDoesNotExist(String path) {
    return 'Directory does not exist: $path';
  }

  @override
  String get vaultFailedToZip => 'Failed to zip directory contents';

  @override
  String rootExecutionFailed(String error) {
    return 'Execution failed: $error';
  }

  @override
  String get customFolder => 'Custom Folder';

  @override
  String get sdCardWithUsb => 'SD Card / USB';

  @override
  String failedToCreateDirectory(String path) {
    return 'Failed to create directory: $path';
  }

  @override
  String failedToDeleteDirectory(String path) {
    return 'Failed to delete directory: $path';
  }

  @override
  String get fileNotFound => 'File not found';

  @override
  String get ftpNotConnected => 'FTP not connected';

  @override
  String get sftpNotConnected => 'SFTP not connected';

  @override
  String ftpConnectionFailed(String host, String port) {
    return 'FTP connection failed: could not connect to $host:$port';
  }

  @override
  String localFileNotFound(String path) {
    return 'Local file not found: $path';
  }

  @override
  String sourceDoesNotExist(String path) {
    return 'Source file/folder does not exist: $path';
  }

  @override
  String get vaultFileNotFound => 'Scrambled vault file not found';

  @override
  String vaultFileNotFoundAt(String path) {
    return 'Scrambled vault file not found: $path';
  }

  @override
  String get sharingApksOfSelectedApps => 'Sharing APKs of selected apps';

  @override
  String sharingApkFor(String name) {
    return 'Sharing APK for $name';
  }

  @override
  String get establishingProxyTunnel => 'Establishing secure proxy tunnel...';

  @override
  String remoteUploadFailedFor(String path) {
    return 'Upload failed for: $path';
  }

  @override
  String remoteDownloadFailedFor(String path) {
    return 'Download failed for: $path';
  }

  @override
  String sdCardWithUsbNamed(String name) {
    return 'SD Card / USB ($name)';
  }

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
      'Select a beautiful typeface to customize OpenFile\\\'s overall visual theme';

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
  String get ftpServerStopped => 'FTP Server stopped successfully';

  @override
  String ftpServerStartedAt(String address) {
    return 'FTP Server started at $address';
  }

  @override
  String errorStartingFtpServer(String error) {
    return 'Error starting FTP Server: $error';
  }

  @override
  String get stopServerBeforeChanging =>
      'Please stop the server before changing configuration';

  @override
  String get changePort => 'Change Port';

  @override
  String get portNumber => 'Port Number';

  @override
  String get invalidPortNumber => 'Invalid port number';

  @override
  String get setUsername => 'Set Username';

  @override
  String get usernameNotEmpty => 'Username cannot be empty';

  @override
  String get stopServerBeforeEditing =>
      'Stop the server before editing settings';

  @override
  String get ftpShortcutAdded => 'FTP Server shortcut added to home screen!';

  @override
  String get changeDirectory => 'Change directory';

  @override
  String get changePortLower => 'Change port';

  @override
  String get setUser => 'Set user';

  @override
  String get anonymousAccess => 'Anonymous access';

  @override
  String get createShortcut => 'Create shortcut';

  @override
  String get networkStatus => 'Network status';

  @override
  String get serverAddress => 'Server address';

  @override
  String get homeDirectory => 'Home directory';

  @override
  String get userName => 'User name';

  @override
  String get showHiddenFilesLower => 'Show hidden files';

  @override
  String get secureFtpHint => 'Secure FTP connection over explicit TLS';

  @override
  String connectionAdded(String name) {
    return '\"$name\" added successfully!';
  }

  @override
  String get systemAppDisabled => 'System App Disabled';

  @override
  String get noDocumentsApp =>
      'Your device does not have a default System Files/Documents app (DocumentsUI) enabled, which is required by Android to select and mount directories.\n\nPlease check if the \"Files\" or \"Documents\" system app is disabled in your device Settings, or enable it to use SAF directory features.';

  @override
  String failedToRequestSafFolder(String error) {
    return 'Failed to request SAF folder: $error';
  }

  @override
  String get enterConnectionName => 'Please enter a connection name';

  @override
  String get enterServerAddress => 'Please enter server address / hostname';

  @override
  String connectedSuccessfully(String name) {
    return '\"$name\" connected successfully!';
  }

  @override
  String connectionFailed(String error) {
    return 'Connection failed: $error';
  }

  @override
  String get remoteConnections => 'Remote Connections';

  @override
  String stepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get selectNetworkService => 'Select Network Service';

  @override
  String get selectNetworkServiceHint =>
      'Mount a remote server or NAS share as a dynamic drive within your OpenFile storage lists.';

  @override
  String selectedTypeSettings(String type) {
    return '$type Settings';
  }

  @override
  String get enterConnectionDetails =>
      'Enter connection details to link this network volume.';

  @override
  String get connectionNameExample => 'e.g., Office NAS, Home Share';

  @override
  String get connectionPathExample => 'e.g., /dav or /';

  @override
  String get connectionUserExample => 'e.g., anonymous or admin';

  @override
  String get creatingMountPoint => 'Creating Mount Point...';

  @override
  String establishingPathway(String type) {
    return 'Please wait while we establish a reliable pathway to the $type server.';
  }

  @override
  String get httpsSecure => 'HTTPS (Secure)';

  @override
  String get deleteItem => 'Delete Item';

  @override
  String deleteRemoteItemQuestion(String name) {
    return 'Delete \"$name\" permanently from the server?';
  }

  @override
  String get newRemoteFolder => 'New Remote Folder';

  @override
  String get copyToLocalDevice => 'Copy to Local Device';

  @override
  String get copyToLocalDeviceHint => 'Downloads file → local clipboard';

  @override
  String get moveToLocalDevice => 'Move to Local Device';

  @override
  String get moveToLocalDeviceHint => 'Downloads and deletes from server';

  @override
  String connectionTypeServer(String type) {
    return '$type Server';
  }

  @override
  String get uploadClipboardToServer => 'Upload local clipboard to server';

  @override
  String get connectionLost => 'Connection Lost';

  @override
  String get retryConnection => 'Retry Connection';

  @override
  String get emptyDirectory => 'Empty Directory';

  @override
  String get uploadClipboardHere => 'Upload Clipboard Here';

  @override
  String errorLoadingVault(String error) {
    return 'Error loading vault: $error';
  }

  @override
  String get chooseProtectionMode => 'Choose Protection Mode';

  @override
  String get chooseProtectionModeHint =>
      'Choose how you want to protect your selected files. Secured files are encrypted instantly.';

  @override
  String get secureImportSandbox => 'Secure Import (Sandbox)';

  @override
  String get inPlaceScramble => 'In-Place Scramble (Fast)';

  @override
  String get scramblingProtecting => 'Scrambling & Protecting...';

  @override
  String protectedItems(int count, String failed) {
    return 'Protected $count items successfully.$failed';
  }

  @override
  String restoredToOriginal(String name) {
    return 'Restored \"$name\" to its original location.';
  }

  @override
  String failedToRestoreFile(String error) {
    return 'Failed to restore file: $error';
  }

  @override
  String get deletePermanentlyQuestion => 'Delete Permanently?';

  @override
  String deletePermanentlyQuestionHint(int count) {
    return 'Are you sure you want to permanently delete these $count item(s)? This action cannot be undone.';
  }

  @override
  String get fileDeletedPermanently => 'File deleted permanently.';

  @override
  String failedToDeleteFile(String error) {
    return 'Failed to delete file: $error';
  }

  @override
  String get decryptingSecurely => 'Decrypting securely...';

  @override
  String failedToDecryptItem(String error) {
    return 'Failed to decrypt and open item: $error';
  }

  @override
  String get securityDetails => 'Security Details';

  @override
  String get searchScrambledFiles => 'Search scrambled files...';

  @override
  String get hideFiles => 'Hide Files';

  @override
  String get securityStorage => 'SECURITY STORAGE';

  @override
  String get totalSpaceSecured => 'Total Space Secured';

  @override
  String get hiddenFiles => 'Hidden Files';

  @override
  String get restoreUnhide => 'Restore (Unhide)';

  @override
  String get deletePermanently => 'Delete Permanently';

  @override
  String get clearAll => 'Clear All';

  @override
  String get httpServerStopped => 'Local HTTP Sharing Server stopped.';

  @override
  String httpServerStarted(String url) {
    return 'Local HTTP Sharing Server started! URL: $url';
  }

  @override
  String errorStartingHttpServer(String error) {
    return 'Error starting HTTP Server: $error';
  }

  @override
  String get tunnelDeactivated => 'Internet Share Tunnel deactivated.';

  @override
  String get establishingRelay => 'Establishing secure proxy relay...';

  @override
  String get tunnelOnline =>
      'Internet cloud tunnel online! Temporary link active.';

  @override
  String failedToStartCloudShare(String error) {
    return 'Failed to start Cloud Share: $error';
  }

  @override
  String get linkCopied => 'Link copied to clipboard!';

  @override
  String get scanQrCode => 'Scan QR Code';

  @override
  String scanToOpen(String type) {
    return 'Scan with another device to open $type immediately.';
  }

  @override
  String get webSharingHub => 'Web Sharing Hub';

  @override
  String get localWebShare => 'Local Web Share';

  @override
  String get internetShareLink => 'Internet Share Link';

  @override
  String get httpLocalShareServer => 'HTTP Local Share Server';

  @override
  String get httpLocalShareServerHint =>
      'Allows other devices on the same Wi-Fi to access, view, and stream your files in their web browser.';

  @override
  String get serverOnlineStreaming => 'Server Online & Streaming';

  @override
  String get directBrowserUrl => 'Direct Browser URL:';

  @override
  String get copyUrl => 'Copy URL';

  @override
  String get qrCode => 'QR Code';

  @override
  String sharingDirectory(String folder) {
    return 'Sharing Directory: $folder';
  }

  @override
  String get serverIdle => 'Server is Idle';

  @override
  String get serverIdleHint =>
      'Make sure other devices are on the same Wi-Fi network as this device, then start the server.';

  @override
  String get internetShareTunnel => 'Internet Share Tunnel';

  @override
  String get internetShareTunnelHint =>
      'Generates a secure temporary public tunnel link. Share this link with anyone anywhere on the internet to let them download files high-speed, no matter the file size.';

  @override
  String get cloudTunnelActive => 'Cloud Tunnel Active';

  @override
  String get temporaryShareLink => 'Temporary Share Link (Active 24h):';

  @override
  String get copyLink => 'Copy Link';

  @override
  String get connectedClients => 'Connected Browser Clients';

  @override
  String get waitingForDownloads =>
      'Waiting for incoming internet downloads...';

  @override
  String get internetSharingInactive => 'Internet Sharing Inactive';

  @override
  String get internetSharingInactiveHint =>
      'Activate the tunnel to establish a secure link that works beyond local Wi-Fi.';

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

  @override
  String deleteVaultFileQuestionHint(String name) {
    return 'Are you sure you want to permanently delete \"$name\"? This action CANNOT be undone.';
  }

  @override
  String get appManager => 'App Manager';

  @override
  String get refreshList => 'Refresh List';

  @override
  String get sortBySize => 'Sort by Size';

  @override
  String get sortAlphabetically => 'Sort Alphabetically';

  @override
  String get exactStorageCalculation => 'Exact Storage Calculation';

  @override
  String get exactStorageCalculationHint =>
      'To see exact app storage sizes (APK + data + cache) instead of just the raw installer size, please enable the Usage Access permission for OpenFile in System Settings.';

  @override
  String get grantUsageAccess => 'Grant Usage Access Permission';

  @override
  String get storageAnalytics => 'Storage Analytics';

  @override
  String get rescanStorage => 'Rescan Storage';

  @override
  String get scanningDeviceStorage => 'Scanning Device Storage';

  @override
  String get analyzingStorage =>
      'Analyzing files, categorizing assets, and reading installed apps space...';

  @override
  String get totalStorage => 'Total Storage';

  @override
  String storageUsedWithPercent(String size, String percent) {
    return '$size used ($percent%)';
  }

  @override
  String get systemAndOther => 'System / Other';

  @override
  String percentOfTotalStorage(String percent) {
    return '$percent% of total storage';
  }

  @override
  String get uninstallApps => 'Uninstall Apps';

  @override
  String uninstallAppsQuestion(int count) {
    return 'Are you sure you want to uninstall $count selected app(s)?';
  }

  @override
  String get backingUpApps => 'Backing up selected applications...';

  @override
  String backedUpApps(int count) {
    return 'Successfully backed up $count app(s) to NFile/Backups/Apps/';
  }

  @override
  String failedToBackUpApps(String error) {
    return 'Failed to back up some apps: $error';
  }

  @override
  String get noApplicationsFound => 'No applications found';

  @override
  String packageAndVersion(String package, String version) {
    return '$package • v$version';
  }

  @override
  String appSizeAndInstalled(String size, String date) {
    return 'Size: $size • Installed: $date';
  }

  @override
  String get launchApplication => 'Launch Application';

  @override
  String get systemSettingsDetails => 'System Settings / Details';

  @override
  String get backUpApk => 'Back Up APK';

  @override
  String get backingUpApk => 'Backing up APK...';

  @override
  String get shareApkFile => 'Share APK File';

  @override
  String get uninstallApplication => 'Uninstall Application';

  @override
  String backupKindAndVersion(String kind, String version) {
    return '$kind • v$version';
  }

  @override
  String backupKindAndVersionFull(String kind, String version) {
    return '$kind • v$version';
  }

  @override
  String backupSizeAndDate(String size, String date) {
    return 'Size: $size • Backup Date: $date';
  }

  @override
  String get restoreOrInstallApp => 'Restore / Install App';

  @override
  String get shareBackupFile => 'Share Backup File';

  @override
  String get deleteBackupFile => 'Delete Backup File';

  @override
  String get noBackupsFound => 'No backups found';

  @override
  String downloadingFile(String file) {
    return 'Downloading: $file';
  }

  @override
  String sentBytes(String amount) {
    return 'Sent: $amount';
  }

  @override
  String get exitConfirmationLabel => 'Exit Confirmation';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionExit => 'Exit';

  @override
  String get actionHome => 'Home';

  @override
  String get actionBrowse => 'Browse';

  @override
  String get drawerNavigation => 'Navigation';

  @override
  String get customizationAndSettings => 'Customization & Settings';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get categoryImages => 'Images';

  @override
  String get categoryVideos => 'Videos';

  @override
  String get categoryAudio => 'Audio';

  @override
  String get categoryDocuments => 'Documents';

  @override
  String get categoryArchives => 'Archives';

  @override
  String get categoryDownloads => 'Downloads';

  @override
  String get categoryApks => 'APKs';

  @override
  String get categoryScreenshots => 'Screenshots';

  @override
  String get categoryApps => 'Apps';

  @override
  String get categoryManager => 'Manager';

  @override
  String get categoryBin => 'Bin';

  @override
  String get categorySettings => 'Settings';

  @override
  String get categoryConfigure => 'Configure';

  @override
  String get itemFolder => 'Folder';

  @override
  String get itemFile => 'File';

  @override
  String get actionCustomize => 'Customize';

  @override
  String get actionDone => 'Done';

  @override
  String get actionRename => 'Rename';

  @override
  String get searchGloballyHint => 'Search globally...';

  @override
  String get searchInFolderHint => 'Search in this folder...';

  @override
  String get actionCopy => 'Copy';

  @override
  String get actionCut => 'Cut';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionShare => 'Share';

  @override
  String get actionProperties => 'Properties';

  @override
  String get allRecentFiles => 'All Recent Files';

  @override
  String get actionRefresh => 'Refresh';

  @override
  String get deleteItemLabel => 'Delete Item';

  @override
  String get closeSearch => 'Close Search';

  @override
  String get searchInPane => 'Search in Pane';

  @override
  String get searchPlaceholder => 'Search...';

  @override
  String get unpinTab => 'Unpin Tab';

  @override
  String get pinTab => 'Pin Tab';

  @override
  String get openWithAlways => 'Always';

  @override
  String get actionArchive => 'Archive';

  @override
  String get actionExtract => 'Extract';

  @override
  String get timeJustNow => 'Just now';

  @override
  String get timeYesterday => 'Yesterday';

  @override
  String timeMinutesAgo(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String timeHoursAgo(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String timeDaysAgo(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String get appTagline => 'OpenFile - Beautiful File Manager';

  @override
  String get localFolder => 'Local Folder';

  @override
  String get unknownArtist => 'Unknown Artist';

  @override
  String get sdCardOrUsb => 'SD Card / USB';

  @override
  String get connecting => 'Connecting...';

  @override
  String get starting => 'Starting...';

  @override
  String dateDayMonth(int day, String month) {
    return '$day $month';
  }

  @override
  String get monthJanuary => 'January';

  @override
  String get monthFebruary => 'February';

  @override
  String get monthMarch => 'March';

  @override
  String get monthApril => 'April';

  @override
  String get monthMay => 'May';

  @override
  String get monthJune => 'June';

  @override
  String get monthJuly => 'July';

  @override
  String get monthAugust => 'August';

  @override
  String get monthSeptember => 'September';

  @override
  String get monthOctober => 'October';

  @override
  String get monthNovember => 'November';

  @override
  String get monthDecember => 'December';
}
