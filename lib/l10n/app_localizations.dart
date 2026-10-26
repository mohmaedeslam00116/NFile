import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

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
    Locale('fr'),
  ];

  /// The name of the application. It is the same in every language.
  ///
  /// In en, this message translates to:
  /// **'OpenFile'**
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
  /// **'OpenFile requires storage permission to manage, organize, and display your media files seamlessly.'**
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

  /// No description provided for @aboutOpenFile.
  ///
  /// In en, this message translates to:
  /// **'About NFile'**
  String get aboutOpenFile;

  /// No description provided for @appVersionWithChannel.
  ///
  /// In en, this message translates to:
  /// **'v{version} ({channel})'**
  String appVersionWithChannel(String version, String channel);

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'OpenFile is a beautiful, fluid, and open-source file manager and offline media hub built with Flutter. Designed for extreme performance, clean glassmorphic aesthetics, and seamless user experiences.'**
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
  /// **'OpenFile — licensed under GPL-3.0. Source: github.com/mohmaedeslam00116/OpenFile'**
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

  /// No description provided for @duplicateGroupFiles.
  ///
  /// In en, this message translates to:
  /// **'{count} files'**
  String duplicateGroupFiles(Object count);

  /// No description provided for @findDuplicates.
  ///
  /// In en, this message translates to:
  /// **'Find duplicates'**
  String get findDuplicates;

  /// No description provided for @noDuplicatesFound.
  ///
  /// In en, this message translates to:
  /// **'No duplicate files found.'**
  String get noDuplicatesFound;

  /// No description provided for @deleteFailedItems.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete {count} item(s)'**
  String deleteFailedItems(Object count);

  /// No description provided for @pasteFailedItems.
  ///
  /// In en, this message translates to:
  /// **'Failed to paste {count} item(s)'**
  String pasteFailedItems(Object count);

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
  /// **'OpenFile v{version}'**
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
  /// **'Built-in OpenFile Viewer'**
  String get builtInViewer;

  /// No description provided for @builtInViewerDescription.
  ///
  /// In en, this message translates to:
  /// **'OpenFile\'s custom native experience'**
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
  /// **'Android 11+ restricts standard access to Android/data and Android/obb folders to protect app data. To view and modify these files, OpenFile requires advanced permissions.'**
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
  /// **'SD Card'**
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

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterFolders.
  ///
  /// In en, this message translates to:
  /// **'Folders'**
  String get filterFolders;

  /// No description provided for @deleteSelectedItemsQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count} selected item(s)? This cannot be undone.'**
  String deleteSelectedItemsQuestion(int count);

  /// No description provided for @deleteItemsQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count} items? This cannot be undone.'**
  String deleteItemsQuestion(int count);

  /// No description provided for @deleteItemQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this item? This cannot be undone.'**
  String get deleteItemQuestion;

  /// No description provided for @cannotCutPasteSameFolder.
  ///
  /// In en, this message translates to:
  /// **'Cannot cut and paste a file into the same folder.'**
  String get cannotCutPasteSameFolder;

  /// No description provided for @shareAppMessage.
  ///
  /// In en, this message translates to:
  /// **'Check out OpenFile, a beautiful offline file manager and media hub: {url}'**
  String shareAppMessage(String url);

  /// No description provided for @deviceGalleryAuto.
  ///
  /// In en, this message translates to:
  /// **'Device Gallery (Auto)'**
  String get deviceGalleryAuto;

  /// No description provided for @deviceAudioLibraryAuto.
  ///
  /// In en, this message translates to:
  /// **'Device Audio Library (Auto)'**
  String get deviceAudioLibraryAuto;

  /// No description provided for @deviceGalleryScreenshots.
  ///
  /// In en, this message translates to:
  /// **'Device Gallery (Screenshots)'**
  String get deviceGalleryScreenshots;

  /// No description provided for @internalStorageAllFolders.
  ///
  /// In en, this message translates to:
  /// **'Internal Storage (All Folders Scanned)'**
  String get internalStorageAllFolders;

  /// No description provided for @searchYourStorage.
  ///
  /// In en, this message translates to:
  /// **'Search your storage'**
  String get searchYourStorage;

  /// No description provided for @searchThisFolder.
  ///
  /// In en, this message translates to:
  /// **'Search this folder'**
  String get searchThisFolder;

  /// No description provided for @searchEverythingHint.
  ///
  /// In en, this message translates to:
  /// **'Find any file, folder, document or media instantly across your device'**
  String get searchEverythingHint;

  /// No description provided for @searchInFolderNamed.
  ///
  /// In en, this message translates to:
  /// **'Search files and subfolders in: {folder}'**
  String searchInFolderNamed(String folder);

  /// No description provided for @noMatchForQuery.
  ///
  /// In en, this message translates to:
  /// **'We could not find anything matching \"{query}\" under {filter}'**
  String noMatchForQuery(String query, String filter);

  /// No description provided for @rootDirectory.
  ///
  /// In en, this message translates to:
  /// **'Root'**
  String get rootDirectory;

  /// No description provided for @copyFileSuffix.
  ///
  /// In en, this message translates to:
  /// **'(copy)'**
  String get copyFileSuffix;

  /// No description provided for @tarFormatsMemoryWarning.
  ///
  /// In en, this message translates to:
  /// **'TAR.ZSTD and TAR.LZ4 formats are highly memory-intensive and optimized for files under 600MB. Please use the ZIP or TAR format for larger files.'**
  String get tarFormatsMemoryWarning;

  /// No description provided for @actionApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get actionApply;

  /// No description provided for @actionCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get actionCreate;

  /// No description provided for @actionMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get actionMore;

  /// No description provided for @actionOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get actionOk;

  /// No description provided for @actionPinToTop.
  ///
  /// In en, this message translates to:
  /// **'Pin to Top'**
  String get actionPinToTop;

  /// No description provided for @actionUnpinFromTop.
  ///
  /// In en, this message translates to:
  /// **'Unpin from Top'**
  String get actionUnpinFromTop;

  /// No description provided for @actionPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get actionPreview;

  /// No description provided for @actionReplace.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get actionReplace;

  /// No description provided for @actionSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get actionSkip;

  /// No description provided for @chooseAnyDestination.
  ///
  /// In en, this message translates to:
  /// **'Choose any destination'**
  String get chooseAnyDestination;

  /// No description provided for @customLocation.
  ///
  /// In en, this message translates to:
  /// **'Custom Location'**
  String get customLocation;

  /// No description provided for @selectCustomLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Custom Location...'**
  String get selectCustomLocation;

  /// No description provided for @propertyContains.
  ///
  /// In en, this message translates to:
  /// **'Contains'**
  String get propertyContains;

  /// No description provided for @propertyExtension.
  ///
  /// In en, this message translates to:
  /// **'Extension'**
  String get propertyExtension;

  /// No description provided for @propertyModified.
  ///
  /// In en, this message translates to:
  /// **'Modified'**
  String get propertyModified;

  /// No description provided for @propertyName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get propertyName;

  /// No description provided for @propertyPath.
  ///
  /// In en, this message translates to:
  /// **'Path'**
  String get propertyPath;

  /// No description provided for @propertyPermissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get propertyPermissions;

  /// No description provided for @permissionRead.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get permissionRead;

  /// No description provided for @permissionWrite.
  ///
  /// In en, this message translates to:
  /// **'Write'**
  String get permissionWrite;

  /// No description provided for @propertySize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get propertySize;

  /// No description provided for @propertyType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get propertyType;

  /// No description provided for @propertyFolderDirectory.
  ///
  /// In en, this message translates to:
  /// **'Folder / Directory'**
  String get propertyFolderDirectory;

  /// No description provided for @itemFiles.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get itemFiles;

  /// No description provided for @fileWithExtension.
  ///
  /// In en, this message translates to:
  /// **'File ({extension})'**
  String fileWithExtension(String extension);

  /// No description provided for @fileLongPressHint.
  ///
  /// In en, this message translates to:
  /// **'File (Long press to Open with)'**
  String get fileLongPressHint;

  /// No description provided for @compressionFast.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get compressionFast;

  /// No description provided for @compressionMaximum.
  ///
  /// In en, this message translates to:
  /// **'Maximum'**
  String get compressionMaximum;

  /// No description provided for @compressionNone.
  ///
  /// In en, this message translates to:
  /// **'None (Store)'**
  String get compressionNone;

  /// No description provided for @compressionStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get compressionStandard;

  /// No description provided for @batchRenamePadding.
  ///
  /// In en, this message translates to:
  /// **'Padding'**
  String get batchRenamePadding;

  /// No description provided for @batchRenameReplacement.
  ///
  /// In en, this message translates to:
  /// **'Replacement'**
  String get batchRenameReplacement;

  /// No description provided for @lessOptions.
  ///
  /// In en, this message translates to:
  /// **'Less Options'**
  String get lessOptions;

  /// No description provided for @conflictNewer.
  ///
  /// In en, this message translates to:
  /// **'Newer'**
  String get conflictNewer;

  /// No description provided for @sortNameAscending.
  ///
  /// In en, this message translates to:
  /// **'Name (A-Z)'**
  String get sortNameAscending;

  /// No description provided for @sortNameDescending.
  ///
  /// In en, this message translates to:
  /// **'Name (Z-A)'**
  String get sortNameDescending;

  /// No description provided for @sortNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get sortNewest;

  /// No description provided for @sortOldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get sortOldest;

  /// No description provided for @sortSizeLarge.
  ///
  /// In en, this message translates to:
  /// **'Size (Large)'**
  String get sortSizeLarge;

  /// No description provided for @sortSizeSmall.
  ///
  /// In en, this message translates to:
  /// **'Size (Small)'**
  String get sortSizeSmall;

  /// No description provided for @showFolders.
  ///
  /// In en, this message translates to:
  /// **'Show Folders'**
  String get showFolders;

  /// No description provided for @hideFolders.
  ///
  /// In en, this message translates to:
  /// **'Hide Folders'**
  String get hideFolders;

  /// No description provided for @selectFilesAndFolders.
  ///
  /// In en, this message translates to:
  /// **'Select Files & Folders'**
  String get selectFilesAndFolders;

  /// No description provided for @selectAndPinFolders.
  ///
  /// In en, this message translates to:
  /// **'Select & Pin Folders'**
  String get selectAndPinFolders;

  /// No description provided for @pinnedItemsToTop.
  ///
  /// In en, this message translates to:
  /// **'Pinned selected item(s) to top'**
  String get pinnedItemsToTop;

  /// No description provided for @unpinnedItems.
  ///
  /// In en, this message translates to:
  /// **'Unpinned selected item(s)'**
  String get unpinnedItems;

  /// No description provided for @emptyLabel.
  ///
  /// In en, this message translates to:
  /// **'(empty)'**
  String get emptyLabel;

  /// No description provided for @runInBackground.
  ///
  /// In en, this message translates to:
  /// **'Background'**
  String get runInBackground;

  /// No description provided for @processingFiles.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get processingFiles;

  /// No description provided for @copyingFiles.
  ///
  /// In en, this message translates to:
  /// **'Copying Files...'**
  String get copyingFiles;

  /// No description provided for @movingFiles.
  ///
  /// In en, this message translates to:
  /// **'Moving Files...'**
  String get movingFiles;

  /// No description provided for @calculating.
  ///
  /// In en, this message translates to:
  /// **'calculating...'**
  String get calculating;

  /// No description provided for @searchInThisDirectory.
  ///
  /// In en, this message translates to:
  /// **'Search files and subfolders in this directory'**
  String get searchInThisDirectory;

  /// No description provided for @countItemsSelected.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item selected} other{{count} items selected}}'**
  String countItemsSelected(int count);

  /// No description provided for @sizeWithBytes.
  ///
  /// In en, this message translates to:
  /// **'{size} ({bytes} bytes)'**
  String sizeWithBytes(String size, int bytes);

  /// No description provided for @containsFoldersAndFiles.
  ///
  /// In en, this message translates to:
  /// **'{folders, plural, =0{no subfolders} =1{1 subfolder} other{{folders} subfolders}}, {files, plural, =0{no files} =1{1 file} other{{files} files}}'**
  String containsFoldersAndFiles(int folders, int files);

  /// No description provided for @processedOfTotal.
  ///
  /// In en, this message translates to:
  /// **'{processed} of {total}'**
  String processedOfTotal(String processed, String total);

  /// No description provided for @speedMegabytesPerSecond.
  ///
  /// In en, this message translates to:
  /// **'{speed} MB/s'**
  String speedMegabytesPerSecond(String speed);

  /// No description provided for @timeRemaining.
  ///
  /// In en, this message translates to:
  /// **'{time} remaining'**
  String timeRemaining(String time);

  /// No description provided for @analyzerApplications.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get analyzerApplications;

  /// No description provided for @analyzerBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Breakdown'**
  String get analyzerBreakdown;

  /// No description provided for @analyzerCalculatingAppsCapacity.
  ///
  /// In en, this message translates to:
  /// **'Calculating Apps capacity...'**
  String get analyzerCalculatingAppsCapacity;

  /// No description provided for @analyzerInitializing.
  ///
  /// In en, this message translates to:
  /// **'Initializing...'**
  String get analyzerInitializing;

  /// No description provided for @analyzerReadingSystemMemory.
  ///
  /// In en, this message translates to:
  /// **'Reading system memory...'**
  String get analyzerReadingSystemMemory;

  /// No description provided for @analyzerBackedUpApks.
  ///
  /// In en, this message translates to:
  /// **'Backed Up APKs'**
  String get analyzerBackedUpApks;

  /// No description provided for @analyzerInstalledUserApps.
  ///
  /// In en, this message translates to:
  /// **'Installed User Apps'**
  String get analyzerInstalledUserApps;

  /// No description provided for @analyzerSystemPackages.
  ///
  /// In en, this message translates to:
  /// **'System Packages'**
  String get analyzerSystemPackages;

  /// No description provided for @analyzerSearchBackups.
  ///
  /// In en, this message translates to:
  /// **'Search backups...'**
  String get analyzerSearchBackups;

  /// No description provided for @analyzerSearchPackagesHint.
  ///
  /// In en, this message translates to:
  /// **'Search packages or names...'**
  String get analyzerSearchPackagesHint;

  /// No description provided for @analyzerSortByBackupDate.
  ///
  /// In en, this message translates to:
  /// **'Sort by Backup Date'**
  String get analyzerSortByBackupDate;

  /// No description provided for @analyzerSortByInstallDate.
  ///
  /// In en, this message translates to:
  /// **'Sort by Install Date'**
  String get analyzerSortByInstallDate;

  /// No description provided for @analyzerBackup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get analyzerBackup;

  /// No description provided for @analyzerClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get analyzerClear;

  /// No description provided for @analyzerUninstall.
  ///
  /// In en, this message translates to:
  /// **'Uninstall'**
  String get analyzerUninstall;

  /// No description provided for @analyzerSingleApk.
  ///
  /// In en, this message translates to:
  /// **'Single APK'**
  String get analyzerSingleApk;

  /// No description provided for @analyzerSplitBundle.
  ///
  /// In en, this message translates to:
  /// **'Split Bundle'**
  String get analyzerSplitBundle;

  /// No description provided for @analyzerSplitBundleApks.
  ///
  /// In en, this message translates to:
  /// **'Split Bundle (APKS)'**
  String get analyzerSplitBundleApks;

  /// No description provided for @analyzerApkBackedUp.
  ///
  /// In en, this message translates to:
  /// **'APK backed up successfully to OpenFile/Backups/Apps/'**
  String get analyzerApkBackedUp;

  /// No description provided for @analyzerApkBackupFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to back up APK'**
  String get analyzerApkBackupFailed;

  /// No description provided for @analyzerBackupsListHint.
  ///
  /// In en, this message translates to:
  /// **'A list of your backed up APK and APKS files will show here.'**
  String get analyzerBackupsListHint;

  /// No description provided for @analyzerNoBackupsMatch.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find any backups matching \"{query}\"'**
  String analyzerNoBackupsMatch(String query);

  /// No description provided for @categoryAudios.
  ///
  /// In en, this message translates to:
  /// **'Audios'**
  String get categoryAudios;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get actionInfo;

  /// No description provided for @actionReload.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get actionReload;

  /// No description provided for @actionRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get actionRestore;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get actionUndo;

  /// No description provided for @actionRedo.
  ///
  /// In en, this message translates to:
  /// **'Redo'**
  String get actionRedo;

  /// No description provided for @editorFind.
  ///
  /// In en, this message translates to:
  /// **'Find...'**
  String get editorFind;

  /// No description provided for @editorLockZoom.
  ///
  /// In en, this message translates to:
  /// **'Lock Zoom'**
  String get editorLockZoom;

  /// No description provided for @editorUnlockZoom.
  ///
  /// In en, this message translates to:
  /// **'Unlock Zoom'**
  String get editorUnlockZoom;

  /// No description provided for @editorWordWrapOn.
  ///
  /// In en, this message translates to:
  /// **'Word Wrap: ON'**
  String get editorWordWrapOn;

  /// No description provided for @editorWordWrapOff.
  ///
  /// In en, this message translates to:
  /// **'Word Wrap: OFF'**
  String get editorWordWrapOff;

  /// No description provided for @editorEditLockOn.
  ///
  /// In en, this message translates to:
  /// **'Edit Lock: ON'**
  String get editorEditLockOn;

  /// No description provided for @editorEditLockOff.
  ///
  /// In en, this message translates to:
  /// **'Edit Lock: OFF'**
  String get editorEditLockOff;

  /// No description provided for @editorShowLineNumbers.
  ///
  /// In en, this message translates to:
  /// **'Show Line Numbers'**
  String get editorShowLineNumbers;

  /// No description provided for @editorHideLineNumbers.
  ///
  /// In en, this message translates to:
  /// **'Hide Line Numbers'**
  String get editorHideLineNumbers;

  /// No description provided for @editorSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save changes back to external storage.'**
  String get editorSaveFailed;

  /// No description provided for @viewerEmptySlide.
  ///
  /// In en, this message translates to:
  /// **'(Empty Slide)'**
  String get viewerEmptySlide;

  /// No description provided for @viewerEmptyFile.
  ///
  /// In en, this message translates to:
  /// **'(Empty file)'**
  String get viewerEmptyFile;

  /// No description provided for @viewerContinuous.
  ///
  /// In en, this message translates to:
  /// **'Continuous (Vertical scrolling list)'**
  String get viewerContinuous;

  /// No description provided for @viewerSinglePage.
  ///
  /// In en, this message translates to:
  /// **'Single Page (Instant page-by-page swipe)'**
  String get viewerSinglePage;

  /// No description provided for @viewerHorizontalSwipe.
  ///
  /// In en, this message translates to:
  /// **'Horizontal (Left to right swipe)'**
  String get viewerHorizontalSwipe;

  /// No description provided for @viewerVerticalScroll.
  ///
  /// In en, this message translates to:
  /// **'Vertical (Top to bottom scroll)'**
  String get viewerVerticalScroll;

  /// No description provided for @viewerHorizontal.
  ///
  /// In en, this message translates to:
  /// **'Horizontal'**
  String get viewerHorizontal;

  /// No description provided for @viewerVertical.
  ///
  /// In en, this message translates to:
  /// **'Vertical'**
  String get viewerVertical;

  /// No description provided for @viewerSizeMegabytes.
  ///
  /// In en, this message translates to:
  /// **'{size} MB'**
  String viewerSizeMegabytes(String size);

  /// No description provided for @viewerSizeKilobytes.
  ///
  /// In en, this message translates to:
  /// **'{size} KB'**
  String viewerSizeKilobytes(String size);

  /// No description provided for @databaseBrowseData.
  ///
  /// In en, this message translates to:
  /// **'Browse Data'**
  String get databaseBrowseData;

  /// No description provided for @databaseSqlConsole.
  ///
  /// In en, this message translates to:
  /// **'SQL Console'**
  String get databaseSqlConsole;

  /// No description provided for @databaseTableSchema.
  ///
  /// In en, this message translates to:
  /// **'Table Schema'**
  String get databaseTableSchema;

  /// No description provided for @databaseSelectHint.
  ///
  /// In en, this message translates to:
  /// **'Execute a SELECT query to view results.'**
  String get databaseSelectHint;

  /// No description provided for @databaseQueryError.
  ///
  /// In en, this message translates to:
  /// **'Error executing query.'**
  String get databaseQueryError;

  /// No description provided for @audioLyrics.
  ///
  /// In en, this message translates to:
  /// **'Lyrics'**
  String get audioLyrics;

  /// No description provided for @audioMute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get audioMute;

  /// No description provided for @audioUnmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get audioUnmute;

  /// No description provided for @audioPlayInBackground.
  ///
  /// In en, this message translates to:
  /// **'Play in Background'**
  String get audioPlayInBackground;

  /// No description provided for @audioBackgroundOn.
  ///
  /// In en, this message translates to:
  /// **'Background: On'**
  String get audioBackgroundOn;

  /// No description provided for @audioNotificationControlsHint.
  ///
  /// In en, this message translates to:
  /// **'Shows notification with controls'**
  String get audioNotificationControlsHint;

  /// No description provided for @audioTapToStopHint.
  ///
  /// In en, this message translates to:
  /// **'Tap to stop background playback'**
  String get audioTapToStopHint;

  /// No description provided for @audioShuffleOn.
  ///
  /// In en, this message translates to:
  /// **'Shuffle: On'**
  String get audioShuffleOn;

  /// No description provided for @audioShuffleOff.
  ///
  /// In en, this message translates to:
  /// **'Shuffle: Off'**
  String get audioShuffleOff;

  /// No description provided for @audioRepeatAll.
  ///
  /// In en, this message translates to:
  /// **'Repeat: All'**
  String get audioRepeatAll;

  /// No description provided for @audioRepeatOne.
  ///
  /// In en, this message translates to:
  /// **'Repeat: One'**
  String get audioRepeatOne;

  /// No description provided for @audioRepeatOff.
  ///
  /// In en, this message translates to:
  /// **'Repeat: Off'**
  String get audioRepeatOff;

  /// No description provided for @audioSingleTrack.
  ///
  /// In en, this message translates to:
  /// **'Single Track'**
  String get audioSingleTrack;

  /// No description provided for @lyricsReadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to read the chosen LRC file.'**
  String get lyricsReadFailed;

  /// No description provided for @lyricsNoValidLines.
  ///
  /// In en, this message translates to:
  /// **'No valid lyrics lines found in chosen LRC file.'**
  String get lyricsNoValidLines;

  /// No description provided for @lyricsSelectValidFile.
  ///
  /// In en, this message translates to:
  /// **'Please select a valid file ending with .lrc'**
  String get lyricsSelectValidFile;

  /// No description provided for @videoBrightness.
  ///
  /// In en, this message translates to:
  /// **'Brightness'**
  String get videoBrightness;

  /// No description provided for @videoVolume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get videoVolume;

  /// No description provided for @videoFullScreen.
  ///
  /// In en, this message translates to:
  /// **'Full Screen'**
  String get videoFullScreen;

  /// No description provided for @videoExitFullScreen.
  ///
  /// In en, this message translates to:
  /// **'Exit Full Screen'**
  String get videoExitFullScreen;

  /// No description provided for @videoLabel.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get videoLabel;

  /// No description provided for @imageLabel.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get imageLabel;

  /// No description provided for @mediaInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Media Info'**
  String get mediaInfoTitle;

  /// No description provided for @mediaFileSize.
  ///
  /// In en, this message translates to:
  /// **'File Size'**
  String get mediaFileSize;

  /// No description provided for @mediaOriginalLocation.
  ///
  /// In en, this message translates to:
  /// **'Original Location'**
  String get mediaOriginalLocation;

  /// No description provided for @mediaRecycledDate.
  ///
  /// In en, this message translates to:
  /// **'Recycled Date'**
  String get mediaRecycledDate;

  /// No description provided for @mediaDirectory.
  ///
  /// In en, this message translates to:
  /// **'Directory'**
  String get mediaDirectory;

  /// No description provided for @mediaUnknownDate.
  ///
  /// In en, this message translates to:
  /// **'Unknown Date'**
  String get mediaUnknownDate;

  /// No description provided for @mediaCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied {count} items to clipboard'**
  String mediaCopiedToClipboard(int count);

  /// No description provided for @mediaCutToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Cut {count} items to clipboard'**
  String mediaCutToClipboard(int count);

  /// No description provided for @markdownFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'# File not found'**
  String get markdownFileNotFound;

  /// No description provided for @markdownLoadError.
  ///
  /// In en, this message translates to:
  /// **'# Error loading file\n\n`{error}`'**
  String markdownLoadError(String error);

  /// No description provided for @htmlFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'<p>File not found.</p>'**
  String get htmlFileNotFound;

  /// No description provided for @htmlLoadError.
  ///
  /// In en, this message translates to:
  /// **'<p>Error loading HTML: {error}</p>'**
  String htmlLoadError(String error);

  /// No description provided for @archiveCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Archive created successfully'**
  String get archiveCreatedSuccessfully;

  /// No description provided for @archiveExtractedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Archive extracted successfully'**
  String get archiveExtractedSuccessfully;

  /// No description provided for @archiveFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Archive file not found'**
  String get archiveFileNotFound;

  /// No description provided for @archiveCompressionFailed.
  ///
  /// In en, this message translates to:
  /// **'Compression failed: {error}'**
  String archiveCompressionFailed(String error);

  /// No description provided for @archiveExtractionFailed.
  ///
  /// In en, this message translates to:
  /// **'Extraction failed: {error}'**
  String archiveExtractionFailed(String error);

  /// No description provided for @archiveOperationFailed.
  ///
  /// In en, this message translates to:
  /// **'Compression/extraction failed.'**
  String get archiveOperationFailed;

  /// No description provided for @archiveNoFilesToCompress.
  ///
  /// In en, this message translates to:
  /// **'No files found to compress'**
  String get archiveNoFilesToCompress;

  /// No description provided for @archiveScanningFiles.
  ///
  /// In en, this message translates to:
  /// **'Scanning files...'**
  String get archiveScanningFiles;

  /// No description provided for @archiveSavingToDisk.
  ///
  /// In en, this message translates to:
  /// **'Saving archive to disk...'**
  String get archiveSavingToDisk;

  /// No description provided for @archiveEncodingStructure.
  ///
  /// In en, this message translates to:
  /// **'Encoding archive structure...'**
  String get archiveEncodingStructure;

  /// No description provided for @archiveApplyingGzip.
  ///
  /// In en, this message translates to:
  /// **'Applying GZIP compression...'**
  String get archiveApplyingGzip;

  /// No description provided for @archiveApplyingBzip2.
  ///
  /// In en, this message translates to:
  /// **'Applying BZIP2 compression...'**
  String get archiveApplyingBzip2;

  /// No description provided for @archiveApplyingLz4.
  ///
  /// In en, this message translates to:
  /// **'Applying LZ4 compression...'**
  String get archiveApplyingLz4;

  /// No description provided for @archiveApplyingZstd.
  ///
  /// In en, this message translates to:
  /// **'Applying ZSTD compression...'**
  String get archiveApplyingZstd;

  /// No description provided for @archiveOpeningZip.
  ///
  /// In en, this message translates to:
  /// **'Opening zip...'**
  String get archiveOpeningZip;

  /// No description provided for @archiveReading.
  ///
  /// In en, this message translates to:
  /// **'Reading archive...'**
  String get archiveReading;

  /// No description provided for @archiveExtractingTar.
  ///
  /// In en, this message translates to:
  /// **'Extracting tar...'**
  String get archiveExtractingTar;

  /// No description provided for @archiveOpeningTar.
  ///
  /// In en, this message translates to:
  /// **'Opening tar...'**
  String get archiveOpeningTar;

  /// No description provided for @archiveDecompressingGzip.
  ///
  /// In en, this message translates to:
  /// **'Decompressing gzip...'**
  String get archiveDecompressingGzip;

  /// No description provided for @archiveDecompressing.
  ///
  /// In en, this message translates to:
  /// **'Decompressing archive...'**
  String get archiveDecompressing;

  /// No description provided for @archiveExtractingFiles.
  ///
  /// In en, this message translates to:
  /// **'Extracting files...'**
  String get archiveExtractingFiles;

  /// No description provided for @archiveOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening archive...'**
  String get archiveOpening;

  /// No description provided for @archiveProcessedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'{name} processed successfully.'**
  String archiveProcessedSuccessfully(String name);

  /// No description provided for @operationSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get operationSuccessful;

  /// No description provided for @operationFailed.
  ///
  /// In en, this message translates to:
  /// **'Operation Failed'**
  String get operationFailed;

  /// No description provided for @archiveUnsupportedFormat.
  ///
  /// In en, this message translates to:
  /// **'Unsupported format'**
  String get archiveUnsupportedFormat;

  /// No description provided for @actionBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionBack;

  /// No description provided for @actionBackspace.
  ///
  /// In en, this message translates to:
  /// **'Backspace'**
  String get actionBackspace;

  /// No description provided for @actionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionClose;

  /// No description provided for @actionDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get actionDetails;

  /// No description provided for @actionPaste.
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get actionPaste;

  /// No description provided for @actionStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get actionStart;

  /// No description provided for @actionStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get actionStop;

  /// No description provided for @actionUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get actionUpload;

  /// No description provided for @settingsAppIconPicker.
  ///
  /// In en, this message translates to:
  /// **'App Icon Picker'**
  String get settingsAppIconPicker;

  /// No description provided for @settingsLogo.
  ///
  /// In en, this message translates to:
  /// **'Logo'**
  String get settingsLogo;

  /// No description provided for @settingsFileExplorer.
  ///
  /// In en, this message translates to:
  /// **'File Explorer & Navigation'**
  String get settingsFileExplorer;

  /// No description provided for @settingsMediaActions.
  ///
  /// In en, this message translates to:
  /// **'Media & Default Actions'**
  String get settingsMediaActions;

  /// No description provided for @settingsExitConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Dialog'**
  String get settingsExitConfirmation;

  /// No description provided for @settingsExitConfirmationHint.
  ///
  /// In en, this message translates to:
  /// **'Prompt for exit verification before closing'**
  String get settingsExitConfirmationHint;

  /// No description provided for @settingsDoublePressExit.
  ///
  /// In en, this message translates to:
  /// **'Double-Press to Exit'**
  String get settingsDoublePressExit;

  /// No description provided for @settingsDoublePressExitHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the back button twice within a short window to exit'**
  String get settingsDoublePressExitHint;

  /// No description provided for @settingsShowConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Show confirmation dialog'**
  String get settingsShowConfirmation;

  /// No description provided for @settingsDoublePressBackHint.
  ///
  /// In en, this message translates to:
  /// **'Double-press back button to exit'**
  String get settingsDoublePressBackHint;

  /// No description provided for @settingsExitBehaviourHint.
  ///
  /// In en, this message translates to:
  /// **'Choose between exit confirmation dialog or double-pressing back button to exit'**
  String get settingsExitBehaviourHint;

  /// No description provided for @settingsTrailingInfoHint.
  ///
  /// In en, this message translates to:
  /// **'Choose what to show on the right side of files and folders when 3-dot is hidden'**
  String get settingsTrailingInfoHint;

  /// No description provided for @recycleBinDays7.
  ///
  /// In en, this message translates to:
  /// **'7 Days'**
  String get recycleBinDays7;

  /// No description provided for @recycleBinDays15.
  ///
  /// In en, this message translates to:
  /// **'15 Days'**
  String get recycleBinDays15;

  /// No description provided for @recycleBinDays30.
  ///
  /// In en, this message translates to:
  /// **'30 Days (Recommended)'**
  String get recycleBinDays30;

  /// No description provided for @recycleBinNeverManual.
  ///
  /// In en, this message translates to:
  /// **'Never (Manually clean bin)'**
  String get recycleBinNeverManual;

  /// No description provided for @recycleBinNeverAuto.
  ///
  /// In en, this message translates to:
  /// **'Never (Auto-delete disabled)'**
  String get recycleBinNeverAuto;

  /// No description provided for @recycleBinAfterOneDay.
  ///
  /// In en, this message translates to:
  /// **'After 1 Day'**
  String get recycleBinAfterOneDay;

  /// No description provided for @recycleBinAfterDays.
  ///
  /// In en, this message translates to:
  /// **'After {days} Days'**
  String recycleBinAfterDays(int days);

  /// No description provided for @trailingInfoNone.
  ///
  /// In en, this message translates to:
  /// **'None / Hide Info'**
  String get trailingInfoNone;

  /// No description provided for @trailingInfoNoneHint.
  ///
  /// In en, this message translates to:
  /// **'Do not display additional information on the right side'**
  String get trailingInfoNoneHint;

  /// No description provided for @trailingInfoDateHint.
  ///
  /// In en, this message translates to:
  /// **'Display the last modified date and time'**
  String get trailingInfoDateHint;

  /// No description provided for @trailingInfoSizeHint.
  ///
  /// In en, this message translates to:
  /// **'Display file size for files and item count for folders'**
  String get trailingInfoSizeHint;

  /// No description provided for @themeSignatureDefault.
  ///
  /// In en, this message translates to:
  /// **'Signature Default (Lexend Deca)'**
  String get themeSignatureDefault;

  /// No description provided for @themeOriginalDefault.
  ///
  /// In en, this message translates to:
  /// **'Original Default (Signature Blue)'**
  String get themeOriginalDefault;

  /// No description provided for @themeBrokenOutline.
  ///
  /// In en, this message translates to:
  /// **'OpenFile Broken Outline (Default)'**
  String get themeBrokenOutline;

  /// No description provided for @themeOriginalGeometric.
  ///
  /// In en, this message translates to:
  /// **'Original OpenFile clean geometric look'**
  String get themeOriginalGeometric;

  /// No description provided for @themeNothingDotMatrix.
  ///
  /// In en, this message translates to:
  /// **'Nothing Dot-Matrix & Sans'**
  String get themeNothingDotMatrix;

  /// No description provided for @themeDotMatrixHint.
  ///
  /// In en, this message translates to:
  /// **'High-tech retro dot matrix headings + clean body'**
  String get themeDotMatrixHint;

  /// No description provided for @themeMonospaceHint.
  ///
  /// In en, this message translates to:
  /// **'Clean and futuristic developer monospaced look'**
  String get themeMonospaceHint;

  /// No description provided for @themeGeometricHint.
  ///
  /// In en, this message translates to:
  /// **'Super sleek, minimal, and premium geometric aesthetic'**
  String get themeGeometricHint;

  /// No description provided for @themeBoldHint.
  ///
  /// In en, this message translates to:
  /// **'Bold, modern, and striking typographic scale'**
  String get themeBoldHint;

  /// No description provided for @themeCustomFontHint.
  ///
  /// In en, this message translates to:
  /// **'Your custom loaded font file'**
  String get themeCustomFontHint;

  /// No description provided for @themeCustomFontName.
  ///
  /// In en, this message translates to:
  /// **'Custom Font ({name})'**
  String themeCustomFontName(String name);

  /// No description provided for @themeImportCustomFont.
  ///
  /// In en, this message translates to:
  /// **'Import Custom Font File (.ttf/.otf)'**
  String get themeImportCustomFont;

  /// No description provided for @themeReplaceCustomFont.
  ///
  /// In en, this message translates to:
  /// **'Replace Custom Font File'**
  String get themeReplaceCustomFont;

  /// No description provided for @connectionActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get connectionActive;

  /// No description provided for @connectionInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get connectionInactive;

  /// No description provided for @connectionConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connectionConnected;

  /// No description provided for @connectionConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connectionConnect;

  /// No description provided for @connectionPort.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get connectionPort;

  /// No description provided for @connectionProtocol.
  ///
  /// In en, this message translates to:
  /// **'Protocol'**
  String get connectionProtocol;

  /// No description provided for @connectionName.
  ///
  /// In en, this message translates to:
  /// **'Connection Name'**
  String get connectionName;

  /// No description provided for @connectionServerAddress.
  ///
  /// In en, this message translates to:
  /// **'Server Address / IP'**
  String get connectionServerAddress;

  /// No description provided for @connectionUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get connectionUsername;

  /// No description provided for @connectionUsernameOptional.
  ///
  /// In en, this message translates to:
  /// **'Username (Optional)'**
  String get connectionUsernameOptional;

  /// No description provided for @connectionRemoteDirectory.
  ///
  /// In en, this message translates to:
  /// **'Remote Directory'**
  String get connectionRemoteDirectory;

  /// No description provided for @connectionAuthenticating.
  ///
  /// In en, this message translates to:
  /// **'Authenticating credentials...'**
  String get connectionAuthenticating;

  /// No description provided for @connectionCheckingPort.
  ///
  /// In en, this message translates to:
  /// **'Checking port status...'**
  String get connectionCheckingPort;

  /// No description provided for @connectionResolvingHost.
  ///
  /// In en, this message translates to:
  /// **'Resolving host address...'**
  String get connectionResolvingHost;

  /// No description provided for @connectionMounting.
  ///
  /// In en, this message translates to:
  /// **'Mounting storage volume...'**
  String get connectionMounting;

  /// No description provided for @connectionTitle.
  ///
  /// In en, this message translates to:
  /// **'{protocol} Connection'**
  String connectionTitle(String protocol);

  /// No description provided for @connectionServerAddressHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 192.168.1.100 or 192.168.1.100/dav'**
  String get connectionServerAddressHint;

  /// No description provided for @connectionServerAddressHint2.
  ///
  /// In en, this message translates to:
  /// **'e.g., 192.168.1.100 or nas.local'**
  String get connectionServerAddressHint2;

  /// No description provided for @protocolAndroidSaf.
  ///
  /// In en, this message translates to:
  /// **'Android Storage Access Framework (SD Card / External)'**
  String get protocolAndroidSaf;

  /// No description provided for @protocolHttp.
  ///
  /// In en, this message translates to:
  /// **'HTTP Web Distributed Authoring'**
  String get protocolHttp;

  /// No description provided for @protocolLan.
  ///
  /// In en, this message translates to:
  /// **'Local Area Network & SMB NAS Share'**
  String get protocolLan;

  /// No description provided for @protocolSafFolder.
  ///
  /// In en, this message translates to:
  /// **'SAF Folder'**
  String get protocolSafFolder;

  /// No description provided for @protocolSsh.
  ///
  /// In en, this message translates to:
  /// **'SSH Secure File Transfer Server'**
  String get protocolSsh;

  /// No description provided for @protocolFtp.
  ///
  /// In en, this message translates to:
  /// **'Standard File Transfer Protocol'**
  String get protocolFtp;

  /// No description provided for @ftpAnonymous.
  ///
  /// In en, this message translates to:
  /// **'Anonymous'**
  String get ftpAnonymous;

  /// No description provided for @webStartServer.
  ///
  /// In en, this message translates to:
  /// **'Start Web Server'**
  String get webStartServer;

  /// No description provided for @webStopServer.
  ///
  /// In en, this message translates to:
  /// **'Stop Web Server'**
  String get webStopServer;

  /// No description provided for @webCloudShare.
  ///
  /// In en, this message translates to:
  /// **'Cloud Share'**
  String get webCloudShare;

  /// No description provided for @webLocalShare.
  ///
  /// In en, this message translates to:
  /// **'Local Share'**
  String get webLocalShare;

  /// No description provided for @webActivateLink.
  ///
  /// In en, this message translates to:
  /// **'Activate Internet Share Link'**
  String get webActivateLink;

  /// No description provided for @webDeactivateCloud.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Cloud Share'**
  String get webDeactivateCloud;

  /// No description provided for @remoteMoveToDevice.
  ///
  /// In en, this message translates to:
  /// **'Move to Device'**
  String get remoteMoveToDevice;

  /// No description provided for @remoteCopyToDevice.
  ///
  /// In en, this message translates to:
  /// **'Copy to Device'**
  String get remoteCopyToDevice;

  /// No description provided for @remotePasteClipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste remote clipboard'**
  String get remotePasteClipboard;

  /// No description provided for @remotePasteSameLocation.
  ///
  /// In en, this message translates to:
  /// **'Cannot paste to the same location'**
  String get remotePasteSameLocation;

  /// No description provided for @remoteClipboardEmpty.
  ///
  /// In en, this message translates to:
  /// **'Local clipboard is empty. Copy files in the file manager first.'**
  String get remoteClipboardEmpty;

  /// No description provided for @remoteTransferFailed.
  ///
  /// In en, this message translates to:
  /// **'Transfer failed: {error}'**
  String remoteTransferFailed(String error);

  /// No description provided for @remoteTransferring.
  ///
  /// In en, this message translates to:
  /// **'Transferring...'**
  String get remoteTransferring;

  /// No description provided for @remoteCopying.
  ///
  /// In en, this message translates to:
  /// **'Copying...'**
  String get remoteCopying;

  /// No description provided for @remoteMoving.
  ///
  /// In en, this message translates to:
  /// **'Moving...'**
  String get remoteMoving;

  /// No description provided for @remoteDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading from server...'**
  String get remoteDownloading;

  /// No description provided for @remoteUploading.
  ///
  /// In en, this message translates to:
  /// **'Uploading to server...'**
  String get remoteUploading;

  /// No description provided for @remoteUploaded.
  ///
  /// In en, this message translates to:
  /// **'Uploaded {count} file(s) successfully'**
  String remoteUploaded(int count);

  /// No description provided for @remoteUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Upload failed for \"{name}\": {error}'**
  String remoteUploadFailed(String name, String error);

  /// No description provided for @remoteDownloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Download failed: {error}'**
  String remoteDownloadFailed(String error);

  /// No description provided for @remoteCreateFolderFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create folder: {error}'**
  String remoteCreateFolderFailed(String error);

  /// No description provided for @remoteDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete: {error}'**
  String remoteDeleteFailed(String error);

  /// No description provided for @remoteCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied \"{name}\" to clipboard'**
  String remoteCopiedToClipboard(String name);

  /// No description provided for @remoteCutToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Cut \"{name}\" to clipboard'**
  String remoteCutToClipboard(String name);

  /// No description provided for @remoteDeleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted \"{name}\"'**
  String remoteDeleted(String name);

  /// No description provided for @remoteDownloadedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" downloaded → local clipboard ready to paste'**
  String remoteDownloadedToClipboard(String name);

  /// No description provided for @remoteFilesReadyToUpload.
  ///
  /// In en, this message translates to:
  /// **'{count} local file(s) ready to upload'**
  String remoteFilesReadyToUpload(int count);

  /// No description provided for @remoteItemsCut.
  ///
  /// In en, this message translates to:
  /// **'{count} remote item(s) cut'**
  String remoteItemsCut(int count);

  /// No description provided for @remoteItemsCopied.
  ///
  /// In en, this message translates to:
  /// **'{count} remote item(s) copied'**
  String remoteItemsCopied(int count);

  /// No description provided for @vaultEnterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN to Unlock Wallet'**
  String get vaultEnterPin;

  /// No description provided for @vaultSetPin.
  ///
  /// In en, this message translates to:
  /// **'Set your 4-digit Wallet PIN'**
  String get vaultSetPin;

  /// No description provided for @vaultConfirmPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm your 4-digit PIN'**
  String get vaultConfirmPin;

  /// No description provided for @vaultIncorrectPin.
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN. Try again!'**
  String get vaultIncorrectPin;

  /// No description provided for @vaultPinsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'PINs do not match. Try again!'**
  String get vaultPinsDoNotMatch;

  /// No description provided for @vaultPinSet.
  ///
  /// In en, this message translates to:
  /// **'PIN Set Successfully!'**
  String get vaultPinSet;

  /// No description provided for @vaultEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password to Unlock'**
  String get vaultEnterPassword;

  /// No description provided for @vaultLockOption.
  ///
  /// In en, this message translates to:
  /// **'Lock Option'**
  String get vaultLockOption;

  /// No description provided for @vaultLockFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to lock {count} items.'**
  String vaultLockFailed(int count);

  /// No description provided for @vaultNoMatchingFiles.
  ///
  /// In en, this message translates to:
  /// **'No Matching Files'**
  String get vaultNoMatchingFiles;

  /// No description provided for @vaultEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your Secure Vault is Empty'**
  String get vaultEmpty;

  /// No description provided for @vaultSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Try modifying your search text to locate hidden items.'**
  String get vaultSearchHint;

  /// No description provided for @vaultScrambleDescription.
  ///
  /// In en, this message translates to:
  /// **'XOR scrambled signature obfuscation keeps files completely unopenable and hidden from system scanner database. Tap {action} below to protect them.'**
  String vaultScrambleDescription(String action);

  /// No description provided for @vaultInPlace.
  ///
  /// In en, this message translates to:
  /// **'In-Place'**
  String get vaultInPlace;

  /// No description provided for @vaultSandbox.
  ///
  /// In en, this message translates to:
  /// **'Sandbox'**
  String get vaultSandbox;

  /// No description provided for @vaultProtectionMode.
  ///
  /// In en, this message translates to:
  /// **'Protection Mode'**
  String get vaultProtectionMode;

  /// No description provided for @vaultLockedAt.
  ///
  /// In en, this message translates to:
  /// **'Locked At'**
  String get vaultLockedAt;

  /// No description provided for @vaultOriginalName.
  ///
  /// In en, this message translates to:
  /// **'Original Name'**
  String get vaultOriginalName;

  /// No description provided for @vaultOriginalPath.
  ///
  /// In en, this message translates to:
  /// **'Original Path'**
  String get vaultOriginalPath;

  /// No description provided for @vaultScrambledPath.
  ///
  /// In en, this message translates to:
  /// **'Scrambled Path'**
  String get vaultScrambledPath;

  /// No description provided for @vaultInPlaceScrambling.
  ///
  /// In en, this message translates to:
  /// **'⚡ In-Place Scrambling'**
  String get vaultInPlaceScrambling;

  /// No description provided for @vaultIsolatedMove.
  ///
  /// In en, this message translates to:
  /// **'🔒 Isolated Move (Sandbox)'**
  String get vaultIsolatedMove;

  /// No description provided for @settingsBackupFileMissing.
  ///
  /// In en, this message translates to:
  /// **'Backup file does not exist'**
  String get settingsBackupFileMissing;

  /// No description provided for @settingsBackupInvalidFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid backup file format'**
  String get settingsBackupInvalidFormat;

  /// No description provided for @webBrowser.
  ///
  /// In en, this message translates to:
  /// **'Web Browser'**
  String get webBrowser;

  /// No description provided for @webBrowsingDirectories.
  ///
  /// In en, this message translates to:
  /// **'Browsing Directories'**
  String get webBrowsingDirectories;

  /// No description provided for @webCloseModal.
  ///
  /// In en, this message translates to:
  /// **'Close Modal'**
  String get webCloseModal;

  /// No description provided for @downloadFile.
  ///
  /// In en, this message translates to:
  /// **'Download File'**
  String get downloadFile;

  /// No description provided for @webFailedToCopyLink.
  ///
  /// In en, this message translates to:
  /// **'Failed to copy link.'**
  String get webFailedToCopyLink;

  /// No description provided for @webLinkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied to clipboard!'**
  String get webLinkCopied;

  /// No description provided for @webGridView.
  ///
  /// In en, this message translates to:
  /// **'Grid View'**
  String get webGridView;

  /// No description provided for @webListView.
  ///
  /// In en, this message translates to:
  /// **'List View'**
  String get webListView;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error'**
  String get networkError;

  /// No description provided for @webSearchFiles.
  ///
  /// In en, this message translates to:
  /// **'Search files & folders...'**
  String get webSearchFiles;

  /// No description provided for @webUploadToFolder.
  ///
  /// In en, this message translates to:
  /// **'Upload Files to this Folder'**
  String get webUploadToFolder;

  /// No description provided for @webUploadCompleted.
  ///
  /// In en, this message translates to:
  /// **'Upload completed successfully!'**
  String get webUploadCompleted;

  /// No description provided for @webUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Upload failed'**
  String get webUploadFailed;

  /// No description provided for @webUploadSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Upload successful'**
  String get webUploadSuccessful;

  /// No description provided for @mediaCannotOpenDirectory.
  ///
  /// In en, this message translates to:
  /// **'Cannot open directory: {path}'**
  String mediaCannotOpenDirectory(String path);

  /// No description provided for @mediaCannotOpenRemoteDirectory.
  ///
  /// In en, this message translates to:
  /// **'Cannot open remote directory: {path}'**
  String mediaCannotOpenRemoteDirectory(String path);

  /// No description provided for @mediaWebdavConnectFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to connect to WebDAV: {status}'**
  String mediaWebdavConnectFailed(String status);

  /// No description provided for @vaultIncorrectPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password or corrupted file'**
  String get vaultIncorrectPassword;

  /// No description provided for @vaultFileDoesNotExist.
  ///
  /// In en, this message translates to:
  /// **'File does not exist: {path}'**
  String vaultFileDoesNotExist(String path);

  /// No description provided for @vaultDirectoryDoesNotExist.
  ///
  /// In en, this message translates to:
  /// **'Directory does not exist: {path}'**
  String vaultDirectoryDoesNotExist(String path);

  /// No description provided for @vaultFailedToZip.
  ///
  /// In en, this message translates to:
  /// **'Failed to zip directory contents'**
  String get vaultFailedToZip;

  /// No description provided for @rootExecutionFailed.
  ///
  /// In en, this message translates to:
  /// **'Execution failed: {error}'**
  String rootExecutionFailed(String error);

  /// No description provided for @customFolder.
  ///
  /// In en, this message translates to:
  /// **'Custom Folder'**
  String get customFolder;

  /// No description provided for @sdCardWithUsb.
  ///
  /// In en, this message translates to:
  /// **'SD Card / USB'**
  String get sdCardWithUsb;

  /// No description provided for @failedToCreateDirectory.
  ///
  /// In en, this message translates to:
  /// **'Failed to create directory: {path}'**
  String failedToCreateDirectory(String path);

  /// No description provided for @failedToDeleteDirectory.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete directory: {path}'**
  String failedToDeleteDirectory(String path);

  /// No description provided for @fileNotFound.
  ///
  /// In en, this message translates to:
  /// **'File not found'**
  String get fileNotFound;

  /// No description provided for @ftpNotConnected.
  ///
  /// In en, this message translates to:
  /// **'FTP not connected'**
  String get ftpNotConnected;

  /// No description provided for @sftpNotConnected.
  ///
  /// In en, this message translates to:
  /// **'SFTP not connected'**
  String get sftpNotConnected;

  /// No description provided for @ftpConnectionFailed.
  ///
  /// In en, this message translates to:
  /// **'FTP connection failed: could not connect to {host}:{port}'**
  String ftpConnectionFailed(String host, String port);

  /// No description provided for @localFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Local file not found: {path}'**
  String localFileNotFound(String path);

  /// No description provided for @sourceDoesNotExist.
  ///
  /// In en, this message translates to:
  /// **'Source file/folder does not exist: {path}'**
  String sourceDoesNotExist(String path);

  /// No description provided for @vaultFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Scrambled vault file not found'**
  String get vaultFileNotFound;

  /// No description provided for @vaultFileNotFoundAt.
  ///
  /// In en, this message translates to:
  /// **'Scrambled vault file not found: {path}'**
  String vaultFileNotFoundAt(String path);

  /// No description provided for @sharingApksOfSelectedApps.
  ///
  /// In en, this message translates to:
  /// **'Sharing APKs of selected apps'**
  String get sharingApksOfSelectedApps;

  /// No description provided for @sharingApkFor.
  ///
  /// In en, this message translates to:
  /// **'Sharing APK for {name}'**
  String sharingApkFor(String name);

  /// No description provided for @establishingProxyTunnel.
  ///
  /// In en, this message translates to:
  /// **'Establishing secure proxy tunnel...'**
  String get establishingProxyTunnel;

  /// No description provided for @remoteUploadFailedFor.
  ///
  /// In en, this message translates to:
  /// **'Upload failed for: {path}'**
  String remoteUploadFailedFor(String path);

  /// No description provided for @remoteDownloadFailedFor.
  ///
  /// In en, this message translates to:
  /// **'Download failed for: {path}'**
  String remoteDownloadFailedFor(String path);

  /// No description provided for @sdCardWithUsbNamed.
  ///
  /// In en, this message translates to:
  /// **'SD Card / USB ({name})'**
  String sdCardWithUsbNamed(String name);

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
  /// **'Settings backed up to OpenFile/Backups/Settings/nfile_settings_backup.json'**
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
  /// **'Save all your current settings to OpenFile/Backups/Settings/'**
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
  /// **'Select a beautiful typeface to customize OpenFile\\\'s overall visual theme'**
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

  /// No description provided for @ftpServerStopped.
  ///
  /// In en, this message translates to:
  /// **'FTP Server stopped successfully'**
  String get ftpServerStopped;

  /// No description provided for @ftpServerStartedAt.
  ///
  /// In en, this message translates to:
  /// **'FTP Server started at {address}'**
  String ftpServerStartedAt(String address);

  /// No description provided for @errorStartingFtpServer.
  ///
  /// In en, this message translates to:
  /// **'Error starting FTP Server: {error}'**
  String errorStartingFtpServer(String error);

  /// No description provided for @stopServerBeforeChanging.
  ///
  /// In en, this message translates to:
  /// **'Please stop the server before changing configuration'**
  String get stopServerBeforeChanging;

  /// No description provided for @changePort.
  ///
  /// In en, this message translates to:
  /// **'Change Port'**
  String get changePort;

  /// No description provided for @portNumber.
  ///
  /// In en, this message translates to:
  /// **'Port Number'**
  String get portNumber;

  /// No description provided for @invalidPortNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid port number'**
  String get invalidPortNumber;

  /// No description provided for @setUsername.
  ///
  /// In en, this message translates to:
  /// **'Set Username'**
  String get setUsername;

  /// No description provided for @usernameNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Username cannot be empty'**
  String get usernameNotEmpty;

  /// No description provided for @stopServerBeforeEditing.
  ///
  /// In en, this message translates to:
  /// **'Stop the server before editing settings'**
  String get stopServerBeforeEditing;

  /// No description provided for @ftpShortcutAdded.
  ///
  /// In en, this message translates to:
  /// **'FTP Server shortcut added to home screen!'**
  String get ftpShortcutAdded;

  /// No description provided for @changeDirectory.
  ///
  /// In en, this message translates to:
  /// **'Change directory'**
  String get changeDirectory;

  /// No description provided for @changePortLower.
  ///
  /// In en, this message translates to:
  /// **'Change port'**
  String get changePortLower;

  /// No description provided for @setUser.
  ///
  /// In en, this message translates to:
  /// **'Set user'**
  String get setUser;

  /// No description provided for @anonymousAccess.
  ///
  /// In en, this message translates to:
  /// **'Anonymous access'**
  String get anonymousAccess;

  /// No description provided for @createShortcut.
  ///
  /// In en, this message translates to:
  /// **'Create shortcut'**
  String get createShortcut;

  /// No description provided for @networkStatus.
  ///
  /// In en, this message translates to:
  /// **'Network status'**
  String get networkStatus;

  /// No description provided for @serverAddress.
  ///
  /// In en, this message translates to:
  /// **'Server address'**
  String get serverAddress;

  /// No description provided for @homeDirectory.
  ///
  /// In en, this message translates to:
  /// **'Home directory'**
  String get homeDirectory;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get userName;

  /// No description provided for @showHiddenFilesLower.
  ///
  /// In en, this message translates to:
  /// **'Show hidden files'**
  String get showHiddenFilesLower;

  /// No description provided for @secureFtpHint.
  ///
  /// In en, this message translates to:
  /// **'Secure FTP connection over explicit TLS'**
  String get secureFtpHint;

  /// No description provided for @connectionAdded.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" added successfully!'**
  String connectionAdded(String name);

  /// No description provided for @systemAppDisabled.
  ///
  /// In en, this message translates to:
  /// **'System App Disabled'**
  String get systemAppDisabled;

  /// No description provided for @noDocumentsApp.
  ///
  /// In en, this message translates to:
  /// **'Your device does not have a default System Files/Documents app (DocumentsUI) enabled, which is required by Android to select and mount directories.\n\nPlease check if the \"Files\" or \"Documents\" system app is disabled in your device Settings, or enable it to use SAF directory features.'**
  String get noDocumentsApp;

  /// No description provided for @failedToRequestSafFolder.
  ///
  /// In en, this message translates to:
  /// **'Failed to request SAF folder: {error}'**
  String failedToRequestSafFolder(String error);

  /// No description provided for @enterConnectionName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a connection name'**
  String get enterConnectionName;

  /// No description provided for @enterServerAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter server address / hostname'**
  String get enterServerAddress;

  /// No description provided for @connectedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" connected successfully!'**
  String connectedSuccessfully(String name);

  /// No description provided for @connectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Connection failed: {error}'**
  String connectionFailed(String error);

  /// No description provided for @remoteConnections.
  ///
  /// In en, this message translates to:
  /// **'Remote Connections'**
  String get remoteConnections;

  /// No description provided for @stepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String stepOf(int current, int total);

  /// No description provided for @selectNetworkService.
  ///
  /// In en, this message translates to:
  /// **'Select Network Service'**
  String get selectNetworkService;

  /// No description provided for @selectNetworkServiceHint.
  ///
  /// In en, this message translates to:
  /// **'Mount a remote server or NAS share as a dynamic drive within your OpenFile storage lists.'**
  String get selectNetworkServiceHint;

  /// No description provided for @selectedTypeSettings.
  ///
  /// In en, this message translates to:
  /// **'{type} Settings'**
  String selectedTypeSettings(String type);

  /// No description provided for @enterConnectionDetails.
  ///
  /// In en, this message translates to:
  /// **'Enter connection details to link this network volume.'**
  String get enterConnectionDetails;

  /// No description provided for @connectionNameExample.
  ///
  /// In en, this message translates to:
  /// **'e.g., Office NAS, Home Share'**
  String get connectionNameExample;

  /// No description provided for @connectionPathExample.
  ///
  /// In en, this message translates to:
  /// **'e.g., /dav or /'**
  String get connectionPathExample;

  /// No description provided for @connectionUserExample.
  ///
  /// In en, this message translates to:
  /// **'e.g., anonymous or admin'**
  String get connectionUserExample;

  /// No description provided for @creatingMountPoint.
  ///
  /// In en, this message translates to:
  /// **'Creating Mount Point...'**
  String get creatingMountPoint;

  /// No description provided for @establishingPathway.
  ///
  /// In en, this message translates to:
  /// **'Please wait while we establish a reliable pathway to the {type} server.'**
  String establishingPathway(String type);

  /// No description provided for @httpsSecure.
  ///
  /// In en, this message translates to:
  /// **'HTTPS (Secure)'**
  String get httpsSecure;

  /// No description provided for @deleteItem.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get deleteItem;

  /// No description provided for @deleteRemoteItemQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\" permanently from the server?'**
  String deleteRemoteItemQuestion(String name);

  /// No description provided for @newRemoteFolder.
  ///
  /// In en, this message translates to:
  /// **'New Remote Folder'**
  String get newRemoteFolder;

  /// No description provided for @copyToLocalDevice.
  ///
  /// In en, this message translates to:
  /// **'Copy to Local Device'**
  String get copyToLocalDevice;

  /// No description provided for @copyToLocalDeviceHint.
  ///
  /// In en, this message translates to:
  /// **'Downloads file → local clipboard'**
  String get copyToLocalDeviceHint;

  /// No description provided for @moveToLocalDevice.
  ///
  /// In en, this message translates to:
  /// **'Move to Local Device'**
  String get moveToLocalDevice;

  /// No description provided for @moveToLocalDeviceHint.
  ///
  /// In en, this message translates to:
  /// **'Downloads and deletes from server'**
  String get moveToLocalDeviceHint;

  /// No description provided for @connectionTypeServer.
  ///
  /// In en, this message translates to:
  /// **'{type} Server'**
  String connectionTypeServer(String type);

  /// No description provided for @uploadClipboardToServer.
  ///
  /// In en, this message translates to:
  /// **'Upload local clipboard to server'**
  String get uploadClipboardToServer;

  /// No description provided for @connectionLost.
  ///
  /// In en, this message translates to:
  /// **'Connection Lost'**
  String get connectionLost;

  /// No description provided for @retryConnection.
  ///
  /// In en, this message translates to:
  /// **'Retry Connection'**
  String get retryConnection;

  /// No description provided for @emptyDirectory.
  ///
  /// In en, this message translates to:
  /// **'Empty Directory'**
  String get emptyDirectory;

  /// No description provided for @uploadClipboardHere.
  ///
  /// In en, this message translates to:
  /// **'Upload Clipboard Here'**
  String get uploadClipboardHere;

  /// No description provided for @errorLoadingVault.
  ///
  /// In en, this message translates to:
  /// **'Error loading vault: {error}'**
  String errorLoadingVault(String error);

  /// No description provided for @chooseProtectionMode.
  ///
  /// In en, this message translates to:
  /// **'Choose Protection Mode'**
  String get chooseProtectionMode;

  /// No description provided for @chooseProtectionModeHint.
  ///
  /// In en, this message translates to:
  /// **'Choose how you want to protect your selected files. Secured files are encrypted instantly.'**
  String get chooseProtectionModeHint;

  /// No description provided for @secureImportSandbox.
  ///
  /// In en, this message translates to:
  /// **'Secure Import (Sandbox)'**
  String get secureImportSandbox;

  /// No description provided for @inPlaceScramble.
  ///
  /// In en, this message translates to:
  /// **'In-Place Scramble (Fast)'**
  String get inPlaceScramble;

  /// No description provided for @scramblingProtecting.
  ///
  /// In en, this message translates to:
  /// **'Scrambling & Protecting...'**
  String get scramblingProtecting;

  /// No description provided for @protectedItems.
  ///
  /// In en, this message translates to:
  /// **'Protected {count} items successfully.{failed}'**
  String protectedItems(int count, String failed);

  /// No description provided for @restoredToOriginal.
  ///
  /// In en, this message translates to:
  /// **'Restored \"{name}\" to its original location.'**
  String restoredToOriginal(String name);

  /// No description provided for @failedToRestoreFile.
  ///
  /// In en, this message translates to:
  /// **'Failed to restore file: {error}'**
  String failedToRestoreFile(String error);

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

  /// No description provided for @fileDeletedPermanently.
  ///
  /// In en, this message translates to:
  /// **'File deleted permanently.'**
  String get fileDeletedPermanently;

  /// No description provided for @failedToDeleteFile.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete file: {error}'**
  String failedToDeleteFile(String error);

  /// No description provided for @decryptingSecurely.
  ///
  /// In en, this message translates to:
  /// **'Decrypting securely...'**
  String get decryptingSecurely;

  /// No description provided for @failedToDecryptItem.
  ///
  /// In en, this message translates to:
  /// **'Failed to decrypt and open item: {error}'**
  String failedToDecryptItem(String error);

  /// No description provided for @securityDetails.
  ///
  /// In en, this message translates to:
  /// **'Security Details'**
  String get securityDetails;

  /// No description provided for @searchScrambledFiles.
  ///
  /// In en, this message translates to:
  /// **'Search scrambled files...'**
  String get searchScrambledFiles;

  /// No description provided for @hideFiles.
  ///
  /// In en, this message translates to:
  /// **'Hide Files'**
  String get hideFiles;

  /// No description provided for @securityStorage.
  ///
  /// In en, this message translates to:
  /// **'SECURITY STORAGE'**
  String get securityStorage;

  /// No description provided for @totalSpaceSecured.
  ///
  /// In en, this message translates to:
  /// **'Total Space Secured'**
  String get totalSpaceSecured;

  /// No description provided for @hiddenFiles.
  ///
  /// In en, this message translates to:
  /// **'Hidden Files'**
  String get hiddenFiles;

  /// No description provided for @restoreUnhide.
  ///
  /// In en, this message translates to:
  /// **'Restore (Unhide)'**
  String get restoreUnhide;

  /// No description provided for @deletePermanently.
  ///
  /// In en, this message translates to:
  /// **'Delete Permanently'**
  String get deletePermanently;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @httpServerStopped.
  ///
  /// In en, this message translates to:
  /// **'Local HTTP Sharing Server stopped.'**
  String get httpServerStopped;

  /// No description provided for @httpServerStarted.
  ///
  /// In en, this message translates to:
  /// **'Local HTTP Sharing Server started! URL: {url}'**
  String httpServerStarted(String url);

  /// No description provided for @errorStartingHttpServer.
  ///
  /// In en, this message translates to:
  /// **'Error starting HTTP Server: {error}'**
  String errorStartingHttpServer(String error);

  /// No description provided for @tunnelDeactivated.
  ///
  /// In en, this message translates to:
  /// **'Internet Share Tunnel deactivated.'**
  String get tunnelDeactivated;

  /// No description provided for @establishingRelay.
  ///
  /// In en, this message translates to:
  /// **'Establishing secure proxy relay...'**
  String get establishingRelay;

  /// No description provided for @tunnelOnline.
  ///
  /// In en, this message translates to:
  /// **'Internet cloud tunnel online! Temporary link active.'**
  String get tunnelOnline;

  /// No description provided for @failedToStartCloudShare.
  ///
  /// In en, this message translates to:
  /// **'Failed to start Cloud Share: {error}'**
  String failedToStartCloudShare(String error);

  /// No description provided for @linkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied to clipboard!'**
  String get linkCopied;

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanQrCode;

  /// No description provided for @scanToOpen.
  ///
  /// In en, this message translates to:
  /// **'Scan with another device to open {type} immediately.'**
  String scanToOpen(String type);

  /// No description provided for @webSharingHub.
  ///
  /// In en, this message translates to:
  /// **'Web Sharing Hub'**
  String get webSharingHub;

  /// No description provided for @localWebShare.
  ///
  /// In en, this message translates to:
  /// **'Local Web Share'**
  String get localWebShare;

  /// No description provided for @internetShareLink.
  ///
  /// In en, this message translates to:
  /// **'Internet Share Link'**
  String get internetShareLink;

  /// No description provided for @httpLocalShareServer.
  ///
  /// In en, this message translates to:
  /// **'HTTP Local Share Server'**
  String get httpLocalShareServer;

  /// No description provided for @httpLocalShareServerHint.
  ///
  /// In en, this message translates to:
  /// **'Allows other devices on the same Wi-Fi to access, view, and stream your files in their web browser.'**
  String get httpLocalShareServerHint;

  /// No description provided for @serverOnlineStreaming.
  ///
  /// In en, this message translates to:
  /// **'Server Online & Streaming'**
  String get serverOnlineStreaming;

  /// No description provided for @directBrowserUrl.
  ///
  /// In en, this message translates to:
  /// **'Direct Browser URL:'**
  String get directBrowserUrl;

  /// No description provided for @copyUrl.
  ///
  /// In en, this message translates to:
  /// **'Copy URL'**
  String get copyUrl;

  /// No description provided for @qrCode.
  ///
  /// In en, this message translates to:
  /// **'QR Code'**
  String get qrCode;

  /// No description provided for @sharingDirectory.
  ///
  /// In en, this message translates to:
  /// **'Sharing Directory: {folder}'**
  String sharingDirectory(String folder);

  /// No description provided for @serverIdle.
  ///
  /// In en, this message translates to:
  /// **'Server is Idle'**
  String get serverIdle;

  /// No description provided for @serverIdleHint.
  ///
  /// In en, this message translates to:
  /// **'Make sure other devices are on the same Wi-Fi network as this device, then start the server.'**
  String get serverIdleHint;

  /// No description provided for @internetShareTunnel.
  ///
  /// In en, this message translates to:
  /// **'Internet Share Tunnel'**
  String get internetShareTunnel;

  /// No description provided for @internetShareTunnelHint.
  ///
  /// In en, this message translates to:
  /// **'Generates a secure temporary public tunnel link. Share this link with anyone anywhere on the internet to let them download files high-speed, no matter the file size.'**
  String get internetShareTunnelHint;

  /// No description provided for @cloudTunnelActive.
  ///
  /// In en, this message translates to:
  /// **'Cloud Tunnel Active'**
  String get cloudTunnelActive;

  /// No description provided for @temporaryShareLink.
  ///
  /// In en, this message translates to:
  /// **'Temporary Share Link (Active 24h):'**
  String get temporaryShareLink;

  /// No description provided for @copyLink.
  ///
  /// In en, this message translates to:
  /// **'Copy Link'**
  String get copyLink;

  /// No description provided for @connectedClients.
  ///
  /// In en, this message translates to:
  /// **'Connected Browser Clients'**
  String get connectedClients;

  /// No description provided for @waitingForDownloads.
  ///
  /// In en, this message translates to:
  /// **'Waiting for incoming internet downloads...'**
  String get waitingForDownloads;

  /// No description provided for @internetSharingInactive.
  ///
  /// In en, this message translates to:
  /// **'Internet Sharing Inactive'**
  String get internetSharingInactive;

  /// No description provided for @internetSharingInactiveHint.
  ///
  /// In en, this message translates to:
  /// **'Activate the tunnel to establish a secure link that works beyond local Wi-Fi.'**
  String get internetSharingInactiveHint;

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

  /// No description provided for @deleteVaultFileQuestionHint.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to permanently delete \"{name}\"? This action CANNOT be undone.'**
  String deleteVaultFileQuestionHint(String name);

  /// No description provided for @appManager.
  ///
  /// In en, this message translates to:
  /// **'App Manager'**
  String get appManager;

  /// No description provided for @refreshList.
  ///
  /// In en, this message translates to:
  /// **'Refresh List'**
  String get refreshList;

  /// No description provided for @sortBySize.
  ///
  /// In en, this message translates to:
  /// **'Sort by Size'**
  String get sortBySize;

  /// No description provided for @sortAlphabetically.
  ///
  /// In en, this message translates to:
  /// **'Sort Alphabetically'**
  String get sortAlphabetically;

  /// No description provided for @exactStorageCalculation.
  ///
  /// In en, this message translates to:
  /// **'Exact Storage Calculation'**
  String get exactStorageCalculation;

  /// No description provided for @exactStorageCalculationHint.
  ///
  /// In en, this message translates to:
  /// **'To see exact app storage sizes (APK + data + cache) instead of just the raw installer size, please enable the Usage Access permission for OpenFile in System Settings.'**
  String get exactStorageCalculationHint;

  /// No description provided for @grantUsageAccess.
  ///
  /// In en, this message translates to:
  /// **'Grant Usage Access Permission'**
  String get grantUsageAccess;

  /// No description provided for @storageAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Storage Analytics'**
  String get storageAnalytics;

  /// No description provided for @rescanStorage.
  ///
  /// In en, this message translates to:
  /// **'Rescan Storage'**
  String get rescanStorage;

  /// No description provided for @scanningDeviceStorage.
  ///
  /// In en, this message translates to:
  /// **'Scanning Device Storage'**
  String get scanningDeviceStorage;

  /// No description provided for @analyzingStorage.
  ///
  /// In en, this message translates to:
  /// **'Analyzing files, categorizing assets, and reading installed apps space...'**
  String get analyzingStorage;

  /// No description provided for @totalStorage.
  ///
  /// In en, this message translates to:
  /// **'Total Storage'**
  String get totalStorage;

  /// No description provided for @storageUsedWithPercent.
  ///
  /// In en, this message translates to:
  /// **'{size} used ({percent}%)'**
  String storageUsedWithPercent(String size, String percent);

  /// No description provided for @systemAndOther.
  ///
  /// In en, this message translates to:
  /// **'System / Other'**
  String get systemAndOther;

  /// No description provided for @percentOfTotalStorage.
  ///
  /// In en, this message translates to:
  /// **'{percent}% of total storage'**
  String percentOfTotalStorage(String percent);

  /// No description provided for @uninstallApps.
  ///
  /// In en, this message translates to:
  /// **'Uninstall Apps'**
  String get uninstallApps;

  /// No description provided for @uninstallAppsQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to uninstall {count} selected app(s)?'**
  String uninstallAppsQuestion(int count);

  /// No description provided for @backingUpApps.
  ///
  /// In en, this message translates to:
  /// **'Backing up selected applications...'**
  String get backingUpApps;

  /// No description provided for @backedUpApps.
  ///
  /// In en, this message translates to:
  /// **'Successfully backed up {count} app(s) to OpenFile/Backups/Apps/'**
  String backedUpApps(int count);

  /// No description provided for @failedToBackUpApps.
  ///
  /// In en, this message translates to:
  /// **'Failed to back up some apps: {error}'**
  String failedToBackUpApps(String error);

  /// No description provided for @noApplicationsFound.
  ///
  /// In en, this message translates to:
  /// **'No applications found'**
  String get noApplicationsFound;

  /// No description provided for @packageAndVersion.
  ///
  /// In en, this message translates to:
  /// **'{package} • v{version}'**
  String packageAndVersion(String package, String version);

  /// No description provided for @appSizeAndInstalled.
  ///
  /// In en, this message translates to:
  /// **'Size: {size} • Installed: {date}'**
  String appSizeAndInstalled(String size, String date);

  /// No description provided for @launchApplication.
  ///
  /// In en, this message translates to:
  /// **'Launch Application'**
  String get launchApplication;

  /// No description provided for @systemSettingsDetails.
  ///
  /// In en, this message translates to:
  /// **'System Settings / Details'**
  String get systemSettingsDetails;

  /// No description provided for @backUpApk.
  ///
  /// In en, this message translates to:
  /// **'Back Up APK'**
  String get backUpApk;

  /// No description provided for @backingUpApk.
  ///
  /// In en, this message translates to:
  /// **'Backing up APK...'**
  String get backingUpApk;

  /// No description provided for @shareApkFile.
  ///
  /// In en, this message translates to:
  /// **'Share APK File'**
  String get shareApkFile;

  /// No description provided for @uninstallApplication.
  ///
  /// In en, this message translates to:
  /// **'Uninstall Application'**
  String get uninstallApplication;

  /// No description provided for @backupKindAndVersion.
  ///
  /// In en, this message translates to:
  /// **'{kind} • v{version}'**
  String backupKindAndVersion(String kind, String version);

  /// No description provided for @backupKindAndVersionFull.
  ///
  /// In en, this message translates to:
  /// **'{kind} • v{version}'**
  String backupKindAndVersionFull(String kind, String version);

  /// No description provided for @backupSizeAndDate.
  ///
  /// In en, this message translates to:
  /// **'Size: {size} • Backup Date: {date}'**
  String backupSizeAndDate(String size, String date);

  /// No description provided for @restoreOrInstallApp.
  ///
  /// In en, this message translates to:
  /// **'Restore / Install App'**
  String get restoreOrInstallApp;

  /// No description provided for @shareBackupFile.
  ///
  /// In en, this message translates to:
  /// **'Share Backup File'**
  String get shareBackupFile;

  /// No description provided for @deleteBackupFile.
  ///
  /// In en, this message translates to:
  /// **'Delete Backup File'**
  String get deleteBackupFile;

  /// No description provided for @noBackupsFound.
  ///
  /// In en, this message translates to:
  /// **'No backups found'**
  String get noBackupsFound;

  /// No description provided for @downloadingFile.
  ///
  /// In en, this message translates to:
  /// **'Downloading: {file}'**
  String downloadingFile(String file);

  /// No description provided for @sentBytes.
  ///
  /// In en, this message translates to:
  /// **'Sent: {amount}'**
  String sentBytes(String amount);

  /// No description provided for @exitConfirmationLabel.
  ///
  /// In en, this message translates to:
  /// **'Exit Confirmation'**
  String get exitConfirmationLabel;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionExit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get actionExit;

  /// No description provided for @actionHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get actionHome;

  /// No description provided for @actionBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get actionBrowse;

  /// No description provided for @drawerNavigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get drawerNavigation;

  /// No description provided for @customizationAndSettings.
  ///
  /// In en, this message translates to:
  /// **'Customization & Settings'**
  String get customizationAndSettings;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @categoryImages.
  ///
  /// In en, this message translates to:
  /// **'Images'**
  String get categoryImages;

  /// No description provided for @categoryVideos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get categoryVideos;

  /// No description provided for @categoryAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get categoryAudio;

  /// No description provided for @categoryDocuments.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get categoryDocuments;

  /// No description provided for @categoryArchives.
  ///
  /// In en, this message translates to:
  /// **'Archives'**
  String get categoryArchives;

  /// No description provided for @categoryDownloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get categoryDownloads;

  /// No description provided for @categoryApks.
  ///
  /// In en, this message translates to:
  /// **'APKs'**
  String get categoryApks;

  /// No description provided for @categoryScreenshots.
  ///
  /// In en, this message translates to:
  /// **'Screenshots'**
  String get categoryScreenshots;

  /// No description provided for @categoryApps.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get categoryApps;

  /// No description provided for @categoryManager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get categoryManager;

  /// No description provided for @categoryBin.
  ///
  /// In en, this message translates to:
  /// **'Bin'**
  String get categoryBin;

  /// No description provided for @categorySettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get categorySettings;

  /// No description provided for @categoryConfigure.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get categoryConfigure;

  /// No description provided for @itemFolder.
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get itemFolder;

  /// No description provided for @itemFile.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get itemFile;

  /// No description provided for @actionCustomize.
  ///
  /// In en, this message translates to:
  /// **'Customize'**
  String get actionCustomize;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @actionRename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get actionRename;

  /// No description provided for @searchGloballyHint.
  ///
  /// In en, this message translates to:
  /// **'Search globally...'**
  String get searchGloballyHint;

  /// No description provided for @searchInFolderHint.
  ///
  /// In en, this message translates to:
  /// **'Search in this folder...'**
  String get searchInFolderHint;

  /// No description provided for @actionCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get actionCopy;

  /// No description provided for @actionCut.
  ///
  /// In en, this message translates to:
  /// **'Cut'**
  String get actionCut;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get actionShare;

  /// No description provided for @actionProperties.
  ///
  /// In en, this message translates to:
  /// **'Properties'**
  String get actionProperties;

  /// No description provided for @allRecentFiles.
  ///
  /// In en, this message translates to:
  /// **'All Recent Files'**
  String get allRecentFiles;

  /// No description provided for @actionRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get actionRefresh;

  /// No description provided for @deleteItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get deleteItemLabel;

  /// No description provided for @closeSearch.
  ///
  /// In en, this message translates to:
  /// **'Close Search'**
  String get closeSearch;

  /// No description provided for @searchInPane.
  ///
  /// In en, this message translates to:
  /// **'Search in Pane'**
  String get searchInPane;

  /// No description provided for @searchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchPlaceholder;

  /// No description provided for @unpinTab.
  ///
  /// In en, this message translates to:
  /// **'Unpin Tab'**
  String get unpinTab;

  /// No description provided for @pinTab.
  ///
  /// In en, this message translates to:
  /// **'Pin Tab'**
  String get pinTab;

  /// No description provided for @openWithAlways.
  ///
  /// In en, this message translates to:
  /// **'Always'**
  String get openWithAlways;

  /// No description provided for @actionArchive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get actionArchive;

  /// No description provided for @actionExtract.
  ///
  /// In en, this message translates to:
  /// **'Extract'**
  String get actionExtract;

  /// No description provided for @timeJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get timeJustNow;

  /// No description provided for @timeYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get timeYesterday;

  /// No description provided for @timeMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 minute ago} other{{count} minutes ago}}'**
  String timeMinutesAgo(num count);

  /// No description provided for @timeHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hour ago} other{{count} hours ago}}'**
  String timeHoursAgo(num count);

  /// No description provided for @timeDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day ago} other{{count} days ago}}'**
  String timeDaysAgo(num count);

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'OpenFile - Beautiful File Manager'**
  String get appTagline;

  /// No description provided for @localFolder.
  ///
  /// In en, this message translates to:
  /// **'Local Folder'**
  String get localFolder;

  /// No description provided for @unknownArtist.
  ///
  /// In en, this message translates to:
  /// **'Unknown Artist'**
  String get unknownArtist;

  /// No description provided for @sdCardOrUsb.
  ///
  /// In en, this message translates to:
  /// **'SD Card / USB'**
  String get sdCardOrUsb;

  /// No description provided for @connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get connecting;

  /// No description provided for @starting.
  ///
  /// In en, this message translates to:
  /// **'Starting...'**
  String get starting;

  /// No description provided for @dateDayMonth.
  ///
  /// In en, this message translates to:
  /// **'{day} {month}'**
  String dateDayMonth(int day, String month);

  /// No description provided for @monthJanuary.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthJanuary;

  /// No description provided for @monthFebruary.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthFebruary;

  /// No description provided for @monthMarch.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthMarch;

  /// No description provided for @monthApril.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthApril;

  /// No description provided for @monthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// No description provided for @monthJune.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthJune;

  /// No description provided for @monthJuly.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthJuly;

  /// No description provided for @monthAugust.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthAugust;

  /// No description provided for @monthSeptember.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthSeptember;

  /// No description provided for @monthOctober.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthOctober;

  /// No description provided for @monthNovember.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthNovember;

  /// No description provided for @monthDecember.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthDecember;
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
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

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
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
