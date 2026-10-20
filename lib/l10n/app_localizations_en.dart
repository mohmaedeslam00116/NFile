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
}
