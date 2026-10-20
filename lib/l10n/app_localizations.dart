import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The name of the application. It is the same in every language.
  ///
  /// In en, this message translates to:
  /// **'NFile'**
  String get appName;

  /// Shown while a document that was shared with the application is opened.
  ///
  /// In en, this message translates to:
  /// **'Opening shared document...'**
  String get openingSharedDocument;

  /// Shown under the message of the opening of a shared document.
  ///
  /// In en, this message translates to:
  /// **'Resolving secure content stream'**
  String get resolvingSecureContent;

  /// The title of the screen that asks for the permission of the storage.
  ///
  /// In en, this message translates to:
  /// **'Storage Access Required'**
  String get storageAccessRequired;

  /// The explanation under the title of the screen that asks for the permission of the storage.
  ///
  /// In en, this message translates to:
  /// **'NFile requires storage permission to manage, organize, and display your media files seamlessly.'**
  String get storageAccessExplanation;

  /// The button that asks for the permission of the storage.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get grantPermission;

  /// No description provided for @couldNotOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Could not open link: {url}'**
  String couldNotOpenLink(String url);

  /// No description provided for @aboutNFile.
  ///
  /// In en, this message translates to:
  /// **'About NFile'**
  String get aboutNFile;

  /// No description provided for @appVersionWithChannel.
  ///
  /// In en, this message translates to:
  /// **'v{version} ({channel})'**
  String appVersionWithChannel(String version, String channel);

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'NFile is a beautiful, fluid, and open-source file manager and offline media hub built with Flutter. Designed for extreme performance, clean glassmorphic aesthetics, and seamless user experiences.'**
  String get aboutDescription;

  /// No description provided for @coreHighlights.
  ///
  /// In en, this message translates to:
  /// **'Core Highlights'**
  String get coreHighlights;

  /// No description provided for @extremeSpeed.
  ///
  /// In en, this message translates to:
  /// **'Extreme Speed'**
  String get extremeSpeed;

  /// No description provided for @statelessCaching.
  ///
  /// In en, this message translates to:
  /// **'Stateless caching & async scans'**
  String get statelessCaching;

  /// No description provided for @vaultSecure.
  ///
  /// In en, this message translates to:
  /// **'Vault Secure'**
  String get vaultSecure;

  /// No description provided for @encryptedWorkspace.
  ///
  /// In en, this message translates to:
  /// **'Encrypted safe workspace'**
  String get encryptedWorkspace;

  /// No description provided for @serversHub.
  ///
  /// In en, this message translates to:
  /// **'Servers Hub'**
  String get serversHub;

  /// No description provided for @richUi.
  ///
  /// In en, this message translates to:
  /// **'Rich UI'**
  String get richUi;

  /// No description provided for @amoledBlack.
  ///
  /// In en, this message translates to:
  /// **'AMOLED Black & beautiful seeds'**
  String get amoledBlack;

  /// No description provided for @connectAndShare.
  ///
  /// In en, this message translates to:
  /// **'Connect & Share'**
  String get connectAndShare;

  /// No description provided for @starOnRepository.
  ///
  /// In en, this message translates to:
  /// **'Star on Repository'**
  String get starOnRepository;

  /// No description provided for @joinTelegramChannel.
  ///
  /// In en, this message translates to:
  /// **'Join Telegram Channel'**
  String get joinTelegramChannel;

  /// No description provided for @shareAppWithFriends.
  ///
  /// In en, this message translates to:
  /// **'Share App with Friends'**
  String get shareAppWithFriends;

  /// No description provided for @exploreSourceCode.
  ///
  /// In en, this message translates to:
  /// **'Explore GitHub Source Code'**
  String get exploreSourceCode;

  /// No description provided for @madeWithLove.
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ by Rubex'**
  String get madeWithLove;

  /// No description provided for @copyrightNotice.
  ///
  /// In en, this message translates to:
  /// **'Copyright © 2026 NFile. All rights reserved.'**
  String get copyrightNotice;

  /// No description provided for @copiedItemsToClipboard.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Copied 1 item to clipboard} other{Copied {count} items to clipboard}}'**
  String copiedItemsToClipboard(int count);

  /// No description provided for @cutItemsToClipboard.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Cut 1 item to clipboard} other{Cut {count} items to clipboard}}'**
  String cutItemsToClipboard(int count);

  /// No description provided for @errorSharing.
  ///
  /// In en, this message translates to:
  /// **'Error sharing: {error}'**
  String errorSharing(String error);

  /// No description provided for @noFilesToShare.
  ///
  /// In en, this message translates to:
  /// **'No files available to share'**
  String get noFilesToShare;

  /// No description provided for @deleteSelected.
  ///
  /// In en, this message translates to:
  /// **'Delete Selected'**
  String get deleteSelected;

  /// No description provided for @successfullyDeletedItems.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted items'**
  String get successfullyDeletedItems;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @cutToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Cut to clipboard'**
  String get cutToClipboard;

  /// No description provided for @enterNewName.
  ///
  /// In en, this message translates to:
  /// **'Enter new name'**
  String get enterNewName;

  /// No description provided for @deleteFile.
  ///
  /// In en, this message translates to:
  /// **'Delete File'**
  String get deleteFile;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// No description provided for @noRecentFiles.
  ///
  /// In en, this message translates to:
  /// **'No recent files'**
  String get noRecentFiles;

  /// No description provided for @noRecentFilesHint.
  ///
  /// In en, this message translates to:
  /// **'Newly created or downloaded files will show up here.'**
  String get noRecentFilesHint;

  /// No description provided for @selectedItemsWithSize.
  ///
  /// In en, this message translates to:
  /// **'{count} Selected ({size})'**
  String selectedItemsWithSize(int count, String size);

  /// No description provided for @moreActions.
  ///
  /// In en, this message translates to:
  /// **'More Actions'**
  String get moreActions;

  /// No description provided for @dashboardRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Dashboard refreshed successfully'**
  String get dashboardRefreshed;

  /// No description provided for @exitApplication.
  ///
  /// In en, this message translates to:
  /// **'Exit Application'**
  String get exitApplication;

  /// No description provided for @confirmExitMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit? Press back again or tap Exit to close the app.'**
  String get confirmExitMessage;

  /// No description provided for @pressBackAgainToExit.
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit'**
  String get pressBackAgainToExit;

  /// No description provided for @myFiles.
  ///
  /// In en, this message translates to:
  /// **'My Files'**
  String get myFiles;

  /// No description provided for @refreshDashboard.
  ///
  /// In en, this message translates to:
  /// **'Refresh Dashboard'**
  String get refreshDashboard;

  /// No description provided for @newTab.
  ///
  /// In en, this message translates to:
  /// **'New Tab'**
  String get newTab;

  /// No description provided for @duplicateTab.
  ///
  /// In en, this message translates to:
  /// **'Duplicate Tab'**
  String get duplicateTab;

  /// No description provided for @closeOtherTabs.
  ///
  /// In en, this message translates to:
  /// **'Close Other Tabs'**
  String get closeOtherTabs;

  /// No description provided for @closeTab.
  ///
  /// In en, this message translates to:
  /// **'Close Tab'**
  String get closeTab;

  /// No description provided for @showInLocation.
  ///
  /// In en, this message translates to:
  /// **'Show in location'**
  String get showInLocation;

  /// No description provided for @countAndName.
  ///
  /// In en, this message translates to:
  /// **'{count} {name}'**
  String countAndName(int count, String name);

  /// No description provided for @countAndDate.
  ///
  /// In en, this message translates to:
  /// **'{count} • {date}'**
  String countAndDate(String count, String date);

  /// No description provided for @labelActive.
  ///
  /// In en, this message translates to:
  /// **'{label} Active'**
  String labelActive(String label);

  /// No description provided for @noMatchesFound.
  ///
  /// In en, this message translates to:
  /// **'No matching directories or files found'**
  String get noMatchesFound;

  /// No description provided for @pathNotFound.
  ///
  /// In en, this message translates to:
  /// **'Path not found: {path}'**
  String pathNotFound(String path);

  /// No description provided for @enterAbsolutePath.
  ///
  /// In en, this message translates to:
  /// **'Enter absolute path...'**
  String get enterAbsolutePath;

  /// No description provided for @copiedPath.
  ///
  /// In en, this message translates to:
  /// **'Copied: {path}'**
  String copiedPath(String path);

  /// No description provided for @systemRoot.
  ///
  /// In en, this message translates to:
  /// **'System Root'**
  String get systemRoot;

  /// No description provided for @globalSearch.
  ///
  /// In en, this message translates to:
  /// **'Global Search'**
  String get globalSearch;

  /// No description provided for @recycleBin.
  ///
  /// In en, this message translates to:
  /// **'Recycle Bin'**
  String get recycleBin;

  /// No description provided for @serversAndTools.
  ///
  /// In en, this message translates to:
  /// **'Servers & Tools'**
  String get serversAndTools;

  /// No description provided for @privateWallet.
  ///
  /// In en, this message translates to:
  /// **'Private Wallet'**
  String get privateWallet;

  /// No description provided for @ftpServer.
  ///
  /// In en, this message translates to:
  /// **'FTP Server'**
  String get ftpServer;

  /// No description provided for @webSharing.
  ///
  /// In en, this message translates to:
  /// **'Web Sharing'**
  String get webSharing;

  /// No description provided for @addRemoteConnection.
  ///
  /// In en, this message translates to:
  /// **'Add Remote Connection'**
  String get addRemoteConnection;

  /// No description provided for @quickCategories.
  ///
  /// In en, this message translates to:
  /// **'Quick Categories'**
  String get quickCategories;

  /// No description provided for @addShortcut.
  ///
  /// In en, this message translates to:
  /// **'Add Shortcut'**
  String get addShortcut;

  /// No description provided for @moreSettings.
  ///
  /// In en, this message translates to:
  /// **'More Settings'**
  String get moreSettings;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'NFile v{version}'**
  String appVersion(String version);

  /// No description provided for @beautifulMediaSuite.
  ///
  /// In en, this message translates to:
  /// **'Beautiful Media Suite'**
  String get beautifulMediaSuite;

  /// No description provided for @openWith.
  ///
  /// In en, this message translates to:
  /// **'Open with...'**
  String get openWith;

  /// No description provided for @builtInViewer.
  ///
  /// In en, this message translates to:
  /// **'Built-in NFile Viewer'**
  String get builtInViewer;

  /// No description provided for @builtInViewerDescription.
  ///
  /// In en, this message translates to:
  /// **'NFile\'s custom native experience'**
  String get builtInViewerDescription;

  /// No description provided for @systemExternalApp.
  ///
  /// In en, this message translates to:
  /// **'System External App'**
  String get systemExternalApp;

  /// No description provided for @externalAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Open with third party apps on device'**
  String get externalAppDescription;

  /// No description provided for @justOnce.
  ///
  /// In en, this message translates to:
  /// **'Just once'**
  String get justOnce;

  /// No description provided for @goToParentDirectory.
  ///
  /// In en, this message translates to:
  /// **'Go to Parent Directory'**
  String get goToParentDirectory;

  /// No description provided for @searchInTab.
  ///
  /// In en, this message translates to:
  /// **'Search in tab'**
  String get searchInTab;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// No description provided for @emptyFolder.
  ///
  /// In en, this message translates to:
  /// **'Empty Folder'**
  String get emptyFolder;

  /// No description provided for @internalStorage.
  ///
  /// In en, this message translates to:
  /// **'Internal Storage'**
  String get internalStorage;

  /// No description provided for @browseDeviceFiles.
  ///
  /// In en, this message translates to:
  /// **'Browse device files'**
  String get browseDeviceFiles;

  /// No description provided for @storageUsed.
  ///
  /// In en, this message translates to:
  /// **'{size} used'**
  String storageUsed(String size);

  /// No description provided for @storageTotal.
  ///
  /// In en, this message translates to:
  /// **'{size} total'**
  String storageTotal(String size);

  /// No description provided for @storageUsedPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Used'**
  String storageUsedPercent(int percent);

  /// No description provided for @storageFree.
  ///
  /// In en, this message translates to:
  /// **'{size} free'**
  String storageFree(String size);

  /// No description provided for @noShortcutsPinned.
  ///
  /// In en, this message translates to:
  /// **'No shortcuts pinned. Tap Customize to add.'**
  String get noShortcutsPinned;

  /// No description provided for @customizeShortcuts.
  ///
  /// In en, this message translates to:
  /// **'Customize Shortcuts'**
  String get customizeShortcuts;

  /// No description provided for @dragToReorderHint.
  ///
  /// In en, this message translates to:
  /// **'Drag items by the handle (=) to reorder icons on the Home Screen.'**
  String get dragToReorderHint;

  /// No description provided for @addFolderFileShortcut.
  ///
  /// In en, this message translates to:
  /// **'Add Folder / File Shortcut'**
  String get addFolderFileShortcut;

  /// No description provided for @customPaths.
  ///
  /// In en, this message translates to:
  /// **'Custom Paths'**
  String get customPaths;

  /// No description provided for @customPathsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} custom path(s)'**
  String customPathsCount(int count);

  /// No description provided for @deleteShortcut.
  ///
  /// In en, this message translates to:
  /// **'Delete Shortcut'**
  String get deleteShortcut;

  /// No description provided for @defaultScanLocations.
  ///
  /// In en, this message translates to:
  /// **'Default Scan Locations:'**
  String get defaultScanLocations;

  /// No description provided for @restoreLocation.
  ///
  /// In en, this message translates to:
  /// **'Restore Location'**
  String get restoreLocation;

  /// No description provided for @excludeLocation.
  ///
  /// In en, this message translates to:
  /// **'Exclude Location'**
  String get excludeLocation;

  /// No description provided for @customScanLocations.
  ///
  /// In en, this message translates to:
  /// **'Custom Scan Locations:'**
  String get customScanLocations;

  /// No description provided for @noCustomPaths.
  ///
  /// In en, this message translates to:
  /// **'No custom paths added.'**
  String get noCustomPaths;

  /// No description provided for @addCustomPath.
  ///
  /// In en, this message translates to:
  /// **'Add Custom Path'**
  String get addCustomPath;

  /// No description provided for @recentFiles.
  ///
  /// In en, this message translates to:
  /// **'Recent Files'**
  String get recentFiles;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @restrictedSystemFolder.
  ///
  /// In en, this message translates to:
  /// **'Restricted System Folder'**
  String get restrictedSystemFolder;

  /// No description provided for @restrictedFolderExplanation.
  ///
  /// In en, this message translates to:
  /// **'Android 11+ restricts standard access to Android/data and Android/obb folders to protect app data. To view and modify these files, NFile requires advanced permissions.'**
  String get restrictedFolderExplanation;

  /// No description provided for @useRootAccess.
  ///
  /// In en, this message translates to:
  /// **'Use Root Access (Superuser)'**
  String get useRootAccess;

  /// No description provided for @grantShizukuAccess.
  ///
  /// In en, this message translates to:
  /// **'Grant Shizuku Access (No Root)'**
  String get grantShizukuAccess;

  /// No description provided for @howToSetupShizuku.
  ///
  /// In en, this message translates to:
  /// **'How to setup Shizuku?'**
  String get howToSetupShizuku;

  /// No description provided for @searchSettings.
  ///
  /// In en, this message translates to:
  /// **'Search settings...'**
  String get searchSettings;

  /// No description provided for @failedToTransfer.
  ///
  /// In en, this message translates to:
  /// **'Failed to transfer: {error}'**
  String failedToTransfer(String error);

  /// No description provided for @operationCancelled.
  ///
  /// In en, this message translates to:
  /// **'Operation Cancelled'**
  String get operationCancelled;

  /// No description provided for @failedToConnect.
  ///
  /// In en, this message translates to:
  /// **'Failed to connect to remote server: {error}'**
  String failedToConnect(String error);

  /// No description provided for @compressionLimitExceeded.
  ///
  /// In en, this message translates to:
  /// **'Compression Limit Exceeded'**
  String get compressionLimitExceeded;

  /// No description provided for @cannotMoveFolderIntoItself.
  ///
  /// In en, this message translates to:
  /// **'Cannot move a folder inside itself or same location'**
  String get cannotMoveFolderIntoItself;

  /// No description provided for @movedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Moved {name} successfully'**
  String movedSuccessfully(String name);

  /// No description provided for @failedToMoveItem.
  ///
  /// In en, this message translates to:
  /// **'Failed to move item: {error}'**
  String failedToMoveItem(String error);

  /// No description provided for @cannotCopyFolderIntoItself.
  ///
  /// In en, this message translates to:
  /// **'Cannot copy a folder inside itself or same location'**
  String get cannotCopyFolderIntoItself;

  /// No description provided for @copiedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Copied {name} successfully'**
  String copiedSuccessfully(String name);

  /// No description provided for @failedToCopyItem.
  ///
  /// In en, this message translates to:
  /// **'Failed to copy item: {error}'**
  String failedToCopyItem(String error);

  /// No description provided for @sdCard.
  ///
  /// In en, this message translates to:
  /// **'sdCard'**
  String get sdCard;

  /// No description provided for @transferFailed.
  ///
  /// In en, this message translates to:
  /// **'Transfer failed: {error}'**
  String transferFailed(String error);

  /// No description provided for @movedItemsSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Moved items successfully'**
  String get movedItemsSuccessfully;

  /// No description provided for @copiedItemsSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Copied items successfully'**
  String get copiedItemsSuccessfully;

  /// No description provided for @releaseChannel.
  ///
  /// In en, this message translates to:
  /// **'releaseChannel'**
  String get releaseChannel;

  /// No description provided for @preparingShare.
  ///
  /// In en, this message translates to:
  /// **'Preparing folders for sharing...'**
  String get preparingShare;

  /// No description provided for @compressingContents.
  ///
  /// In en, this message translates to:
  /// **'Compressing contents, please wait'**
  String get compressingContents;

  /// No description provided for @noShareableItems.
  ///
  /// In en, this message translates to:
  /// **'No shareable items found.'**
  String get noShareableItems;

  /// No description provided for @errorPreparingShare.
  ///
  /// In en, this message translates to:
  /// **'Error preparing files to share: {error}'**
  String errorPreparingShare(String error);

  /// No description provided for @newFile.
  ///
  /// In en, this message translates to:
  /// **'New File'**
  String get newFile;

  /// No description provided for @fileName.
  ///
  /// In en, this message translates to:
  /// **'File name'**
  String get fileName;

  /// No description provided for @fileNameTaken.
  ///
  /// In en, this message translates to:
  /// **'\"{fileName}\" already exists. Created \"{createdName}\" instead.'**
  String fileNameTaken(String fileName, String createdName);

  /// No description provided for @newFolder.
  ///
  /// In en, this message translates to:
  /// **'New Folder'**
  String get newFolder;

  /// No description provided for @folderName.
  ///
  /// In en, this message translates to:
  /// **'Folder name'**
  String get folderName;

  /// No description provided for @folderNameTaken.
  ///
  /// In en, this message translates to:
  /// **'\"{folderName}\" already exists. Created \"{createdName}\" instead.'**
  String folderNameTaken(String folderName, String createdName);

  /// No description provided for @createNewDirectory.
  ///
  /// In en, this message translates to:
  /// **'Create a new directory'**
  String get createNewDirectory;

  /// No description provided for @createNewTextDocument.
  ///
  /// In en, this message translates to:
  /// **'Create a new empty text document'**
  String get createNewTextDocument;

  /// No description provided for @newArchive.
  ///
  /// In en, this message translates to:
  /// **'New Archive'**
  String get newArchive;

  /// No description provided for @compressFolderContents.
  ///
  /// In en, this message translates to:
  /// **'Compress current folder contents'**
  String get compressFolderContents;

  /// No description provided for @viewAndSortOptions.
  ///
  /// In en, this message translates to:
  /// **'View & Sort Options'**
  String get viewAndSortOptions;

  /// No description provided for @layoutMode.
  ///
  /// In en, this message translates to:
  /// **'Layout Mode'**
  String get layoutMode;

  /// No description provided for @listView.
  ///
  /// In en, this message translates to:
  /// **'List View'**
  String get listView;

  /// No description provided for @gridView.
  ///
  /// In en, this message translates to:
  /// **'Grid View'**
  String get gridView;

  /// No description provided for @sizeAndPaddingOptions.
  ///
  /// In en, this message translates to:
  /// **'Size & Padding Options'**
  String get sizeAndPaddingOptions;

  /// No description provided for @iconAndFolderSize.
  ///
  /// In en, this message translates to:
  /// **'Icon & Folder Size'**
  String get iconAndFolderSize;

  /// No description provided for @itemPaddingAndSpacing.
  ///
  /// In en, this message translates to:
  /// **'Item Padding & Spacing'**
  String get itemPaddingAndSpacing;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// No description provided for @showHiddenFiles.
  ///
  /// In en, this message translates to:
  /// **'Show Hidden Files'**
  String get showHiddenFiles;

  /// No description provided for @showHiddenHint.
  ///
  /// In en, this message translates to:
  /// **'Display system files and folders starting with a dot (.)'**
  String get showHiddenHint;

  /// No description provided for @onlyThisFolder.
  ///
  /// In en, this message translates to:
  /// **'Only this folder'**
  String get onlyThisFolder;

  /// No description provided for @onlyThisFolderHint.
  ///
  /// In en, this message translates to:
  /// **'Enable custom sorting specific to this folder'**
  String get onlyThisFolderHint;

  /// No description provided for @storageVolumes.
  ///
  /// In en, this message translates to:
  /// **'Storage Volumes'**
  String get storageVolumes;

  /// No description provided for @networkConnections.
  ///
  /// In en, this message translates to:
  /// **'Network Connections'**
  String get networkConnections;

  /// No description provided for @addNetworkConnection.
  ///
  /// In en, this message translates to:
  /// **'Add Network Connection'**
  String get addNetworkConnection;

  /// No description provided for @connectionTypeAndHost.
  ///
  /// In en, this message translates to:
  /// **'{type} • {host}'**
  String connectionTypeAndHost(String type, String host);

  /// No description provided for @removeConnection.
  ///
  /// In en, this message translates to:
  /// **'Remove Connection'**
  String get removeConnection;

  /// No description provided for @createNew.
  ///
  /// In en, this message translates to:
  /// **'Create New'**
  String get createNew;

  /// No description provided for @foldersCount.
  ///
  /// In en, this message translates to:
  /// **'folders: {count}'**
  String foldersCount(int count);

  /// No description provided for @filesCount.
  ///
  /// In en, this message translates to:
  /// **'files: {count}'**
  String filesCount(int count);

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @nothingMatchesSearch.
  ///
  /// In en, this message translates to:
  /// **'We could not find anything matching \"{query}\" under {filter}'**
  String nothingMatchesSearch(String query, String filter);

  /// No description provided for @emptyFolderHint.
  ///
  /// In en, this message translates to:
  /// **'This directory does not contain any files or subfolders.'**
  String get emptyFolderHint;

  /// No description provided for @actionCancelled.
  ///
  /// In en, this message translates to:
  /// **'Action cancelled / Clipboard cleared'**
  String get actionCancelled;

  /// No description provided for @pastedHoldingClipboard.
  ///
  /// In en, this message translates to:
  /// **'Pasted (holding clipboard for multiple pastes)'**
  String get pastedHoldingClipboard;

  /// No description provided for @pastedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Pasted successfully'**
  String get pastedSuccessfully;

  /// No description provided for @pasteHere.
  ///
  /// In en, this message translates to:
  /// **'Paste Here'**
  String get pasteHere;

  /// No description provided for @selectMode.
  ///
  /// In en, this message translates to:
  /// **'Select Mode'**
  String get selectMode;

  /// No description provided for @storageVolumesAndSdCard.
  ///
  /// In en, this message translates to:
  /// **'Storage Volumes & SD Card'**
  String get storageVolumesAndSdCard;

  /// No description provided for @labelFilterActive.
  ///
  /// In en, this message translates to:
  /// **'{label} Filter Active'**
  String labelFilterActive(String label);

  /// No description provided for @createFolder.
  ///
  /// In en, this message translates to:
  /// **'Create Folder'**
  String get createFolder;

  /// No description provided for @enterFolderName.
  ///
  /// In en, this message translates to:
  /// **'Enter folder name'**
  String get enterFolderName;

  /// No description provided for @errorCreatingFolder.
  ///
  /// In en, this message translates to:
  /// **'Error creating folder: {error}'**
  String errorCreatingFolder(String error);

  /// No description provided for @selectStorageDrive.
  ///
  /// In en, this message translates to:
  /// **'Select Storage Drive'**
  String get selectStorageDrive;

  /// No description provided for @selectStorage.
  ///
  /// In en, this message translates to:
  /// **'Select Storage'**
  String get selectStorage;

  /// No description provided for @clearSelection.
  ///
  /// In en, this message translates to:
  /// **'Clear Selection'**
  String get clearSelection;

  /// No description provided for @folderIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Folder is empty'**
  String get folderIsEmpty;

  /// No description provided for @pinSelected.
  ///
  /// In en, this message translates to:
  /// **'Pin Selected ({count})'**
  String pinSelected(int count);

  /// No description provided for @pinThisFolder.
  ///
  /// In en, this message translates to:
  /// **'Pin This Folder'**
  String get pinThisFolder;

  /// No description provided for @addSelected.
  ///
  /// In en, this message translates to:
  /// **'Add Selected ({count})'**
  String addSelected(int count);

  /// No description provided for @overallProgress.
  ///
  /// In en, this message translates to:
  /// **'Overall Progress'**
  String get overallProgress;

  /// No description provided for @renamingFiles.
  ///
  /// In en, this message translates to:
  /// **'Renaming files...'**
  String get renamingFiles;

  /// No description provided for @updatingFolderContent.
  ///
  /// In en, this message translates to:
  /// **'Please wait, updating folder content'**
  String get updatingFolderContent;

  /// No description provided for @batchRename.
  ///
  /// In en, this message translates to:
  /// **'Batch Rename'**
  String get batchRename;

  /// No description provided for @configuringItems.
  ///
  /// In en, this message translates to:
  /// **'Configuring {count} items'**
  String configuringItems(int count);

  /// No description provided for @placeholderName.
  ///
  /// In en, this message translates to:
  /// **'% (Name)'**
  String get placeholderName;

  /// No description provided for @placeholderNameHint.
  ///
  /// In en, this message translates to:
  /// **'Original name (%)'**
  String get placeholderNameHint;

  /// No description provided for @placeholderNum.
  ///
  /// In en, this message translates to:
  /// **'# (Num)'**
  String get placeholderNum;

  /// No description provided for @placeholderNumHint.
  ///
  /// In en, this message translates to:
  /// **'Sequential number (#)'**
  String get placeholderNumHint;

  /// No description provided for @placeholderTripleHint.
  ///
  /// In en, this message translates to:
  /// **'Triple sequential number (###)'**
  String get placeholderTripleHint;

  /// No description provided for @placeholderBase.
  ///
  /// In en, this message translates to:
  /// **'{n} (Base)'**
  String placeholderBase(String n);

  /// No description provided for @placeholderBaseHint.
  ///
  /// In en, this message translates to:
  /// **'File name without extension ({n})'**
  String placeholderBaseHint(String n);

  /// No description provided for @placeholderExtensionWithDot.
  ///
  /// In en, this message translates to:
  /// **'{de} (.ext)'**
  String placeholderExtensionWithDot(String de);

  /// No description provided for @placeholderExtensionWithDotHint.
  ///
  /// In en, this message translates to:
  /// **'Extension with dot ({de})'**
  String placeholderExtensionWithDotHint(String de);

  /// No description provided for @placeholderExtension.
  ///
  /// In en, this message translates to:
  /// **'{e} (ext)'**
  String placeholderExtension(String e);

  /// No description provided for @placeholderExtensionHint.
  ///
  /// In en, this message translates to:
  /// **'Extension without dot ({e})'**
  String placeholderExtensionHint(String e);

  /// No description provided for @placeholderFull.
  ///
  /// In en, this message translates to:
  /// **'{N} (Full)'**
  String placeholderFull(String N);

  /// No description provided for @placeholderFullHint.
  ///
  /// In en, this message translates to:
  /// **'Full name with extension ({N})'**
  String placeholderFullHint(String N);

  /// No description provided for @namePattern.
  ///
  /// In en, this message translates to:
  /// **'Name Pattern'**
  String get namePattern;

  /// No description provided for @namePatternExample.
  ///
  /// In en, this message translates to:
  /// **'e.g. Image_#'**
  String get namePatternExample;

  /// No description provided for @startNumber.
  ///
  /// In en, this message translates to:
  /// **'Start Number'**
  String get startNumber;

  /// No description provided for @findText.
  ///
  /// In en, this message translates to:
  /// **'Find text'**
  String get findText;

  /// No description provided for @searchTerm.
  ///
  /// In en, this message translates to:
  /// **'Search term'**
  String get searchTerm;

  /// No description provided for @replaceWith.
  ///
  /// In en, this message translates to:
  /// **'Replace with'**
  String get replaceWith;

  /// No description provided for @renamePreview.
  ///
  /// In en, this message translates to:
  /// **'Rename Preview'**
  String get renamePreview;

  /// No description provided for @reviewingItems.
  ///
  /// In en, this message translates to:
  /// **'Reviewing {count} items'**
  String reviewingItems(int count);

  /// No description provided for @backToEdit.
  ///
  /// In en, this message translates to:
  /// **'Back to Edit'**
  String get backToEdit;

  /// No description provided for @applyChanges.
  ///
  /// In en, this message translates to:
  /// **'Apply Changes'**
  String get applyChanges;

  /// No description provided for @fileAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'File Already Exists'**
  String get fileAlreadyExists;

  /// No description provided for @fileConflictQuestion.
  ///
  /// In en, this message translates to:
  /// **'A file named \"{fileName}\" already exists in the destination folder. What would you like to do?'**
  String fileConflictQuestion(String fileName);

  /// No description provided for @existingFile.
  ///
  /// In en, this message translates to:
  /// **'Existing File'**
  String get existingFile;

  /// No description provided for @applyToAllConflicts.
  ///
  /// In en, this message translates to:
  /// **'Apply to all remaining conflicts'**
  String get applyToAllConflicts;

  /// No description provided for @cancelPaste.
  ///
  /// In en, this message translates to:
  /// **'Cancel Paste'**
  String get cancelPaste;

  /// No description provided for @keepBoth.
  ///
  /// In en, this message translates to:
  /// **'Keep Both'**
  String get keepBoth;

  /// No description provided for @renameFile.
  ///
  /// In en, this message translates to:
  /// **'Rename File'**
  String get renameFile;

  /// No description provided for @newFilename.
  ///
  /// In en, this message translates to:
  /// **'New filename'**
  String get newFilename;

  /// No description provided for @createArchive.
  ///
  /// In en, this message translates to:
  /// **'Create Archive'**
  String get createArchive;

  /// No description provided for @archiveName.
  ///
  /// In en, this message translates to:
  /// **'Archive Name'**
  String get archiveName;

  /// No description provided for @archiveFormat.
  ///
  /// In en, this message translates to:
  /// **'Archive Format'**
  String get archiveFormat;

  /// No description provided for @compressionLevel.
  ///
  /// In en, this message translates to:
  /// **'Compression Level: {level}'**
  String compressionLevel(String level);

  /// No description provided for @passwordOptional.
  ///
  /// In en, this message translates to:
  /// **'Password (Optional)'**
  String get passwordOptional;

  /// No description provided for @splitVolumeSize.
  ///
  /// In en, this message translates to:
  /// **'Split Volume Size in MB (Optional)'**
  String get splitVolumeSize;

  /// No description provided for @splitVolumeSizeHint.
  ///
  /// In en, this message translates to:
  /// **'Leave empty for single archive'**
  String get splitVolumeSizeHint;

  /// No description provided for @deleteSourceAfter.
  ///
  /// In en, this message translates to:
  /// **'Delete source files after completion'**
  String get deleteSourceAfter;

  /// No description provided for @separateArchivePerFile.
  ///
  /// In en, this message translates to:
  /// **'Create separate archive for each file'**
  String get separateArchivePerFile;

  /// No description provided for @dragAndDropOptions.
  ///
  /// In en, this message translates to:
  /// **'Drag & Drop Options'**
  String get dragAndDropOptions;

  /// No description provided for @destinationLocation.
  ///
  /// In en, this message translates to:
  /// **'Destination Location'**
  String get destinationLocation;

  /// No description provided for @droppedFolder.
  ///
  /// In en, this message translates to:
  /// **'Dropped Folder'**
  String get droppedFolder;

  /// No description provided for @currentFolder.
  ///
  /// In en, this message translates to:
  /// **'Current Folder'**
  String get currentFolder;

  /// No description provided for @chooseAction.
  ///
  /// In en, this message translates to:
  /// **'Choose Action'**
  String get chooseAction;

  /// No description provided for @moveHere.
  ///
  /// In en, this message translates to:
  /// **'Move here'**
  String get moveHere;

  /// No description provided for @moveHereHint.
  ///
  /// In en, this message translates to:
  /// **'Cut & paste item into destination folder'**
  String get moveHereHint;

  /// No description provided for @copyHere.
  ///
  /// In en, this message translates to:
  /// **'Copy here'**
  String get copyHere;

  /// No description provided for @copyHereHint.
  ///
  /// In en, this message translates to:
  /// **'Leaves original file intact and duplicates here'**
  String get copyHereHint;

  /// No description provided for @archiveHere.
  ///
  /// In en, this message translates to:
  /// **'Archive here'**
  String get archiveHere;

  /// No description provided for @archiveHereHint.
  ///
  /// In en, this message translates to:
  /// **'Compress item into a zip/tar archive here'**
  String get archiveHereHint;

  /// No description provided for @archiveCreated.
  ///
  /// In en, this message translates to:
  /// **'Archive \"{name}\" created successfully!'**
  String archiveCreated(String name);

  /// No description provided for @failedToCreateArchive.
  ///
  /// In en, this message translates to:
  /// **'Failed to create archive: {error}'**
  String failedToCreateArchive(String error);

  /// No description provided for @extractArchive.
  ///
  /// In en, this message translates to:
  /// **'Extract Archive'**
  String get extractArchive;

  /// No description provided for @extractToFolder.
  ///
  /// In en, this message translates to:
  /// **'Extract to Folder'**
  String get extractToFolder;

  /// No description provided for @passwordIfEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Password (if encrypted)'**
  String get passwordIfEncrypted;

  /// No description provided for @allFiles.
  ///
  /// In en, this message translates to:
  /// **'All Files'**
  String get allFiles;

  /// No description provided for @allFilesHint.
  ///
  /// In en, this message translates to:
  /// **'Show all files and folders in this directory'**
  String get allFilesHint;

  /// No description provided for @documentsOnly.
  ///
  /// In en, this message translates to:
  /// **'Documents only'**
  String get documentsOnly;

  /// No description provided for @documentsOnlyHint.
  ///
  /// In en, this message translates to:
  /// **'PDFs, Word docs, spreadsheets, texts, and e-books'**
  String get documentsOnlyHint;

  /// No description provided for @imagesOnly.
  ///
  /// In en, this message translates to:
  /// **'Images only'**
  String get imagesOnly;

  /// No description provided for @imagesOnlyHint.
  ///
  /// In en, this message translates to:
  /// **'JPEGs, PNGs, WebPs, and raw photo formats'**
  String get imagesOnlyHint;

  /// No description provided for @audioOnly.
  ///
  /// In en, this message translates to:
  /// **'Audio only'**
  String get audioOnly;

  /// No description provided for @audioOnlyHint.
  ///
  /// In en, this message translates to:
  /// **'MP3s, WAVs, AACs, and high-fidelity audios'**
  String get audioOnlyHint;

  /// No description provided for @videosOnly.
  ///
  /// In en, this message translates to:
  /// **'Videos only'**
  String get videosOnly;

  /// No description provided for @videosOnlyHint.
  ///
  /// In en, this message translates to:
  /// **'MP4s, MKVs, WebMs, and high-res video clips'**
  String get videosOnlyHint;

  /// No description provided for @archivesOnly.
  ///
  /// In en, this message translates to:
  /// **'Archives only'**
  String get archivesOnly;

  /// No description provided for @archivesOnlyHint.
  ///
  /// In en, this message translates to:
  /// **'ZIPs, 7Zs, RARs, and other compressed assets'**
  String get archivesOnlyHint;

  /// No description provided for @filterFilesByType.
  ///
  /// In en, this message translates to:
  /// **'Filter Files By Type'**
  String get filterFilesByType;

  /// No description provided for @filterFilesHint.
  ///
  /// In en, this message translates to:
  /// **'Select a category to display matching files only'**
  String get filterFilesHint;

  /// No description provided for @processingItem.
  ///
  /// In en, this message translates to:
  /// **'Processing item {current} of {total}'**
  String processingItem(int current, int total);

  /// No description provided for @transferSpeed.
  ///
  /// In en, this message translates to:
  /// **'Transfer Speed'**
  String get transferSpeed;

  /// No description provided for @estimatedTime.
  ///
  /// In en, this message translates to:
  /// **'Est. Time'**
  String get estimatedTime;

  /// No description provided for @dataProcessed.
  ///
  /// In en, this message translates to:
  /// **'Data Processed'**
  String get dataProcessed;

  /// No description provided for @cancelOperation.
  ///
  /// In en, this message translates to:
  /// **'Cancel Operation'**
  String get cancelOperation;

  /// No description provided for @pastedItemsSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Pasted items successfully'**
  String get pastedItemsSuccessfully;

  /// No description provided for @calculatingSizes.
  ///
  /// In en, this message translates to:
  /// **'Calculating sizes...'**
  String get calculatingSizes;

  /// No description provided for @itemsSelected.
  ///
  /// In en, this message translates to:
  /// **'Items Selected'**
  String get itemsSelected;

  /// No description provided for @totalSize.
  ///
  /// In en, this message translates to:
  /// **'Total Size'**
  String get totalSize;

  /// No description provided for @selectedPaths.
  ///
  /// In en, this message translates to:
  /// **'Selected Paths:'**
  String get selectedPaths;

  /// No description provided for @copiedLabelToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied {label} to clipboard'**
  String copiedLabelToClipboard(String label);

  /// No description provided for @copySelected.
  ///
  /// In en, this message translates to:
  /// **'Copy Selected'**
  String get copySelected;

  /// No description provided for @cutSelected.
  ///
  /// In en, this message translates to:
  /// **'Cut Selected'**
  String get cutSelected;

  /// No description provided for @archiveCompress.
  ///
  /// In en, this message translates to:
  /// **'Archive (Compress)'**
  String get archiveCompress;

  /// No description provided for @propertiesAndInfo.
  ///
  /// In en, this message translates to:
  /// **'Properties & Info'**
  String get propertiesAndInfo;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
