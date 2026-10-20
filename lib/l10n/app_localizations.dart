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
  /// **'No files available to share.'**
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

  /// No description provided for @extractingBundle.
  ///
  /// In en, this message translates to:
  /// **'Extracting package bundle for installation...'**
  String get extractingBundle;

  /// No description provided for @noInstallableApk.
  ///
  /// In en, this message translates to:
  /// **'No installable APK found in package bundle'**
  String get noInstallableApk;

  /// No description provided for @failedToTriggerInstaller.
  ///
  /// In en, this message translates to:
  /// **'Failed to trigger split APK installer'**
  String get failedToTriggerInstaller;

  /// No description provided for @failedToExtractBundle.
  ///
  /// In en, this message translates to:
  /// **'Failed to extract package bundle: {error}'**
  String failedToExtractBundle(String error);

  /// No description provided for @settingsBackedUp.
  ///
  /// In en, this message translates to:
  /// **'Settings backed up to NFile/Backups/Settings/nfile_settings_backup.json'**
  String get settingsBackedUp;

  /// No description provided for @failedToBackupSettings.
  ///
  /// In en, this message translates to:
  /// **'Failed to backup settings: {error}'**
  String failedToBackupSettings(String error);

  /// No description provided for @settingsRestored.
  ///
  /// In en, this message translates to:
  /// **'Settings restored successfully!'**
  String get settingsRestored;

  /// No description provided for @failedToRestoreSettings.
  ///
  /// In en, this message translates to:
  /// **'Failed to restore settings: {error}'**
  String failedToRestoreSettings(String error);

  /// No description provided for @backupAndRestore.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get backupAndRestore;

  /// No description provided for @backupSettings.
  ///
  /// In en, this message translates to:
  /// **'Backup Settings'**
  String get backupSettings;

  /// No description provided for @backupSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Save all your current settings to NFile/Backups/Settings/'**
  String get backupSettingsHint;

  /// No description provided for @restoreSettings.
  ///
  /// In en, this message translates to:
  /// **'Restore Settings'**
  String get restoreSettings;

  /// No description provided for @restoreSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Select and restore settings from a JSON backup file'**
  String get restoreSettingsHint;

  /// No description provided for @selectValidBackupFile.
  ///
  /// In en, this message translates to:
  /// **'Please select a valid .json settings backup file'**
  String get selectValidBackupFile;

  /// No description provided for @settingsCategories.
  ///
  /// In en, this message translates to:
  /// **'Settings Categories'**
  String get settingsCategories;

  /// No description provided for @generalAndBehavior.
  ///
  /// In en, this message translates to:
  /// **'General & Behavior'**
  String get generalAndBehavior;

  /// No description provided for @generalAndBehaviorHint.
  ///
  /// In en, this message translates to:
  /// **'Default screen, navigation controls, and shortcuts'**
  String get generalAndBehaviorHint;

  /// No description provided for @appearanceAndThemes.
  ///
  /// In en, this message translates to:
  /// **'Appearance & Themes'**
  String get appearanceAndThemes;

  /// No description provided for @appearanceAndThemesHint.
  ///
  /// In en, this message translates to:
  /// **'Themes, app icons, folder styles, and typography'**
  String get appearanceAndThemesHint;

  /// No description provided for @fileExplorerOptions.
  ///
  /// In en, this message translates to:
  /// **'File Explorer Options'**
  String get fileExplorerOptions;

  /// No description provided for @fileExplorerOptionsHint.
  ///
  /// In en, this message translates to:
  /// **'Address bar, hidden files, tabs, and drag & drop'**
  String get fileExplorerOptionsHint;

  /// No description provided for @listAndLayoutStyling.
  ///
  /// In en, this message translates to:
  /// **'List & Layout Styling'**
  String get listAndLayoutStyling;

  /// No description provided for @listAndLayoutStylingHint.
  ///
  /// In en, this message translates to:
  /// **'Folder sizes, counts, and time/date formats'**
  String get listAndLayoutStylingHint;

  /// No description provided for @mediaPreferences.
  ///
  /// In en, this message translates to:
  /// **'Media Preferences'**
  String get mediaPreferences;

  /// No description provided for @mediaPreferencesHint.
  ///
  /// In en, this message translates to:
  /// **'Default album view and thumbnail previews'**
  String get mediaPreferencesHint;

  /// No description provided for @fileActionsAndViewers.
  ///
  /// In en, this message translates to:
  /// **'File Actions & Viewers'**
  String get fileActionsAndViewers;

  /// No description provided for @fileActionsAndViewersHint.
  ///
  /// In en, this message translates to:
  /// **'Open actions and default viewers configuration'**
  String get fileActionsAndViewersHint;

  /// No description provided for @recycleBinTrash.
  ///
  /// In en, this message translates to:
  /// **'Recycle Bin (Trash)'**
  String get recycleBinTrash;

  /// No description provided for @recycleBinTrashHint.
  ///
  /// In en, this message translates to:
  /// **'Recycle bin toggles and auto-delete duration'**
  String get recycleBinTrashHint;

  /// No description provided for @noSettingsFound.
  ///
  /// In en, this message translates to:
  /// **'No settings found'**
  String get noSettingsFound;

  /// No description provided for @tryAnotherKeyword.
  ///
  /// In en, this message translates to:
  /// **'Try searching for another keyword'**
  String get tryAnotherKeyword;

  /// No description provided for @defaultToBrowseScreen.
  ///
  /// In en, this message translates to:
  /// **'Default to Browse Screen'**
  String get defaultToBrowseScreen;

  /// No description provided for @defaultToBrowseScreenHint.
  ///
  /// In en, this message translates to:
  /// **'Directly launch into the Browse storage explorer on app start'**
  String get defaultToBrowseScreenHint;

  /// No description provided for @rememberLastFolder.
  ///
  /// In en, this message translates to:
  /// **'Remember Last Opened Folder'**
  String get rememberLastFolder;

  /// No description provided for @rememberLastFolderHint.
  ///
  /// In en, this message translates to:
  /// **'Open the last folder you browsed when launching the app'**
  String get rememberLastFolderHint;

  /// No description provided for @showHomeBrowseBottomBar.
  ///
  /// In en, this message translates to:
  /// **'Show Home & Browse Bottom Bar'**
  String get showHomeBrowseBottomBar;

  /// No description provided for @showHomeBrowseBottomBarHint.
  ///
  /// In en, this message translates to:
  /// **'Toggle bottom navigation bar visibility on the Home screen'**
  String get showHomeBrowseBottomBarHint;

  /// No description provided for @hideBottomNavLabels.
  ///
  /// In en, this message translates to:
  /// **'Hide Bottom Navigation Labels'**
  String get hideBottomNavLabels;

  /// No description provided for @hideBottomNavLabelsHint.
  ///
  /// In en, this message translates to:
  /// **'Hide text labels of the bottom bar (Home/Browse) for a cleaner and compact look'**
  String get hideBottomNavLabelsHint;

  /// No description provided for @hideAndroidNavBar.
  ///
  /// In en, this message translates to:
  /// **'Hide Android Navigation Bar'**
  String get hideAndroidNavBar;

  /// No description provided for @hideAndroidNavBarHint.
  ///
  /// In en, this message translates to:
  /// **'Hide bottom navigation bar to maximize screen real estate (swiping up displays it)'**
  String get hideAndroidNavBarHint;

  /// No description provided for @preventLeftBackGesture.
  ///
  /// In en, this message translates to:
  /// **'Prevent Left Back Gesture for Drawer'**
  String get preventLeftBackGesture;

  /// No description provided for @preventLeftBackGestureHint.
  ///
  /// In en, this message translates to:
  /// **'Excludes the left edge of the screen from Android system back gestures, making it easier to swipe open the drawer. You can still swipe from the right edge to go back.'**
  String get preventLeftBackGestureHint;

  /// No description provided for @appExitBehavior.
  ///
  /// In en, this message translates to:
  /// **'App Exit Behavior'**
  String get appExitBehavior;

  /// No description provided for @showBottomNavBar.
  ///
  /// In en, this message translates to:
  /// **'Show Bottom Navigation Bar'**
  String get showBottomNavBar;

  /// No description provided for @showBottomNavBarHint.
  ///
  /// In en, this message translates to:
  /// **'Enable bottom action bar on Browse screen'**
  String get showBottomNavBarHint;

  /// No description provided for @hideActionBarLabels.
  ///
  /// In en, this message translates to:
  /// **'Hide Action Bar Text Labels'**
  String get hideActionBarLabels;

  /// No description provided for @hideActionBarLabelsHint.
  ///
  /// In en, this message translates to:
  /// **'Show only icons in selection action bar at bottom of Browse & Media screens'**
  String get hideActionBarLabelsHint;

  /// No description provided for @customizeShortcutsHint.
  ///
  /// In en, this message translates to:
  /// **'Reorder and toggle visibility of quick category items'**
  String get customizeShortcutsHint;

  /// No description provided for @showRecentFiles.
  ///
  /// In en, this message translates to:
  /// **'Show Recent Files'**
  String get showRecentFiles;

  /// No description provided for @showRecentFilesHint.
  ///
  /// In en, this message translates to:
  /// **'Display the list of recently accessed files on the Home screen'**
  String get showRecentFilesHint;

  /// No description provided for @accentColorDynamicTheme.
  ///
  /// In en, this message translates to:
  /// **'Accent Color / Dynamic Theme'**
  String get accentColorDynamicTheme;

  /// No description provided for @folderIconStyle.
  ///
  /// In en, this message translates to:
  /// **'Folder Icon Style'**
  String get folderIconStyle;

  /// No description provided for @drawerButtonStyle.
  ///
  /// In en, this message translates to:
  /// **'App Drawer Button Style'**
  String get drawerButtonStyle;

  /// No description provided for @amoledBlackMode.
  ///
  /// In en, this message translates to:
  /// **'AMOLED Black Mode'**
  String get amoledBlackMode;

  /// No description provided for @amoledBlackModeHint.
  ///
  /// In en, this message translates to:
  /// **'Use pitch black background in Dark Mode for AMOLED screens'**
  String get amoledBlackModeHint;

  /// No description provided for @appIcon.
  ///
  /// In en, this message translates to:
  /// **'App Icon'**
  String get appIcon;

  /// No description provided for @appTypographyFontFamily.
  ///
  /// In en, this message translates to:
  /// **'App Typography / Font Family'**
  String get appTypographyFontFamily;

  /// No description provided for @useExpressiveIcons.
  ///
  /// In en, this message translates to:
  /// **'Use Expressive Material Icons'**
  String get useExpressiveIcons;

  /// No description provided for @useExpressiveIconsHint.
  ///
  /// In en, this message translates to:
  /// **'Replace custom Broken icons with standard Material Design icons'**
  String get useExpressiveIconsHint;

  /// No description provided for @showAddressBar.
  ///
  /// In en, this message translates to:
  /// **'Show Address Bar'**
  String get showAddressBar;

  /// No description provided for @showAddressBarHint.
  ///
  /// In en, this message translates to:
  /// **'Display an editable Windows-Explorer-style address bar at the top of file list'**
  String get showAddressBarHint;

  /// No description provided for @showFloatingAddButton.
  ///
  /// In en, this message translates to:
  /// **'Show Floating \'+\' Button'**
  String get showFloatingAddButton;

  /// No description provided for @showFloatingAddButtonHint.
  ///
  /// In en, this message translates to:
  /// **'Enable quick creation (+) button at bottom of Browse screen'**
  String get showFloatingAddButtonHint;

  /// No description provided for @showHiddenFilesHint.
  ///
  /// In en, this message translates to:
  /// **'Display system files and folders starting with a dot (.)'**
  String get showHiddenFilesHint;

  /// No description provided for @highlightExitedFolder.
  ///
  /// In en, this message translates to:
  /// **'Highlight Exited Folder'**
  String get highlightExitedFolder;

  /// No description provided for @highlightExitedFolderHint.
  ///
  /// In en, this message translates to:
  /// **'Briefly flash and scroll to the folder you just exited when going back'**
  String get highlightExitedFolderHint;

  /// No description provided for @enableMultipleTabs.
  ///
  /// In en, this message translates to:
  /// **'Enable Multiple Tabs'**
  String get enableMultipleTabs;

  /// No description provided for @enableMultipleTabsHint.
  ///
  /// In en, this message translates to:
  /// **'Allow opening multiple folders in separate tabs for quick navigation'**
  String get enableMultipleTabsHint;

  /// No description provided for @enableSplitScreen.
  ///
  /// In en, this message translates to:
  /// **'Enable Split Screen'**
  String get enableSplitScreen;

  /// No description provided for @enableSplitScreenHint.
  ///
  /// In en, this message translates to:
  /// **'Browse two directories side by side and transfer files easily'**
  String get enableSplitScreenHint;

  /// No description provided for @enableDragAndDrop.
  ///
  /// In en, this message translates to:
  /// **'Enable Drag & Drop'**
  String get enableDragAndDrop;

  /// No description provided for @enableDragAndDropHint.
  ///
  /// In en, this message translates to:
  /// **'Long press and drag folders or files to move them into other folders'**
  String get enableDragAndDropHint;

  /// No description provided for @confirmDragAndDrop.
  ///
  /// In en, this message translates to:
  /// **'Confirm Drag & Drop Actions'**
  String get confirmDragAndDrop;

  /// No description provided for @confirmDragAndDropHint.
  ///
  /// In en, this message translates to:
  /// **'Show options popup (Copy, Move, Archive) when dropping files'**
  String get confirmDragAndDropHint;

  /// No description provided for @showCountHeader.
  ///
  /// In en, this message translates to:
  /// **'Show Folder & File Count Header'**
  String get showCountHeader;

  /// No description provided for @showCountHeaderHint.
  ///
  /// In en, this message translates to:
  /// **'Display total folders and files count under storage title bar'**
  String get showCountHeaderHint;

  /// No description provided for @showFolderContentCount.
  ///
  /// In en, this message translates to:
  /// **'Show Folder Content Count'**
  String get showFolderContentCount;

  /// No description provided for @showFolderContentCountHint.
  ///
  /// In en, this message translates to:
  /// **'Calculate and display total files and folders inside directory listings'**
  String get showFolderContentCountHint;

  /// No description provided for @showFolderSize.
  ///
  /// In en, this message translates to:
  /// **'Show Folder Size'**
  String get showFolderSize;

  /// No description provided for @showFolderSizeHint.
  ///
  /// In en, this message translates to:
  /// **'Calculate and display total size of all files inside directories (can affect listing performance)'**
  String get showFolderSizeHint;

  /// No description provided for @use24HourTime.
  ///
  /// In en, this message translates to:
  /// **'Use 24-Hour Time Format'**
  String get use24HourTime;

  /// No description provided for @use24HourTimeHint.
  ///
  /// In en, this message translates to:
  /// **'Toggle between 12-hour (AM/PM) and 24-hour time formatting across lists'**
  String get use24HourTimeHint;

  /// No description provided for @hideTimeAndDate.
  ///
  /// In en, this message translates to:
  /// **'Hide Time & Date from Lists'**
  String get hideTimeAndDate;

  /// No description provided for @hideTimeAndDateHint.
  ///
  /// In en, this message translates to:
  /// **'Completely hide modification dates and times under files and folders'**
  String get hideTimeAndDateHint;

  /// No description provided for @adaptiveMultiLineNames.
  ///
  /// In en, this message translates to:
  /// **'Adaptive Multi-line Filenames'**
  String get adaptiveMultiLineNames;

  /// No description provided for @adaptiveMultiLineNamesHint.
  ///
  /// In en, this message translates to:
  /// **'Allow filenames to wrap 3 lines instead of truncating'**
  String get adaptiveMultiLineNamesHint;

  /// No description provided for @hideThreeDotButtons.
  ///
  /// In en, this message translates to:
  /// **'Hide 3-Dot Action Buttons'**
  String get hideThreeDotButtons;

  /// No description provided for @hideThreeDotButtonsHint.
  ///
  /// In en, this message translates to:
  /// **'Hide the three-dot option menu button next to folders and files'**
  String get hideThreeDotButtonsHint;

  /// No description provided for @threeDotTrailingInfo.
  ///
  /// In en, this message translates to:
  /// **'3-Dot Disabled Trailing Info'**
  String get threeDotTrailingInfo;

  /// No description provided for @defaultAlbumView.
  ///
  /// In en, this message translates to:
  /// **'Default Album Preferred View'**
  String get defaultAlbumView;

  /// No description provided for @defaultAlbumViewHint.
  ///
  /// In en, this message translates to:
  /// **'Open Images/Videos quick categories directly in Folders (Albums) preferred view'**
  String get defaultAlbumViewHint;

  /// No description provided for @showMediaPreviews.
  ///
  /// In en, this message translates to:
  /// **'Show Media Previews'**
  String get showMediaPreviews;

  /// No description provided for @showMediaPreviewsHint.
  ///
  /// In en, this message translates to:
  /// **'Display actual image and video thumbnails instead of generic file icons'**
  String get showMediaPreviewsHint;

  /// No description provided for @skipOpenWithDialog.
  ///
  /// In en, this message translates to:
  /// **'Skip \"Open With\" Dialog'**
  String get skipOpenWithDialog;

  /// No description provided for @skipOpenWithDialogHint.
  ///
  /// In en, this message translates to:
  /// **'Bypass the application choice dialog and immediately open files with default viewers'**
  String get skipOpenWithDialogHint;

  /// No description provided for @resetDefaultViewers.
  ///
  /// In en, this message translates to:
  /// **'Reset Default File Viewers'**
  String get resetDefaultViewers;

  /// No description provided for @resetDefaultViewersHint.
  ///
  /// In en, this message translates to:
  /// **'Clear all remembered \"Open With\" associations for file viewers'**
  String get resetDefaultViewersHint;

  /// No description provided for @viewersReset.
  ///
  /// In en, this message translates to:
  /// **'All default viewer choices have been reset'**
  String get viewersReset;

  /// No description provided for @enableRecycleBin.
  ///
  /// In en, this message translates to:
  /// **'Enable Recycle Bin'**
  String get enableRecycleBin;

  /// No description provided for @enableRecycleBinHint.
  ///
  /// In en, this message translates to:
  /// **'Move deleted files and folders to a hidden Recycle Bin instead of deleting permanently'**
  String get enableRecycleBinHint;

  /// No description provided for @autoDeleteDuration.
  ///
  /// In en, this message translates to:
  /// **'Auto-Delete Trash Duration'**
  String get autoDeleteDuration;

  /// No description provided for @autoDeleteDurationHint.
  ///
  /// In en, this message translates to:
  /// **'Items in the Recycle Bin will be permanently deleted after this duration.'**
  String get autoDeleteDurationHint;

  /// No description provided for @chooseTrailingInfoStyle.
  ///
  /// In en, this message translates to:
  /// **'Choose Trailing Info Style'**
  String get chooseTrailingInfoStyle;

  /// No description provided for @chooseTrailingInfoStyleHint.
  ///
  /// In en, this message translates to:
  /// **'Choose what is displayed on the right side of files and folders when the 3-dot action buttons are hidden.'**
  String get chooseTrailingInfoStyleHint;

  /// No description provided for @chooseExitBehavior.
  ///
  /// In en, this message translates to:
  /// **'Choose Exit Behavior'**
  String get chooseExitBehavior;

  /// No description provided for @chooseAccentTheme.
  ///
  /// In en, this message translates to:
  /// **'Choose Accent Theme'**
  String get chooseAccentTheme;

  /// No description provided for @chooseFolderIconStyle.
  ///
  /// In en, this message translates to:
  /// **'Choose Folder Icon Style'**
  String get chooseFolderIconStyle;

  /// No description provided for @chooseDrawerButtonStyle.
  ///
  /// In en, this message translates to:
  /// **'Choose Drawer Button Style'**
  String get chooseDrawerButtonStyle;

  /// No description provided for @appLauncherIcon.
  ///
  /// In en, this message translates to:
  /// **'App Launcher Icon'**
  String get appLauncherIcon;

  /// No description provided for @appLauncherIconHint.
  ///
  /// In en, this message translates to:
  /// **'Choose a custom logo for the application launcher icon. Note that some launchers may take a few seconds to update.'**
  String get appLauncherIconHint;

  /// No description provided for @logo1.
  ///
  /// In en, this message translates to:
  /// **'Logo 1'**
  String get logo1;

  /// No description provided for @logo2.
  ///
  /// In en, this message translates to:
  /// **'Logo 2'**
  String get logo2;

  /// No description provided for @logo3.
  ///
  /// In en, this message translates to:
  /// **'Logo 3'**
  String get logo3;

  /// No description provided for @logo4.
  ///
  /// In en, this message translates to:
  /// **'Logo 4'**
  String get logo4;

  /// No description provided for @appIconSwitched.
  ///
  /// In en, this message translates to:
  /// **'App icon switched to {title} successfully!'**
  String appIconSwitched(String title);

  /// No description provided for @appTypography.
  ///
  /// In en, this message translates to:
  /// **'App Typography'**
  String get appTypography;

  /// No description provided for @appTypographyHint.
  ///
  /// In en, this message translates to:
  /// **'Select a beautiful typeface to customize NFile\\\'s overall visual theme'**
  String get appTypographyHint;

  /// No description provided for @customFontApplied.
  ///
  /// In en, this message translates to:
  /// **'Custom font \"{name}\" applied successfully!'**
  String customFontApplied(String name);

  /// No description provided for @failedToLoadFont.
  ///
  /// In en, this message translates to:
  /// **'Failed to load the selected font file.'**
  String get failedToLoadFont;

  /// No description provided for @invalidFileType.
  ///
  /// In en, this message translates to:
  /// **'Invalid File Type'**
  String get invalidFileType;

  /// No description provided for @invalidFontFileHint.
  ///
  /// In en, this message translates to:
  /// **'Please select a valid OpenType (.otf) or TrueType (.ttf) font file.'**
  String get invalidFontFileHint;

  /// No description provided for @removeCustomFont.
  ///
  /// In en, this message translates to:
  /// **'Remove Custom Font'**
  String get removeCustomFont;

  /// No description provided for @customFontRemoved.
  ///
  /// In en, this message translates to:
  /// **'Custom font removed.'**
  String get customFontRemoved;

  /// No description provided for @accentMaterialYou.
  ///
  /// In en, this message translates to:
  /// **'Material You (Dynamic Wallpaper Colors)'**
  String get accentMaterialYou;

  /// No description provided for @accentVibrantOrange.
  ///
  /// In en, this message translates to:
  /// **'Vibrant Orange'**
  String get accentVibrantOrange;

  /// No description provided for @accentRoyalPurple.
  ///
  /// In en, this message translates to:
  /// **'Royal Purple'**
  String get accentRoyalPurple;

  /// No description provided for @accentEmeraldGreen.
  ///
  /// In en, this message translates to:
  /// **'Emerald Green'**
  String get accentEmeraldGreen;

  /// No description provided for @accentCrimsonRed.
  ///
  /// In en, this message translates to:
  /// **'Crimson Red'**
  String get accentCrimsonRed;

  /// No description provided for @accentAmberGold.
  ///
  /// In en, this message translates to:
  /// **'Amber Gold'**
  String get accentAmberGold;

  /// No description provided for @accentCyberpunkPink.
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk Pink'**
  String get accentCyberpunkPink;

  /// No description provided for @accentSapphireBlue.
  ///
  /// In en, this message translates to:
  /// **'Sapphire Blue'**
  String get accentSapphireBlue;

  /// No description provided for @accentForestGreen.
  ///
  /// In en, this message translates to:
  /// **'Forest Green'**
  String get accentForestGreen;

  /// No description provided for @accentSunsetPeach.
  ///
  /// In en, this message translates to:
  /// **'Sunset Peach'**
  String get accentSunsetPeach;

  /// No description provided for @folderIconClassicSolid.
  ///
  /// In en, this message translates to:
  /// **'Classic Solid (Material)'**
  String get folderIconClassicSolid;

  /// No description provided for @folderIconModernRounded.
  ///
  /// In en, this message translates to:
  /// **'Modern Rounded (Material)'**
  String get folderIconModernRounded;

  /// No description provided for @folderIconStarred.
  ///
  /// In en, this message translates to:
  /// **'Starred Special (Material)'**
  String get folderIconStarred;

  /// No description provided for @folderIconSnippet.
  ///
  /// In en, this message translates to:
  /// **'Snippet Document (Material)'**
  String get folderIconSnippet;

  /// No description provided for @folderIconMinimalOutlined.
  ///
  /// In en, this message translates to:
  /// **'Minimal Outlined (Material)'**
  String get folderIconMinimalOutlined;

  /// No description provided for @drawerStyleCategoryGrid.
  ///
  /// In en, this message translates to:
  /// **'Category Grid / Vuesax Grid'**
  String get drawerStyleCategoryGrid;

  /// No description provided for @drawerStyleHamburger.
  ///
  /// In en, this message translates to:
  /// **'Hamburger / Classic Menu'**
  String get drawerStyleHamburger;

  /// No description provided for @defaultLogo.
  ///
  /// In en, this message translates to:
  /// **'Default Logo'**
  String get defaultLogo;

  /// No description provided for @fontDotMatrix.
  ///
  /// In en, this message translates to:
  /// **'Dot-Matrix & Sans'**
  String get fontDotMatrix;

  /// No description provided for @fontOutfit.
  ///
  /// In en, this message translates to:
  /// **'Outfit Modern Sans'**
  String get fontOutfit;

  /// No description provided for @fontJetBrains.
  ///
  /// In en, this message translates to:
  /// **'JetBrains Tech Mono'**
  String get fontJetBrains;

  /// No description provided for @fontMontserrat.
  ///
  /// In en, this message translates to:
  /// **'Montserrat Urban Sans'**
  String get fontMontserrat;

  /// No description provided for @fontCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom Imported Font'**
  String get fontCustom;

  /// No description provided for @trailingInfoDateTime.
  ///
  /// In en, this message translates to:
  /// **'Date & Time'**
  String get trailingInfoDateTime;

  /// No description provided for @trailingInfoSizeCount.
  ///
  /// In en, this message translates to:
  /// **'File Size / Item Count'**
  String get trailingInfoSizeCount;

  /// No description provided for @backupAndRestoreHint.
  ///
  /// In en, this message translates to:
  /// **'Backup your settings to a JSON file or restore them'**
  String get backupAndRestoreHint;

  /// No description provided for @compressingFiles.
  ///
  /// In en, this message translates to:
  /// **'Compressing Files'**
  String get compressingFiles;

  /// No description provided for @extractingArchive.
  ///
  /// In en, this message translates to:
  /// **'Extracting Archive'**
  String get extractingArchive;

  /// No description provided for @errorReadingSharedFile.
  ///
  /// In en, this message translates to:
  /// **'Error reading shared file: {error}'**
  String errorReadingSharedFile(String error);

  /// No description provided for @extractedTo.
  ///
  /// In en, this message translates to:
  /// **'Extracted {item} to {folder}'**
  String extractedTo(String item, String folder);

  /// No description provided for @itemsCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item copied to clipboard ✓} other{{count} items copied to clipboard ✓}}'**
  String itemsCopiedToClipboard(int count);

  /// No description provided for @deleteSelectedItems.
  ///
  /// In en, this message translates to:
  /// **'Delete Selected Items'**
  String get deleteSelectedItems;

  /// No description provided for @deleteItemsFromArchiveQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete precisely these {count} item(s) from the archive? This cannot be undone.'**
  String deleteItemsFromArchiveQuestion(int count);

  /// No description provided for @itemsDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Items deleted successfully ✓'**
  String get itemsDeletedSuccessfully;

  /// No description provided for @failedToDeleteItems.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete items'**
  String get failedToDeleteItems;

  /// No description provided for @addedToArchive.
  ///
  /// In en, this message translates to:
  /// **'Successfully added {count} item(s) into archive ✓'**
  String addedToArchive(int count);

  /// No description provided for @pastedIntoArchive.
  ///
  /// In en, this message translates to:
  /// **'Pasted {count} item(s) into archive ✓'**
  String pastedIntoArchive(int count);

  /// No description provided for @selectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Selected} other{{count} Selected}}'**
  String selectedCount(int count);

  /// No description provided for @couldNotReadArchive.
  ///
  /// In en, this message translates to:
  /// **'Could not read archive'**
  String get couldNotReadArchive;

  /// No description provided for @extractToCurrentFolder.
  ///
  /// In en, this message translates to:
  /// **'Extract to Current Folder'**
  String get extractToCurrentFolder;

  /// No description provided for @pasteHereCount.
  ///
  /// In en, this message translates to:
  /// **'Paste Here ({count})'**
  String pasteHereCount(int count);

  /// No description provided for @addFile.
  ///
  /// In en, this message translates to:
  /// **'Add File'**
  String get addFile;

  /// No description provided for @losslessAudio.
  ///
  /// In en, this message translates to:
  /// **'Lossless Audio'**
  String get losslessAudio;

  /// No description provided for @soundFx.
  ///
  /// In en, this message translates to:
  /// **'Sound FX'**
  String get soundFx;

  /// No description provided for @sleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Sleep Timer'**
  String get sleepTimer;

  /// No description provided for @playingQueue.
  ///
  /// In en, this message translates to:
  /// **'Playing Queue'**
  String get playingQueue;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 minute} other{{count} minutes}}'**
  String minutes(int count);

  /// No description provided for @sleepTimerSet.
  ///
  /// In en, this message translates to:
  /// **'Sleep timer set for {count} minutes.'**
  String sleepTimerSet(int count);

  /// No description provided for @soundAndSpeedFx.
  ///
  /// In en, this message translates to:
  /// **'Sound & Speed FX'**
  String get soundAndSpeedFx;

  /// No description provided for @playbackSpeed.
  ///
  /// In en, this message translates to:
  /// **'Playback Speed'**
  String get playbackSpeed;

  /// No description provided for @pitchAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Pitch Adjustment'**
  String get pitchAdjustment;

  /// No description provided for @resetToDefault.
  ///
  /// In en, this message translates to:
  /// **'Reset to Default'**
  String get resetToDefault;

  /// No description provided for @backgroundPlaybackStopped.
  ///
  /// In en, this message translates to:
  /// **'Background playback stopped'**
  String get backgroundPlaybackStopped;

  /// No description provided for @backgroundPlaybackEnabled.
  ///
  /// In en, this message translates to:
  /// **'Background playback enabled'**
  String get backgroundPlaybackEnabled;

  /// No description provided for @viewSynchronizedLyrics.
  ///
  /// In en, this message translates to:
  /// **'View Synchronized Lyrics'**
  String get viewSynchronizedLyrics;

  /// No description provided for @soundFxAndEqualizer.
  ///
  /// In en, this message translates to:
  /// **'Sound FX & Equalizer'**
  String get soundFxAndEqualizer;

  /// No description provided for @setSleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Set Sleep Timer'**
  String get setSleepTimer;

  /// No description provided for @audioFileInfo.
  ///
  /// In en, this message translates to:
  /// **'Audio File Info'**
  String get audioFileInfo;

  /// No description provided for @playingQueueCount.
  ///
  /// In en, this message translates to:
  /// **'Playing Queue ({count})'**
  String playingQueueCount(int count);

  /// No description provided for @lyricsLoaded.
  ///
  /// In en, this message translates to:
  /// **'Lyrics loaded successfully'**
  String get lyricsLoaded;

  /// No description provided for @noSynchronizedLyrics.
  ///
  /// In en, this message translates to:
  /// **'No Synchronized Lyrics Found'**
  String get noSynchronizedLyrics;

  /// No description provided for @noSynchronizedLyricsHint.
  ///
  /// In en, this message translates to:
  /// **'Keep a .lrc file with the exact same name next to your song, or select it manually below.'**
  String get noSynchronizedLyricsHint;

  /// No description provided for @loadLrcFile.
  ///
  /// In en, this message translates to:
  /// **'Load LRC File'**
  String get loadLrcFile;

  /// No description provided for @tapLineToSeek.
  ///
  /// In en, this message translates to:
  /// **'Tap a line to seek playback'**
  String get tapLineToSeek;

  /// No description provided for @noDataToExport.
  ///
  /// In en, this message translates to:
  /// **'No data to export.'**
  String get noDataToExport;

  /// No description provided for @exportedTo.
  ///
  /// In en, this message translates to:
  /// **'Successfully exported to {file}'**
  String exportedTo(String file);

  /// No description provided for @exportFailed.
  ///
  /// In en, this message translates to:
  /// **'Export failed: {error}'**
  String exportFailed(String error);

  /// No description provided for @sqliteReader.
  ///
  /// In en, this message translates to:
  /// **'SQLite Database Reader'**
  String get sqliteReader;

  /// No description provided for @failedToOpenDatabase.
  ///
  /// In en, this message translates to:
  /// **'Failed to open database'**
  String get failedToOpenDatabase;

  /// No description provided for @noTablesFound.
  ///
  /// In en, this message translates to:
  /// **'No tables found in this database.'**
  String get noTablesFound;

  /// No description provided for @exportTableToCsv.
  ///
  /// In en, this message translates to:
  /// **'Export Table to CSV'**
  String get exportTableToCsv;

  /// No description provided for @searchRows.
  ///
  /// In en, this message translates to:
  /// **'Search rows...'**
  String get searchRows;

  /// No description provided for @noRowsFound.
  ///
  /// In en, this message translates to:
  /// **'No rows found'**
  String get noRowsFound;

  /// No description provided for @showingRange.
  ///
  /// In en, this message translates to:
  /// **'Showing {from} - {to}'**
  String showingRange(int from, int to);

  /// No description provided for @noSchemaLoaded.
  ///
  /// In en, this message translates to:
  /// **'No schema details loaded.'**
  String get noSchemaLoaded;

  /// No description provided for @schemaType.
  ///
  /// In en, this message translates to:
  /// **'Type: {type}'**
  String schemaType(String type);

  /// No description provided for @schemaDefault.
  ///
  /// In en, this message translates to:
  /// **'Default: {value}'**
  String schemaDefault(String value);

  /// No description provided for @sqlEditor.
  ///
  /// In en, this message translates to:
  /// **'SQL Editor'**
  String get sqlEditor;

  /// No description provided for @selectTemplate.
  ///
  /// In en, this message translates to:
  /// **'SELECT template'**
  String get selectTemplate;

  /// No description provided for @enterSelectQuery.
  ///
  /// In en, this message translates to:
  /// **'Enter SELECT query here...'**
  String get enterSelectQuery;

  /// No description provided for @exportResultsToCsv.
  ///
  /// In en, this message translates to:
  /// **'Export Results to CSV'**
  String get exportResultsToCsv;

  /// No description provided for @runQuery.
  ///
  /// In en, this message translates to:
  /// **'Run Query'**
  String get runQuery;

  /// No description provided for @queryReturnedRows.
  ///
  /// In en, this message translates to:
  /// **'Query returned {count} rows'**
  String queryReturnedRows(int count);

  /// No description provided for @errorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading: {error}'**
  String errorLoading(String error);

  /// No description provided for @savedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Saved successfully ✓'**
  String get savedSuccessfully;

  /// No description provided for @errorSaving.
  ///
  /// In en, this message translates to:
  /// **'Error saving: {error}'**
  String errorSaving(String error);

  /// No description provided for @pdfDisplaySettings.
  ///
  /// In en, this message translates to:
  /// **'PDF Display Settings'**
  String get pdfDisplaySettings;

  /// No description provided for @pdfDisplaySettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Optimize rendering performance for large, design-heavy, or scanned documents.'**
  String get pdfDisplaySettingsHint;

  /// No description provided for @quickPerformancePresets.
  ///
  /// In en, this message translates to:
  /// **'Quick Performance Presets'**
  String get quickPerformancePresets;

  /// No description provided for @standardMode.
  ///
  /// In en, this message translates to:
  /// **'Standard Mode'**
  String get standardMode;

  /// No description provided for @standardModeHint.
  ///
  /// In en, this message translates to:
  /// **'Best for text documents'**
  String get standardModeHint;

  /// No description provided for @lagFreeMode.
  ///
  /// In en, this message translates to:
  /// **'Lag-Free Mode'**
  String get lagFreeMode;

  /// No description provided for @lagFreeModeHint.
  ///
  /// In en, this message translates to:
  /// **'Best for brochures & photos'**
  String get lagFreeModeHint;

  /// No description provided for @detailedTuning.
  ///
  /// In en, this message translates to:
  /// **'Detailed Tuning Options'**
  String get detailedTuning;

  /// No description provided for @pageLayout.
  ///
  /// In en, this message translates to:
  /// **'Page Layout'**
  String get pageLayout;

  /// No description provided for @singlePage.
  ///
  /// In en, this message translates to:
  /// **'Single Page'**
  String get singlePage;

  /// No description provided for @scrollDirection.
  ///
  /// In en, this message translates to:
  /// **'Scroll Direction'**
  String get scrollDirection;

  /// No description provided for @enableTextSelection.
  ///
  /// In en, this message translates to:
  /// **'Enable Text Selection'**
  String get enableTextSelection;

  /// No description provided for @enableTextSelectionHint.
  ///
  /// In en, this message translates to:
  /// **'Disable to significantly boost page rendering speed and eliminate scroll stutter.'**
  String get enableTextSelectionHint;

  /// No description provided for @displaySettings.
  ///
  /// In en, this message translates to:
  /// **'Display Settings'**
  String get displaySettings;

  /// No description provided for @openWithLabel.
  ///
  /// In en, this message translates to:
  /// **'Open with'**
  String get openWithLabel;

  /// No description provided for @emptySheet.
  ///
  /// In en, this message translates to:
  /// **'Empty Sheet'**
  String get emptySheet;

  /// No description provided for @slideNumber.
  ///
  /// In en, this message translates to:
  /// **'SLIDE {number}'**
  String slideNumber(int number);

  /// No description provided for @openWithApp.
  ///
  /// In en, this message translates to:
  /// **'Open with App'**
  String get openWithApp;

  /// No description provided for @shareComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Share coming soon'**
  String get shareComingSoon;

  /// No description provided for @htmlPreview.
  ///
  /// In en, this message translates to:
  /// **'HTML Preview'**
  String get htmlPreview;

  /// No description provided for @markdownPreview.
  ///
  /// In en, this message translates to:
  /// **'Markdown Preview'**
  String get markdownPreview;

  /// No description provided for @imageIndexOfTotal.
  ///
  /// In en, this message translates to:
  /// **'{current} of {total}'**
  String imageIndexOfTotal(int current, int total);

  /// No description provided for @failedToLoadImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load image'**
  String get failedToLoadImage;

  /// No description provided for @confirmDeletion.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get confirmDeletion;

  /// No description provided for @confirmPermanentDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to permanently delete {count} selected items?'**
  String confirmPermanentDelete(int count);

  /// No description provided for @deletedItemsCount.
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted {count} items'**
  String deletedItemsCount(int count);

  /// No description provided for @pastedItemsTo.
  ///
  /// In en, this message translates to:
  /// **'Pasted {count} items to {folder}'**
  String pastedItemsTo(int count, String folder);

  /// No description provided for @noFilesToRename.
  ///
  /// In en, this message translates to:
  /// **'No physical files found to rename'**
  String get noFilesToRename;

  /// No description provided for @longPressToOpenWith.
  ///
  /// In en, this message translates to:
  /// **'Long press to Open with...'**
  String get longPressToOpenWith;

  /// No description provided for @copiedNameToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied {name} to clipboard'**
  String copiedNameToClipboard(String name);

  /// No description provided for @cutNameToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Cut {name} to clipboard'**
  String cutNameToClipboard(String name);

  /// No description provided for @permanentlyDeleteName.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete \"{name}\"?'**
  String permanentlyDeleteName(String name);

  /// No description provided for @deletedName.
  ///
  /// In en, this message translates to:
  /// **'Deleted {name}'**
  String deletedName(String name);

  /// No description provided for @fileNotShareable.
  ///
  /// In en, this message translates to:
  /// **'File not found or not shareable.'**
  String get fileNotShareable;

  /// No description provided for @sortOptions.
  ///
  /// In en, this message translates to:
  /// **'Sort Options'**
  String get sortOptions;

  /// No description provided for @sortNewestFirst.
  ///
  /// In en, this message translates to:
  /// **'Newest First'**
  String get sortNewestFirst;

  /// No description provided for @sortOldestFirst.
  ///
  /// In en, this message translates to:
  /// **'Oldest First'**
  String get sortOldestFirst;

  /// No description provided for @sortDateWise.
  ///
  /// In en, this message translates to:
  /// **'Date Wise'**
  String get sortDateWise;

  /// No description provided for @sortNewestGrouped.
  ///
  /// In en, this message translates to:
  /// **'Newest First (Grouped per month)'**
  String get sortNewestGrouped;

  /// No description provided for @sortOldestGrouped.
  ///
  /// In en, this message translates to:
  /// **'Oldest First (Grouped per month)'**
  String get sortOldestGrouped;

  /// No description provided for @sortSizeLargeFirst.
  ///
  /// In en, this message translates to:
  /// **'Size (Large First)'**
  String get sortSizeLargeFirst;

  /// No description provided for @sortSizeSmallFirst.
  ///
  /// In en, this message translates to:
  /// **'Size (Small First)'**
  String get sortSizeSmallFirst;

  /// No description provided for @noItemsOfKindFound.
  ///
  /// In en, this message translates to:
  /// **'No {kind} found'**
  String noItemsOfKindFound(String kind);

  /// No description provided for @allItems.
  ///
  /// In en, this message translates to:
  /// **'All Items'**
  String get allItems;

  /// No description provided for @countItems.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String countItems(int count);

  /// No description provided for @restoredSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Restored {count} item(s) successfully'**
  String restoredSuccessfully(int count);

  /// No description provided for @errorRestoringItems.
  ///
  /// In en, this message translates to:
  /// **'Error restoring items: {error}'**
  String errorRestoringItems(String error);

  /// No description provided for @deletePermanentlyQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete Permanently?'**
  String get deletePermanentlyQuestion;

  /// No description provided for @deletePermanentlyQuestionHint.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to permanently delete these {count} item(s)? This action cannot be undone.'**
  String deletePermanentlyQuestionHint(int count);

  /// No description provided for @permanentlyDeleted.
  ///
  /// In en, this message translates to:
  /// **'Permanently deleted {count} item(s)'**
  String permanentlyDeleted(int count);

  /// No description provided for @errorDeletingItems.
  ///
  /// In en, this message translates to:
  /// **'Error deleting items: {error}'**
  String errorDeletingItems(String error);

  /// No description provided for @emptyRecycleBinQuestion.
  ///
  /// In en, this message translates to:
  /// **'Empty Recycle Bin?'**
  String get emptyRecycleBinQuestion;

  /// No description provided for @emptyRecycleBinQuestionHint.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to permanently delete all items in the Recycle Bin? This action is irreversible.'**
  String get emptyRecycleBinQuestionHint;

  /// No description provided for @emptyBin.
  ///
  /// In en, this message translates to:
  /// **'Empty Bin'**
  String get emptyBin;

  /// No description provided for @binEmptied.
  ///
  /// In en, this message translates to:
  /// **'Recycle Bin emptied successfully'**
  String get binEmptied;

  /// No description provided for @errorEmptyingBin.
  ///
  /// In en, this message translates to:
  /// **'Error emptying bin: {error}'**
  String errorEmptyingBin(String error);

  /// No description provided for @searchDeletedFiles.
  ///
  /// In en, this message translates to:
  /// **'Search deleted files...'**
  String get searchDeletedFiles;

  /// No description provided for @emptyRecycleBinAction.
  ///
  /// In en, this message translates to:
  /// **'Empty Recycle Bin'**
  String get emptyRecycleBinAction;

  /// No description provided for @originalPath.
  ///
  /// In en, this message translates to:
  /// **'Original Path: {path}'**
  String originalPath(String path);

  /// No description provided for @deletedAtAndSize.
  ///
  /// In en, this message translates to:
  /// **'Deleted: {date} • {size}'**
  String deletedAtAndSize(String date, String size);

  /// No description provided for @deletePermanently.
  ///
  /// In en, this message translates to:
  /// **'Delete Permanently'**
  String get deletePermanently;

  /// No description provided for @recycleBinIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Recycle Bin is Empty'**
  String get recycleBinIsEmpty;

  /// No description provided for @recycleBinIsEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Items you delete when Recycle Bin is enabled will appear here. You can restore them or permanently delete them.'**
  String get recycleBinIsEmptyHint;

  /// No description provided for @errorLoadingFile.
  ///
  /// In en, this message translates to:
  /// **'Error loading file: {error}'**
  String errorLoadingFile(String error);

  /// No description provided for @fileSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'File saved successfully'**
  String get fileSavedSuccessfully;

  /// No description provided for @errorSavingFile.
  ///
  /// In en, this message translates to:
  /// **'Error saving file: {error}'**
  String errorSavingFile(String error);

  /// No description provided for @replacedOccurrences.
  ///
  /// In en, this message translates to:
  /// **'Replaced {count} occurrences'**
  String replacedOccurrences(int count);

  /// No description provided for @selectSyntax.
  ///
  /// In en, this message translates to:
  /// **'Select Syntax'**
  String get selectSyntax;

  /// No description provided for @findAndReplace.
  ///
  /// In en, this message translates to:
  /// **'Find / Replace'**
  String get findAndReplace;

  /// No description provided for @saveFile.
  ///
  /// In en, this message translates to:
  /// **'Save File'**
  String get saveFile;

  /// No description provided for @moreOptions.
  ///
  /// In en, this message translates to:
  /// **'More Options'**
  String get moreOptions;

  /// No description provided for @defaultZoom.
  ///
  /// In en, this message translates to:
  /// **'Default Zoom ({size}pt)'**
  String defaultZoom(int size);

  /// No description provided for @syntaxOf.
  ///
  /// In en, this message translates to:
  /// **'Syntax ({language})'**
  String syntaxOf(String language);

  /// No description provided for @replaceWithDots.
  ///
  /// In en, this message translates to:
  /// **'Replace with...'**
  String get replaceWithDots;

  /// No description provided for @replaceAll.
  ///
  /// In en, this message translates to:
  /// **'Replace All'**
  String get replaceAll;

  /// No description provided for @slideToUnlock.
  ///
  /// In en, this message translates to:
  /// **'Slide / Tap to Unlock'**
  String get slideToUnlock;

  /// No description provided for @lockControls.
  ///
  /// In en, this message translates to:
  /// **'Lock Controls'**
  String get lockControls;

  /// No description provided for @repeatMode.
  ///
  /// In en, this message translates to:
  /// **'Repeat Mode'**
  String get repeatMode;

  /// No description provided for @copyUrl.
  ///
  /// In en, this message translates to:
  /// **'Copy URL'**
  String get copyUrl;

  /// No description provided for @mediaPathCopied.
  ///
  /// In en, this message translates to:
  /// **'Media path copied to clipboard.'**
  String get mediaPathCopied;

  /// No description provided for @speedValue.
  ///
  /// In en, this message translates to:
  /// **'Speed {speed}x'**
  String speedValue(double speed);

  /// No description provided for @continuousLayout.
  ///
  /// In en, this message translates to:
  /// **'Continuous'**
  String get continuousLayout;

  /// No description provided for @editorLanguageAndLines.
  ///
  /// In en, this message translates to:
  /// **'{language}  {count, plural, =1{1 line} other{{count} lines}}'**
  String editorLanguageAndLines(String language, int count);

  /// No description provided for @editorModified.
  ///
  /// In en, this message translates to:
  /// **'editorModified'**
  String get editorModified;
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
