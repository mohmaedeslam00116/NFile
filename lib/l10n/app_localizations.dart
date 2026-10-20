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
