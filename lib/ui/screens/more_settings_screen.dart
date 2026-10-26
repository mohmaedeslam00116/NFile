import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/file_manager_provider.dart';
import '../../core/icon_fonts/broken_icons.dart';
import '../../core/utils.dart';
import '../widgets/quick_categories_grid.dart';
import '../../services/preferences_service.dart';
import '../widgets/nfile_icon.dart';
import '../../services/recycle_bin_service.dart';
import 'package:path/path.dart' as p;
import 'internal_file_picker_screen.dart';
import 'backup_settings_screen.dart';
import '../../services/settings_backup_service.dart';

class MoreSettingsScreen extends StatefulWidget {
  const MoreSettingsScreen({super.key});

  @override
  State<MoreSettingsScreen> createState() => _MoreSettingsScreenState();
}

class _MoreSettingsScreenState extends State<MoreSettingsScreen> {
  bool _preferFolders = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _preferFolders = PreferencesService.getPreferFoldersInMedia();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _shouldShow(String title, String subtitle) {
    if (_searchQuery.isEmpty) return true;
    final query = _searchQuery.toLowerCase();
    return title.toLowerCase().contains(query) || subtitle.toLowerCase().contains(query);
  }

  bool _shouldShowHeader(List<bool> visibilities) {
    if (_searchQuery.isEmpty) return true;
    return visibilities.contains(true);
  }

  Widget _buildCategoryCard(
    BuildContext context,
    ThemeData theme, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget targetScreen,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: theme.colorScheme.surface.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 22),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
          ),
        ),
        trailing: Icon(Icons.chevron_right_rounded, color: theme.colorScheme.onSurface.withValues(alpha: 0.4), size: 22),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => targetScreen),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileManager = context.watch<FileManagerProvider>();

    // Visibilities for global search filtering
    final showAddressBarVis = _shouldShow(AppLocalizations.of(context).showAddressBar, AppLocalizations.of(context).showAddressBarHint);
    final preferFoldersVis = _shouldShow(AppLocalizations.of(context).defaultAlbumView, AppLocalizations.of(context).defaultAlbumViewHint);
    final hideNavBarVis = _shouldShow(AppLocalizations.of(context).hideAndroidNavBar, AppLocalizations.of(context).hideAndroidNavBarHint);
    final resetViewersVis = _shouldShow(AppLocalizations.of(context).resetDefaultViewers, AppLocalizations.of(context).resetDefaultViewersHint);
    final skipDialogVis = _shouldShow(AppLocalizations.of(context).skipOpenWithDialog, AppLocalizations.of(context).skipOpenWithDialogHint);
    final defaultBrowseVis = _shouldShow(AppLocalizations.of(context).defaultToBrowseScreen, AppLocalizations.of(context).defaultToBrowseScreenHint);
    final showFloatingVis = _shouldShow(AppLocalizations.of(context).showFloatingAddButton, AppLocalizations.of(context).showFloatingAddButtonHint);
    final showHiddenVis = _shouldShow(AppLocalizations.of(context).showHiddenFiles, AppLocalizations.of(context).showHiddenFilesHint);
    final folderFileCountVis = _shouldShow(AppLocalizations.of(context).showCountHeader, AppLocalizations.of(context).showCountHeaderHint);
    final use24HourVis = _shouldShow(AppLocalizations.of(context).use24HourTime, AppLocalizations.of(context).use24HourTimeHint);
    final hideTimeDateVis = _shouldShow(AppLocalizations.of(context).hideTimeAndDate, AppLocalizations.of(context).hideTimeAndDateHint);
    final folderContentsVis = _shouldShow(AppLocalizations.of(context).showFolderContentCount, AppLocalizations.of(context).showFolderContentCountHint);
    final folderSizesVis = _shouldShow(AppLocalizations.of(context).showFolderSize, AppLocalizations.of(context).showFolderSizeHint);
    final bottomActionBarVis = _shouldShow(AppLocalizations.of(context).showBottomNavBar, AppLocalizations.of(context).showBottomNavBarHint);
    final hideActionTextVis = _shouldShow(AppLocalizations.of(context).hideActionBarLabels, AppLocalizations.of(context).hideActionBarLabelsHint);
    final showHomeBrowseNavVis = _shouldShow(AppLocalizations.of(context).showHomeBrowseBottomBar, AppLocalizations.of(context).showHomeBrowseBottomBarHint);
    final highlightFolderVis = _shouldShow(AppLocalizations.of(context).highlightExitedFolder, AppLocalizations.of(context).highlightExitedFolderHint);
    final mediaPreviewsVis = _shouldShow(AppLocalizations.of(context).showMediaPreviews, AppLocalizations.of(context).showMediaPreviewsHint);
    final adaptiveNamesVis = _shouldShow(AppLocalizations.of(context).adaptiveMultiLineNames, AppLocalizations.of(context).adaptiveMultiLineNamesHint);
    final hideActionButtonsVis = _shouldShow(AppLocalizations.of(context).hideThreeDotButtons, AppLocalizations.of(context).hideThreeDotButtonsHint);
    final trailingInfoVis = fileManager.hideActionMenuButtons && _shouldShow(AppLocalizations.of(context).threeDotTrailingInfo, AppLocalizations.of(context).settingsTrailingInfoHint);
    final dragDropVis = _shouldShow(AppLocalizations.of(context).enableDragAndDrop, AppLocalizations.of(context).enableDragAndDropHint);
    final confirmDragVis = fileManager.enableDragDrop && _shouldShow(AppLocalizations.of(context).confirmDragAndDrop, AppLocalizations.of(context).confirmDragAndDropHint);
    final multipleTabsVis = _shouldShow(AppLocalizations.of(context).enableMultipleTabs, AppLocalizations.of(context).enableMultipleTabsHint);
    final splitScreenVis = _shouldShow(AppLocalizations.of(context).enableSplitScreen, AppLocalizations.of(context).enableSplitScreenHint);
    final disableLeftBackVis = _shouldShow(AppLocalizations.of(context).preventLeftBackGesture, AppLocalizations.of(context).preventLeftBackGestureHint);
    final rememberLastFolderVis = _shouldShow(AppLocalizations.of(context).rememberLastFolder, AppLocalizations.of(context).rememberLastFolderHint);
    final hideNavLabelsVis = _shouldShow(AppLocalizations.of(context).hideBottomNavLabels, AppLocalizations.of(context).hideBottomNavLabelsHint);
    final exitOptionVis = _shouldShow(AppLocalizations.of(context).appExitBehavior, AppLocalizations.of(context).settingsExitBehaviourHint);

    final generalStartupList = [
      defaultBrowseVis,
      rememberLastFolderVis,
      showHomeBrowseNavVis,
      hideNavLabelsVis,
      hideNavBarVis,
      disableLeftBackVis,
      exitOptionVis,
    ];

    final fileExplorerList = [
      showAddressBarVis,
      showFloatingVis,
      showHiddenVis,
      highlightFolderVis,
      multipleTabsVis,
      splitScreenVis,
      dragDropVis,
      confirmDragVis,
    ];

    final listLayoutList = [
      folderFileCountVis,
      folderContentsVis,
      folderSizesVis,
      use24HourVis,
      hideTimeDateVis,
      adaptiveNamesVis,
      hideActionButtonsVis,
      trailingInfoVis,
    ];

    final mediaActionsList = [
      preferFoldersVis,
      mediaPreviewsVis,
      skipDialogVis,
      resetViewersVis,
    ];

    final selectionActionBarList = [
      bottomActionBarVis,
      hideActionTextVis,
    ];

    final recycleBinVis = _shouldShow(AppLocalizations.of(context).enableRecycleBin, AppLocalizations.of(context).enableRecycleBinHint);
    final autoDeleteDurationVis = RecycleBinService.isEnabled() && _shouldShow(AppLocalizations.of(context).autoDeleteDuration, _getAutoDeleteDaysLabel(context, RecycleBinService.getAutoDeleteDays()));
    final recycleBinList = [recycleBinVis, autoDeleteDurationVis];

    final accentColorVis = _shouldShow(AppLocalizations.of(context).accentColorDynamicTheme, _getAccentColorLabel(context, fileManager.accentColorOption));
    final folderIconVis = _shouldShow(AppLocalizations.of(context).folderIconStyle, _getFolderIconLabel(context, fileManager.folderIconOption));
    final menuIconStyleVis = _shouldShow(AppLocalizations.of(context).drawerButtonStyle, _getMenuIconStyleLabel(context, fileManager.menuIconStyle));
    final amoledVis = _shouldShow(AppLocalizations.of(context).amoledBlackMode, AppLocalizations.of(context).amoledBlackModeHint);
    final appIconVis = _shouldShow(AppLocalizations.of(context).appIcon, _getAppIconLabel(context, fileManager.activeAppIcon));
    final typographyVis = _shouldShow(AppLocalizations.of(context).appTypographyFontFamily, _getFontFamilyLabel(context, fileManager.fontFamilyOption));
    final appearanceList = [accentColorVis, folderIconVis, menuIconStyleVis, amoledVis, appIconVis, typographyVis];

    final customizeShortcutsVis = _shouldShow(AppLocalizations.of(context).customizeShortcuts, AppLocalizations.of(context).customizeShortcutsHint);
    final showRecentVis = _shouldShow(AppLocalizations.of(context).showRecentFiles, AppLocalizations.of(context).showRecentFilesHint);
    final homeScreenList = [customizeShortcutsVis, showRecentVis];

    final backupSettingsVis = _shouldShow(AppLocalizations.of(context).backupSettings, AppLocalizations.of(context).backupSettingsHint);
    final restoreSettingsVis = _shouldShow(AppLocalizations.of(context).restoreSettings, AppLocalizations.of(context).restoreSettingsHint);

    final hasAnyMatch = generalStartupList.contains(true) ||
        fileExplorerList.contains(true) ||
        listLayoutList.contains(true) ||
        mediaActionsList.contains(true) ||
        selectionActionBarList.contains(true) ||
        recycleBinList.contains(true) ||
        appearanceList.contains(true) ||
        homeScreenList.contains(true) ||
        backupSettingsVis ||
        restoreSettingsVis;

    return PopScope(
      canPop: !_isSearching,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (_isSearching) {
          setState(() {
            _isSearching = false;
            _searchQuery = '';
            _searchController.clear();
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).searchSettings,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val;
                    });
                  },
                )
              : Text(AppLocalizations.of(context).moreSettings),
          leading: IconButton(
            icon: const NfileIcon(Broken.arrow_left),
            onPressed: () {
              if (_isSearching) {
                setState(() {
                  _isSearching = false;
                  _searchQuery = '';
                  _searchController.clear();
                });
              } else {
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            if (_isSearching)
              IconButton(
                icon: const Icon(Icons.clear_rounded),
                onPressed: () {
                  setState(() {
                    if (_searchController.text.isEmpty) {
                      _isSearching = false;
                    } else {
                      _searchController.clear();
                      _searchQuery = '';
                    }
                  });
                },
              )
            else
              IconButton(
                icon: const Icon(Broken.search_normal),
                onPressed: () {
                  setState(() {
                    _isSearching = true;
                  });
                },
              ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            children: [
              if (_searchQuery.isEmpty) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, left: 4.0),
                  child: Text(
                    AppLocalizations.of(context).settingsCategories,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),
                ),
                _buildCategoryCard(
                  context,
                  theme,
                  icon: Broken.setting_2,
                  title: AppLocalizations.of(context).generalAndBehavior,
                  subtitle: AppLocalizations.of(context).generalAndBehaviorHint,
                  targetScreen: const GeneralSettingsScreen(),
                ),
                _buildCategoryCard(
                  context,
                  theme,
                  icon: Broken.colorfilter,
                  title: AppLocalizations.of(context).appearanceAndThemes,
                  subtitle: AppLocalizations.of(context).appearanceAndThemesHint,
                  targetScreen: const AppearanceSettingsScreen(),
                ),
                _buildCategoryCard(
                  context,
                  theme,
                  icon: Broken.folder_open,
                  title: AppLocalizations.of(context).fileExplorerOptions,
                  subtitle: AppLocalizations.of(context).fileExplorerOptionsHint,
                  targetScreen: const ExplorerSettingsScreen(),
                ),
                _buildCategoryCard(
                  context,
                  theme,
                  icon: Broken.text,
                  title: AppLocalizations.of(context).listAndLayoutStyling,
                  subtitle: AppLocalizations.of(context).listAndLayoutStylingHint,
                  targetScreen: const LayoutSettingsScreen(),
                ),
                _buildCategoryCard(
                  context,
                  theme,
                  icon: Broken.image,
                  title: AppLocalizations.of(context).mediaPreferences,
                  subtitle: AppLocalizations.of(context).mediaPreferencesHint,
                  targetScreen: const MediaSettingsScreen(),
                ),
                _buildCategoryCard(
                  context,
                  theme,
                  icon: Broken.setting_3,
                  title: AppLocalizations.of(context).fileActionsAndViewers,
                  subtitle: AppLocalizations.of(context).fileActionsAndViewersHint,
                  targetScreen: const ActionsSettingsScreen(),
                ),
                _buildCategoryCard(
                  context,
                  theme,
                  icon: Broken.trash,
                  title: AppLocalizations.of(context).recycleBinTrash,
                  subtitle: AppLocalizations.of(context).recycleBinTrashHint,
                  targetScreen: const TrashSettingsScreen(),
                ),
                _buildCategoryCard(
                  context,
                  theme,
                  icon: Broken.document_upload,
                  title: AppLocalizations.of(context).backupAndRestore,
                  subtitle: AppLocalizations.of(context).backupAndRestoreHint,
                  targetScreen: const BackupSettingsScreen(),
                ),
              ] else ...[
                if (!hasAnyMatch) ...[
                  const SizedBox(height: 60),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(alpha: 0.08),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Broken.search_normal,
                            size: 40,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          AppLocalizations.of(context).noSettingsFound,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          AppLocalizations.of(context).tryAnotherKeyword,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  if (_shouldShowHeader(generalStartupList) || _shouldShowHeader(selectionActionBarList) || _shouldShowHeader(homeScreenList)) ...[
                    _buildSectionHeader(theme, AppLocalizations.of(context).generalAndBehavior),
                    if (defaultBrowseVis)
                      SettingsTile(
                        icon: Broken.folder_favorite,
                        title: AppLocalizations.of(context).defaultToBrowseScreen,
                        subtitle: AppLocalizations.of(context).defaultToBrowseScreenHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.defaultToBrowseScreen,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleDefaultToBrowseScreen(),
                          ),
                        ),
                        onTap: () => fileManager.toggleDefaultToBrowseScreen(),
                      ),
                    if (rememberLastFolderVis)
                      SettingsTile(
                        icon: Broken.folder_open,
                        title: AppLocalizations.of(context).rememberLastFolder,
                        subtitle: AppLocalizations.of(context).rememberLastFolderHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.rememberLastFolder,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleRememberLastFolder(),
                          ),
                        ),
                        onTap: () => fileManager.toggleRememberLastFolder(),
                      ),
                    if (showHomeBrowseNavVis)
                      SettingsTile(
                        icon: Broken.menu,
                        title: AppLocalizations.of(context).showHomeBrowseBottomBar,
                        subtitle: AppLocalizations.of(context).showHomeBrowseBottomBarHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showHomeBrowseNav,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleShowHomeBrowseNav(),
                          ),
                        ),
                        onTap: () => fileManager.toggleShowHomeBrowseNav(),
                      ),
                    if (hideNavLabelsVis)
                      SettingsTile(
                        icon: Broken.menu_1,
                        title: AppLocalizations.of(context).hideBottomNavLabels,
                        subtitle: AppLocalizations.of(context).hideBottomNavLabelsHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.hideNavLabels,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleHideNavLabels(),
                          ),
                        ),
                        onTap: () => fileManager.toggleHideNavLabels(),
                      ),
                    if (hideNavBarVis)
                      SettingsTile(
                        icon: Icons.android,
                        title: AppLocalizations.of(context).hideAndroidNavBar,
                        subtitle: AppLocalizations.of(context).hideAndroidNavBarHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.hideNavigationBar,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleHideNavigationBar(),
                          ),
                        ),
                        onTap: () => fileManager.toggleHideNavigationBar(),
                      ),
                    if (disableLeftBackVis)
                      SettingsTile(
                        icon: Icons.gesture,
                        title: AppLocalizations.of(context).preventLeftBackGesture,
                        subtitle: AppLocalizations.of(context).preventLeftBackGestureHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.disableLeftBackGesture,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleDisableLeftBackGesture(),
                          ),
                        ),
                        onTap: () => fileManager.toggleDisableLeftBackGesture(),
                      ),
                    if (exitOptionVis)
                      SettingsTile(
                        icon: Icons.logout_rounded,
                        title: AppLocalizations.of(context).appExitBehavior,
                        subtitle: fileManager.exitOption == 'confirm'
                            ? AppLocalizations.of(context).settingsShowConfirmation
                            : AppLocalizations.of(context).settingsDoublePressBackHint,
                        onTap: () => _showExitOptionPickerDialog(context, fileManager, theme),
                      ),
                    if (bottomActionBarVis)
                      SettingsTile(
                        icon: Broken.menu,
                        title: AppLocalizations.of(context).showBottomNavBar,
                        subtitle: AppLocalizations.of(context).showBottomNavBarHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showBottomActionBar,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleBottomActionBar(),
                          ),
                        ),
                        onTap: () => fileManager.toggleBottomActionBar(),
                      ),
                    if (hideActionTextVis)
                      SettingsTile(
                        icon: Icons.label_off_rounded,
                        title: AppLocalizations.of(context).hideActionBarLabels,
                        subtitle: AppLocalizations.of(context).hideActionBarLabelsHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.hideActionText,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleHideActionText(),
                          ),
                        ),
                        onTap: () => fileManager.toggleHideActionText(),
                      ),
                    if (customizeShortcutsVis)
                      SettingsTile(
                        icon: Broken.setting_2,
                        title: AppLocalizations.of(context).customizeShortcuts,
                        subtitle: AppLocalizations.of(context).customizeShortcutsHint,
                        onTap: () => QuickCategoriesGrid.showCustomizeDialog(context),
                      ),
                    if (showRecentVis)
                      SettingsTile(
                        icon: Broken.clock,
                        title: AppLocalizations.of(context).showRecentFiles,
                        subtitle: AppLocalizations.of(context).showRecentFilesHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showRecentFiles,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleShowRecentFiles(),
                          ),
                        ),
                        onTap: () => fileManager.toggleShowRecentFiles(),
                      ),
                  ],
                  if (_shouldShowHeader(appearanceList)) ...[
                    const SizedBox(height: 24),
                    _buildSectionHeader(theme, AppLocalizations.of(context).appearanceAndThemes),
                    if (accentColorVis)
                      SettingsTile(
                        icon: Broken.colorfilter,
                        title: AppLocalizations.of(context).accentColorDynamicTheme,
                        subtitle: _getAccentColorLabel(context, fileManager.accentColorOption),
                        onTap: () => _showThemePickerDialog(context, fileManager, theme),
                      ),
                    if (folderIconVis)
                      SettingsTile(
                        icon: FileUtils.getFolderIcon(fileManager.folderIconOption),
                        title: AppLocalizations.of(context).folderIconStyle,
                        subtitle: _getFolderIconLabel(context, fileManager.folderIconOption),
                        onTap: () => _showFolderIconPickerDialog(context, fileManager, theme),
                      ),
                    if (menuIconStyleVis)
                      SettingsTile(
                        icon: Broken.category,
                        title: AppLocalizations.of(context).drawerButtonStyle,
                        subtitle: _getMenuIconStyleLabel(context, fileManager.menuIconStyle),
                        onTap: () => _showMenuIconStylePickerDialog(context, fileManager, theme),
                      ),
                    if (amoledVis)
                      SettingsTile(
                        icon: Broken.moon,
                        title: AppLocalizations.of(context).amoledBlackMode,
                        subtitle: AppLocalizations.of(context).amoledBlackModeHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.amoledMode,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleAmoledMode(),
                          ),
                        ),
                        onTap: () => fileManager.toggleAmoledMode(),
                      ),
                    if (appIconVis)
                      SettingsTile(
                        icon: Broken.category,
                        title: AppLocalizations.of(context).appIcon,
                        subtitle: _getAppIconLabel(context, fileManager.activeAppIcon),
                        onTap: () => _showAppIconPickerDialog(context, fileManager, theme),
                      ),
                    if (typographyVis)
                      SettingsTile(
                        icon: Broken.text,
                        title: AppLocalizations.of(context).appTypographyFontFamily,
                        subtitle: _getFontFamilyLabel(context, fileManager.fontFamilyOption),
                        onTap: () => _showFontFamilyPickerDialog(context, fileManager, theme),
                      ),
                  ],
                  if (_shouldShowHeader(fileExplorerList)) ...[
                    const SizedBox(height: 24),
                    _buildSectionHeader(theme, AppLocalizations.of(context).settingsFileExplorer),
                    if (showAddressBarVis)
                      SettingsTile(
                        icon: Broken.edit,
                        title: AppLocalizations.of(context).showAddressBar,
                        subtitle: AppLocalizations.of(context).showAddressBarHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showAddressBar,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleShowAddressBar(),
                          ),
                        ),
                        onTap: () => fileManager.toggleShowAddressBar(),
                      ),
                    if (showFloatingVis)
                      SettingsTile(
                        icon: Broken.add_square,
                        title: AppLocalizations.of(context).showFloatingAddButton,
                        subtitle: AppLocalizations.of(context).showFloatingAddButtonHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showFloatingAddButton,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleFloatingAddButton(),
                          ),
                        ),
                        onTap: () => fileManager.toggleFloatingAddButton(),
                      ),
                    if (showHiddenVis)
                      SettingsTile(
                        icon: Broken.folder_open,
                        title: AppLocalizations.of(context).showHiddenFiles,
                        subtitle: AppLocalizations.of(context).showHiddenFilesHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showHiddenFiles,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleHiddenFiles(),
                          ),
                        ),
                        onTap: () => fileManager.toggleHiddenFiles(),
                      ),
                    if (highlightFolderVis)
                      SettingsTile(
                        icon: Broken.colorfilter,
                        title: AppLocalizations.of(context).highlightExitedFolder,
                        subtitle: AppLocalizations.of(context).highlightExitedFolderHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.enableFolderHighlight,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleEnableFolderHighlight(),
                          ),
                        ),
                        onTap: () => fileManager.toggleEnableFolderHighlight(),
                      ),
                    if (multipleTabsVis)
                      SettingsTile(
                        icon: Broken.category,
                        title: AppLocalizations.of(context).enableMultipleTabs,
                        subtitle: AppLocalizations.of(context).enableMultipleTabsHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.enableMultipleTabs,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleMultipleTabs(),
                          ),
                        ),
                        onTap: () => fileManager.toggleMultipleTabs(),
                      ),
                    if (splitScreenVis)
                      SettingsTile(
                        icon: Icons.splitscreen,
                        title: AppLocalizations.of(context).enableSplitScreen,
                        subtitle: AppLocalizations.of(context).enableSplitScreenHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.enableSplitScreen,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleSplitScreen(),
                          ),
                        ),
                        onTap: () => fileManager.toggleSplitScreen(),
                      ),
                    if (dragDropVis)
                      SettingsTile(
                        icon: Broken.folder_connection,
                        title: AppLocalizations.of(context).enableDragAndDrop,
                        subtitle: AppLocalizations.of(context).enableDragAndDropHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.enableDragDrop,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleEnableDragDrop(),
                          ),
                        ),
                        onTap: () => fileManager.toggleEnableDragDrop(),
                      ),
                    if (confirmDragVis)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SettingsTile(
                          icon: Broken.task_square,
                          title: AppLocalizations.of(context).confirmDragAndDrop,
                          subtitle: AppLocalizations.of(context).confirmDragAndDropHint,
                          trailing: Transform.scale(
                            scale: 0.85,
                            child: Switch(
                              value: fileManager.showDragDropDialog,
                              activeThumbColor: theme.colorScheme.primary,
                              onChanged: (_) => fileManager.toggleShowDragDropDialog(),
                            ),
                          ),
                          onTap: () => fileManager.toggleShowDragDropDialog(),
                        ),
                      ),
                  ],
                  if (_shouldShowHeader(listLayoutList)) ...[
                    const SizedBox(height: 24),
                    _buildSectionHeader(theme, AppLocalizations.of(context).listAndLayoutStyling),
                    if (folderFileCountVis)
                      SettingsTile(
                        icon: Broken.document_text_1,
                        title: AppLocalizations.of(context).showCountHeader,
                        subtitle: AppLocalizations.of(context).showCountHeaderHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showFolderFileCount,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleFolderFileCount(),
                          ),
                        ),
                        onTap: () => fileManager.toggleFolderFileCount(),
                      ),
                    if (folderContentsVis)
                      SettingsTile(
                        icon: Broken.folder_open,
                        title: AppLocalizations.of(context).showFolderContentCount,
                        subtitle: AppLocalizations.of(context).showFolderContentCountHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showFolderContentsCount,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleFolderContentsCount(),
                          ),
                        ),
                        onTap: () => fileManager.toggleFolderContentsCount(),
                      ),
                    if (folderSizesVis)
                      SettingsTile(
                        icon: Broken.document_text_1,
                        title: AppLocalizations.of(context).showFolderSize,
                        subtitle: AppLocalizations.of(context).showFolderSizeHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showFolderSizes,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleShowFolderSizes(),
                          ),
                        ),
                        onTap: () => fileManager.toggleShowFolderSizes(),
                      ),
                    if (use24HourVis)
                      SettingsTile(
                        icon: Icons.access_time_rounded,
                        title: AppLocalizations.of(context).use24HourTime,
                        subtitle: AppLocalizations.of(context).use24HourTimeHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.use24HourFormat,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleUse24HourFormat(),
                          ),
                        ),
                        onTap: () => fileManager.toggleUse24HourFormat(),
                      ),
                    if (hideTimeDateVis)
                      SettingsTile(
                        icon: Icons.visibility_off_rounded,
                        title: AppLocalizations.of(context).hideTimeAndDate,
                        subtitle: AppLocalizations.of(context).hideTimeAndDateHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.hideTimeAndDate,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleHideTimeAndDate(),
                          ),
                        ),
                        onTap: () => fileManager.toggleHideTimeAndDate(),
                      ),
                    if (adaptiveNamesVis)
                      SettingsTile(
                        icon: Broken.text,
                        title: AppLocalizations.of(context).adaptiveMultiLineNames,
                        subtitle: AppLocalizations.of(context).adaptiveMultiLineNamesHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.adaptiveMultiLineNames,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleAdaptiveMultiLineNames(),
                          ),
                        ),
                        onTap: () => fileManager.toggleAdaptiveMultiLineNames(),
                      ),
                    if (hideActionButtonsVis)
                      SettingsTile(
                        icon: Icons.more_vert_rounded,
                        title: AppLocalizations.of(context).hideThreeDotButtons,
                        subtitle: AppLocalizations.of(context).hideThreeDotButtonsHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.hideActionMenuButtons,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleHideActionMenuButtons(),
                          ),
                        ),
                        onTap: () => fileManager.toggleHideActionMenuButtons(),
                      ),
                    if (trailingInfoVis)
                      SettingsTile(
                        icon: Icons.info_outline_rounded,
                        title: AppLocalizations.of(context).threeDotTrailingInfo,
                        subtitle: _getTrailingInfoTypeLabel(context, fileManager.trailingInfoType),
                        onTap: () => _showTrailingInfoTypePickerDialog(context, fileManager, theme),
                      ),
                  ],
                  if (_shouldShowHeader(mediaActionsList)) ...[
                    const SizedBox(height: 24),
                    _buildSectionHeader(theme, AppLocalizations.of(context).settingsMediaActions),
                    if (preferFoldersVis)
                      SettingsTile(
                        icon: Broken.folder_2,
                        title: AppLocalizations.of(context).defaultAlbumView,
                        subtitle: AppLocalizations.of(context).defaultAlbumViewHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: _preferFolders,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (val) {
                              setState(() {
                                _preferFolders = val;
                              });
                              PreferencesService.savePreferFoldersInMedia(val);
                            },
                          ),
                        ),
                        onTap: () {
                          final val = !_preferFolders;
                          setState(() {
                            _preferFolders = val;
                          });
                          PreferencesService.savePreferFoldersInMedia(val);
                        },
                      ),
                    if (mediaPreviewsVis)
                      SettingsTile(
                        icon: Broken.image,
                        title: AppLocalizations.of(context).showMediaPreviews,
                        subtitle: AppLocalizations.of(context).showMediaPreviewsHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.showMediaPreviews,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleMediaPreviews(),
                          ),
                        ),
                        onTap: () => fileManager.toggleMediaPreviews(),
                      ),
                    if (skipDialogVis)
                      SettingsTile(
                        icon: Broken.setting_3,
                        title: AppLocalizations.of(context).skipOpenWithDialog,
                        subtitle: AppLocalizations.of(context).skipOpenWithDialogHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: fileManager.skipOpenWithDialog,
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (_) => fileManager.toggleSkipOpenWithDialog(),
                          ),
                        ),
                        onTap: () => fileManager.toggleSkipOpenWithDialog(),
                      ),
                    if (resetViewersVis)
                      SettingsTile(
                        icon: Broken.refresh_2,
                        title: AppLocalizations.of(context).resetDefaultViewers,
                        subtitle: AppLocalizations.of(context).resetDefaultViewersHint,
                        onTap: () async {
                          await PreferencesService.clearAllDefaultOpenActions();
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(AppLocalizations.of(context).viewersReset),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                      ),
                  ],
                  if (_shouldShowHeader(recycleBinList)) ...[
                    const SizedBox(height: 24),
                    _buildSectionHeader(theme, AppLocalizations.of(context).recycleBinTrash),
                    if (recycleBinVis)
                      SettingsTile(
                        icon: Broken.trash,
                        title: AppLocalizations.of(context).enableRecycleBin,
                        subtitle: AppLocalizations.of(context).enableRecycleBinHint,
                        trailing: Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: RecycleBinService.isEnabled(),
                            activeThumbColor: theme.colorScheme.primary,
                            onChanged: (val) {
                              setState(() {
                                RecycleBinService.setEnabled(val);
                              });
                            },
                          ),
                        ),
                        onTap: () {
                          final val = !RecycleBinService.isEnabled();
                          setState(() {
                            RecycleBinService.setEnabled(val);
                          });
                        },
                      ),
                    if (autoDeleteDurationVis)
                      SettingsTile(
                        icon: Icons.access_time_rounded,
                        title: AppLocalizations.of(context).autoDeleteDuration,
                        subtitle: _getAutoDeleteDaysLabel(context, RecycleBinService.getAutoDeleteDays()),
                        onTap: () => _showAutoDeleteDaysPickerDialog(context, theme, () {
                          setState(() {});
                        }),
                      ),
                  ],
                  if (_shouldShowHeader([backupSettingsVis, restoreSettingsVis])) ...[
                    const SizedBox(height: 24),
                    _buildSectionHeader(theme, AppLocalizations.of(context).backupAndRestore),
                    if (backupSettingsVis)
                      SettingsTile(
                        icon: Broken.document_upload,
                        title: AppLocalizations.of(context).backupSettings,
                        subtitle: AppLocalizations.of(context).backupSettingsHint,
                        onTap: () => SettingsBackupService.backupSettings(context),
                      ),
                    if (restoreSettingsVis)
                      SettingsTile(
                        icon: Broken.document_download,
                        title: AppLocalizations.of(context).restoreSettings,
                        subtitle: AppLocalizations.of(context).restoreSettingsHint,
                        onTap: () async {
                          final pickedPaths = await InternalFilePickerScreen.show(
                            context,
                            rootPath: '/storage/emulated/0',
                            pickDirectory: false,
                          );

                          if (pickedPaths != null && pickedPaths.isNotEmpty) {
                            final selectedPath = pickedPaths.first;
                            if (selectedPath.toLowerCase().endsWith('.json')) {
                              if (context.mounted) {
                                await SettingsBackupService.restoreSettings(context, selectedPath);
                              }
                            } else {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(AppLocalizations.of(context).selectValidBackupFile),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: theme.colorScheme.error,
                                  ),
                                );
                              }
                            }
                          }
                        },
                      ),
                  ],
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: theme.colorScheme.primary.withValues(alpha: 0.8),
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

// ----------------------------------------------------
// Reusable Settings Tile
// ----------------------------------------------------
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: theme.colorScheme.surface.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: NfileIcon(icon, color: theme.colorScheme.primary, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 13, color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
        trailing: trailing != null ? IgnorePointer(child: trailing) : null,
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

// ----------------------------------------------------
// Sub-Category Settings Screens
// ----------------------------------------------------

class GeneralSettingsScreen extends StatelessWidget {
  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileManager = context.watch<FileManagerProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).generalAndBehavior),
        leading: IconButton(
          icon: const NfileIcon(Broken.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            SettingsTile(
              icon: Broken.folder_favorite,
              title: AppLocalizations.of(context).defaultToBrowseScreen,
              subtitle: AppLocalizations.of(context).defaultToBrowseScreenHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.defaultToBrowseScreen,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleDefaultToBrowseScreen(),
                ),
              ),
              onTap: () => fileManager.toggleDefaultToBrowseScreen(),
            ),
            SettingsTile(
              icon: Broken.folder_open,
              title: AppLocalizations.of(context).rememberLastFolder,
              subtitle: AppLocalizations.of(context).rememberLastFolderHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.rememberLastFolder,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleRememberLastFolder(),
                ),
              ),
              onTap: () => fileManager.toggleRememberLastFolder(),
            ),
            SettingsTile(
              icon: Broken.menu,
              title: AppLocalizations.of(context).showHomeBrowseBottomBar,
              subtitle: AppLocalizations.of(context).showHomeBrowseBottomBarHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showHomeBrowseNav,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleShowHomeBrowseNav(),
                ),
              ),
              onTap: () => fileManager.toggleShowHomeBrowseNav(),
            ),
            SettingsTile(
              icon: Broken.menu_1,
              title: AppLocalizations.of(context).hideBottomNavLabels,
              subtitle: AppLocalizations.of(context).hideBottomNavLabelsHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.hideNavLabels,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleHideNavLabels(),
                ),
              ),
              onTap: () => fileManager.toggleHideNavLabels(),
            ),
            SettingsTile(
              icon: Icons.android,
              title: AppLocalizations.of(context).hideAndroidNavBar,
              subtitle: AppLocalizations.of(context).hideAndroidNavBarHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.hideNavigationBar,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleHideNavigationBar(),
                ),
              ),
              onTap: () => fileManager.toggleHideNavigationBar(),
            ),
            SettingsTile(
              icon: Broken.menu,
              title: AppLocalizations.of(context).showBottomNavBar,
              subtitle: AppLocalizations.of(context).showBottomNavBarHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showBottomActionBar,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleBottomActionBar(),
                ),
              ),
              onTap: () => fileManager.toggleBottomActionBar(),
            ),
            SettingsTile(
              icon: Icons.label_off_rounded,
              title: AppLocalizations.of(context).hideActionBarLabels,
              subtitle: AppLocalizations.of(context).hideActionBarLabelsHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.hideActionText,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleHideActionText(),
                ),
              ),
              onTap: () => fileManager.toggleHideActionText(),
            ),
            SettingsTile(
              icon: Broken.setting_2,
              title: AppLocalizations.of(context).customizeShortcuts,
              subtitle: AppLocalizations.of(context).customizeShortcutsHint,
              onTap: () => QuickCategoriesGrid.showCustomizeDialog(context),
            ),
            SettingsTile(
              icon: Broken.clock,
              title: AppLocalizations.of(context).showRecentFiles,
              subtitle: AppLocalizations.of(context).showRecentFilesHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showRecentFiles,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleShowRecentFiles(),
                ),
              ),
              onTap: () => fileManager.toggleShowRecentFiles(),
            ),
            SettingsTile(
              icon: Icons.gesture,
              title: AppLocalizations.of(context).preventLeftBackGesture,
              subtitle: AppLocalizations.of(context).preventLeftBackGestureHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.disableLeftBackGesture,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleDisableLeftBackGesture(),
                ),
              ),
              onTap: () => fileManager.toggleDisableLeftBackGesture(),
            ),
            SettingsTile(
              icon: Icons.logout_rounded,
              title: AppLocalizations.of(context).appExitBehavior,
              subtitle: fileManager.exitOption == 'confirm'
                  ? AppLocalizations.of(context).settingsShowConfirmation
                  : AppLocalizations.of(context).settingsDoublePressBackHint,
              onTap: () => _showExitOptionPickerDialog(context, fileManager, theme),
            ),
          ],
        ),
      ),
    );
  }
}

class AppearanceSettingsScreen extends StatelessWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileManager = context.watch<FileManagerProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appearanceAndThemes),
        leading: IconButton(
          icon: const NfileIcon(Broken.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            SettingsTile(
              icon: Broken.colorfilter,
              title: AppLocalizations.of(context).accentColorDynamicTheme,
              subtitle: _getAccentColorLabel(context, fileManager.accentColorOption),
              onTap: () => _showThemePickerDialog(context, fileManager, theme),
            ),
            SettingsTile(
              icon: FileUtils.getFolderIcon(fileManager.folderIconOption),
              title: AppLocalizations.of(context).folderIconStyle,
              subtitle: _getFolderIconLabel(context, fileManager.folderIconOption),
              onTap: () => _showFolderIconPickerDialog(context, fileManager, theme),
            ),
            SettingsTile(
              icon: Broken.category,
              title: AppLocalizations.of(context).drawerButtonStyle,
              subtitle: _getMenuIconStyleLabel(context, fileManager.menuIconStyle),
              onTap: () => _showMenuIconStylePickerDialog(context, fileManager, theme),
            ),
            SettingsTile(
              icon: Broken.moon,
              title: AppLocalizations.of(context).amoledBlackMode,
              subtitle: AppLocalizations.of(context).amoledBlackModeHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.amoledMode,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleAmoledMode(),
                ),
              ),
              onTap: () => fileManager.toggleAmoledMode(),
            ),
            SettingsTile(
              icon: Broken.category,
              title: AppLocalizations.of(context).appIcon,
              subtitle: _getAppIconLabel(context, fileManager.activeAppIcon),
              onTap: () => _showAppIconPickerDialog(context, fileManager, theme),
            ),
            SettingsTile(
              icon: Broken.text,
              title: AppLocalizations.of(context).appTypographyFontFamily,
              subtitle: _getFontFamilyLabel(context, fileManager.fontFamilyOption),
              onTap: () => _showFontFamilyPickerDialog(context, fileManager, theme),
            ),
            SettingsTile(
              icon: Broken.setting,
              title: AppLocalizations.of(context).useExpressiveIcons,
              subtitle: AppLocalizations.of(context).useExpressiveIconsHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.useMaterialIcons,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (val) => fileManager.setUseMaterialIcons(val),
                ),
              ),
              onTap: () => fileManager.setUseMaterialIcons(!fileManager.useMaterialIcons),
            ),
          ],
        ),
      ),
    );
  }
}

class ExplorerSettingsScreen extends StatelessWidget {
  const ExplorerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileManager = context.watch<FileManagerProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).fileExplorerOptions),
        leading: IconButton(
          icon: const NfileIcon(Broken.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            SettingsTile(
              icon: Broken.edit,
              title: AppLocalizations.of(context).showAddressBar,
              subtitle: AppLocalizations.of(context).showAddressBarHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showAddressBar,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleShowAddressBar(),
                ),
              ),
              onTap: () => fileManager.toggleShowAddressBar(),
            ),
            SettingsTile(
              icon: Broken.add_square,
              title: AppLocalizations.of(context).showFloatingAddButton,
              subtitle: AppLocalizations.of(context).showFloatingAddButtonHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showFloatingAddButton,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleFloatingAddButton(),
                ),
              ),
              onTap: () => fileManager.toggleFloatingAddButton(),
            ),
            SettingsTile(
              icon: Broken.folder_open,
              title: AppLocalizations.of(context).showHiddenFiles,
              subtitle: AppLocalizations.of(context).showHiddenFilesHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showHiddenFiles,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleHiddenFiles(),
                ),
              ),
              onTap: () => fileManager.toggleHiddenFiles(),
            ),
            SettingsTile(
              icon: Broken.colorfilter,
              title: AppLocalizations.of(context).highlightExitedFolder,
              subtitle: AppLocalizations.of(context).highlightExitedFolderHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.enableFolderHighlight,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleEnableFolderHighlight(),
                ),
              ),
              onTap: () => fileManager.toggleEnableFolderHighlight(),
            ),
            SettingsTile(
              icon: Broken.category,
              title: AppLocalizations.of(context).enableMultipleTabs,
              subtitle: AppLocalizations.of(context).enableMultipleTabsHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.enableMultipleTabs,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleMultipleTabs(),
                ),
              ),
              onTap: () => fileManager.toggleMultipleTabs(),
            ),
            SettingsTile(
              icon: Icons.splitscreen,
              title: AppLocalizations.of(context).enableSplitScreen,
              subtitle: AppLocalizations.of(context).enableSplitScreenHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.enableSplitScreen,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleSplitScreen(),
                ),
              ),
              onTap: () => fileManager.toggleSplitScreen(),
            ),
            SettingsTile(
              icon: Broken.folder_connection,
              title: AppLocalizations.of(context).enableDragAndDrop,
              subtitle: AppLocalizations.of(context).enableDragAndDropHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.enableDragDrop,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleEnableDragDrop(),
                ),
              ),
              onTap: () => fileManager.toggleEnableDragDrop(),
            ),
            if (fileManager.enableDragDrop)
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SettingsTile(
                  icon: Broken.task_square,
                  title: AppLocalizations.of(context).confirmDragAndDrop,
                  subtitle: AppLocalizations.of(context).confirmDragAndDropHint,
                  trailing: Transform.scale(
                    scale: 0.85,
                    child: Switch(
                      value: fileManager.showDragDropDialog,
                      activeThumbColor: theme.colorScheme.primary,
                      onChanged: (_) => fileManager.toggleShowDragDropDialog(),
                    ),
                  ),
                  onTap: () => fileManager.toggleShowDragDropDialog(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LayoutSettingsScreen extends StatelessWidget {
  const LayoutSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileManager = context.watch<FileManagerProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).listAndLayoutStyling),
        leading: IconButton(
          icon: const NfileIcon(Broken.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            SettingsTile(
              icon: Broken.document_text_1,
              title: AppLocalizations.of(context).showCountHeader,
              subtitle: AppLocalizations.of(context).showCountHeaderHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showFolderFileCount,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleFolderFileCount(),
                ),
              ),
              onTap: () => fileManager.toggleFolderFileCount(),
            ),
            SettingsTile(
              icon: Broken.folder_open,
              title: AppLocalizations.of(context).showFolderContentCount,
              subtitle: AppLocalizations.of(context).showFolderContentCountHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showFolderContentsCount,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleFolderContentsCount(),
                ),
              ),
              onTap: () => fileManager.toggleFolderContentsCount(),
            ),
            SettingsTile(
              icon: Broken.document_text_1,
              title: AppLocalizations.of(context).showFolderSize,
              subtitle: AppLocalizations.of(context).showFolderSizeHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showFolderSizes,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleShowFolderSizes(),
                ),
              ),
              onTap: () => fileManager.toggleShowFolderSizes(),
            ),
            SettingsTile(
              icon: Icons.access_time_rounded,
              title: AppLocalizations.of(context).use24HourTime,
              subtitle: AppLocalizations.of(context).use24HourTimeHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.use24HourFormat,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleUse24HourFormat(),
                ),
              ),
              onTap: () => fileManager.toggleUse24HourFormat(),
            ),
            SettingsTile(
              icon: Icons.visibility_off_rounded,
              title: AppLocalizations.of(context).hideTimeAndDate,
              subtitle: AppLocalizations.of(context).hideTimeAndDateHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.hideTimeAndDate,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleHideTimeAndDate(),
                ),
              ),
              onTap: () => fileManager.toggleHideTimeAndDate(),
            ),
            SettingsTile(
              icon: Broken.text,
              title: AppLocalizations.of(context).adaptiveMultiLineNames,
              subtitle: AppLocalizations.of(context).adaptiveMultiLineNamesHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.adaptiveMultiLineNames,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleAdaptiveMultiLineNames(),
                ),
              ),
              onTap: () => fileManager.toggleAdaptiveMultiLineNames(),
            ),
            SettingsTile(
              icon: Icons.more_vert_rounded,
              title: AppLocalizations.of(context).hideThreeDotButtons,
              subtitle: AppLocalizations.of(context).hideThreeDotButtonsHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.hideActionMenuButtons,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleHideActionMenuButtons(),
                ),
              ),
              onTap: () => fileManager.toggleHideActionMenuButtons(),
            ),
            if (fileManager.hideActionMenuButtons)
              SettingsTile(
                icon: Icons.info_outline_rounded,
                title: AppLocalizations.of(context).threeDotTrailingInfo,
                subtitle: _getTrailingInfoTypeLabel(context, fileManager.trailingInfoType),
                onTap: () => _showTrailingInfoTypePickerDialog(context, fileManager, theme),
              ),
          ],
        ),
      ),
    );
  }
}

class MediaSettingsScreen extends StatefulWidget {
  const MediaSettingsScreen({super.key});

  @override
  State<MediaSettingsScreen> createState() => _MediaSettingsScreenState();
}

class _MediaSettingsScreenState extends State<MediaSettingsScreen> {
  bool _preferFolders = false;

  @override
  void initState() {
    super.initState();
    _preferFolders = PreferencesService.getPreferFoldersInMedia();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileManager = context.watch<FileManagerProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).mediaPreferences),
        leading: IconButton(
          icon: const NfileIcon(Broken.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            SettingsTile(
              icon: Broken.folder_2,
              title: AppLocalizations.of(context).defaultAlbumView,
              subtitle: AppLocalizations.of(context).defaultAlbumViewHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: _preferFolders,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (val) {
                    setState(() {
                      _preferFolders = val;
                    });
                    PreferencesService.savePreferFoldersInMedia(val);
                  },
                ),
              ),
              onTap: () {
                final val = !_preferFolders;
                setState(() {
                  _preferFolders = val;
                });
                PreferencesService.savePreferFoldersInMedia(val);
              },
            ),
            SettingsTile(
              icon: Broken.image,
              title: AppLocalizations.of(context).showMediaPreviews,
              subtitle: AppLocalizations.of(context).showMediaPreviewsHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.showMediaPreviews,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleMediaPreviews(),
                ),
              ),
              onTap: () => fileManager.toggleMediaPreviews(),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionsSettingsScreen extends StatelessWidget {
  const ActionsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileManager = context.watch<FileManagerProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).fileActionsAndViewers),
        leading: IconButton(
          icon: const NfileIcon(Broken.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            SettingsTile(
              icon: Broken.setting_3,
              title: AppLocalizations.of(context).skipOpenWithDialog,
              subtitle: AppLocalizations.of(context).skipOpenWithDialogHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: fileManager.skipOpenWithDialog,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (_) => fileManager.toggleSkipOpenWithDialog(),
                ),
              ),
              onTap: () => fileManager.toggleSkipOpenWithDialog(),
            ),
            SettingsTile(
              icon: Broken.refresh_2,
              title: AppLocalizations.of(context).resetDefaultViewers,
              subtitle: AppLocalizations.of(context).resetDefaultViewersHint,
              onTap: () async {
                await PreferencesService.clearAllDefaultOpenActions();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context).viewersReset),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TrashSettingsScreen extends StatefulWidget {
  const TrashSettingsScreen({super.key});

  @override
  State<TrashSettingsScreen> createState() => _TrashSettingsScreenState();
}

class _TrashSettingsScreenState extends State<TrashSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).recycleBinTrash),
        leading: IconButton(
          icon: const NfileIcon(Broken.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            SettingsTile(
              icon: Broken.trash,
              title: AppLocalizations.of(context).enableRecycleBin,
              subtitle: AppLocalizations.of(context).enableRecycleBinHint,
              trailing: Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: RecycleBinService.isEnabled(),
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (val) {
                    setState(() {
                      RecycleBinService.setEnabled(val);
                    });
                  },
                ),
              ),
              onTap: () {
                final val = !RecycleBinService.isEnabled();
                setState(() {
                  RecycleBinService.setEnabled(val);
                });
              },
            ),
            if (RecycleBinService.isEnabled())
              SettingsTile(
                icon: Icons.access_time_rounded,
                title: AppLocalizations.of(context).autoDeleteDuration,
                subtitle: _getAutoDeleteDaysLabel(context, RecycleBinService.getAutoDeleteDays()),
                onTap: () => _showAutoDeleteDaysPickerDialog(context, theme, () {
                  setState(() {});
                }),
              ),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------
// Global Helper Labels & Dialogs for Themes & Settings
// ----------------------------------------------------

String _getAccentColorLabel(BuildContext context, String option) {
  switch (option) {
    case 'dynamic': return AppLocalizations.of(context).accentMaterialYou;
    case 'orange': return AppLocalizations.of(context).accentVibrantOrange;
    case 'purple': return AppLocalizations.of(context).accentRoyalPurple;
    case 'green': return AppLocalizations.of(context).accentEmeraldGreen;
    case 'red': return AppLocalizations.of(context).accentCrimsonRed;
    case 'gold': return AppLocalizations.of(context).accentAmberGold;
    case 'pink': return AppLocalizations.of(context).accentCyberpunkPink;
    case 'sapphire': return AppLocalizations.of(context).accentSapphireBlue;
    case 'forest': return AppLocalizations.of(context).accentForestGreen;
    case 'peach': return AppLocalizations.of(context).accentSunsetPeach;
    case 'blue':
    default:
      return AppLocalizations.of(context).themeOriginalDefault;
  }
}

String _getFolderIconLabel(BuildContext context, String option) {
  switch (option) {
    case 'solid': return AppLocalizations.of(context).folderIconClassicSolid;
    case 'rounded': return AppLocalizations.of(context).folderIconModernRounded;
    case 'special': return AppLocalizations.of(context).folderIconStarred;
    case 'snippet': return AppLocalizations.of(context).folderIconSnippet;
    case 'outlined': return AppLocalizations.of(context).folderIconMinimalOutlined;
    case 'broken':
    default:
      return AppLocalizations.of(context).themeBrokenOutline;
  }
}

String _getMenuIconStyleLabel(BuildContext context, String option) {
  switch (option) {
    case 'category': return AppLocalizations.of(context).drawerStyleCategoryGrid;
    case 'hamburger':
    default:
      return AppLocalizations.of(context).drawerStyleHamburger;
  }
}

String _getAppIconLabel(BuildContext context, String option) {
  switch (option) {
    case 'logo1': return AppLocalizations.of(context).logo1;
    case 'logo2': return AppLocalizations.of(context).logo2;
    case 'logo3': return AppLocalizations.of(context).logo3;
    case 'logo4': return AppLocalizations.of(context).logo4;
    case 'default':
    default:
      return AppLocalizations.of(context).defaultLogo;
  }
}

String _getFontFamilyLabel(BuildContext context, String option) {
  switch (option) {
    case 'nothing': return AppLocalizations.of(context).fontDotMatrix;
    case 'outfit': return AppLocalizations.of(context).fontOutfit;
    case 'jetbrains': return AppLocalizations.of(context).fontJetBrains;
    case 'montserrat': return AppLocalizations.of(context).fontMontserrat;
    case 'custom': return AppLocalizations.of(context).fontCustom;
    case 'default':
    default:
      return AppLocalizations.of(context).themeSignatureDefault;
  }
}

String _getAutoDeleteDaysLabel(BuildContext context, int days) {
  if (days <= 0) return AppLocalizations.of(context).recycleBinNeverAuto;
  if (days == 1) return AppLocalizations.of(context).recycleBinAfterOneDay;
  return AppLocalizations.of(context).recycleBinAfterDays(days);
}

String _getTrailingInfoTypeLabel(BuildContext context, String option) {
  switch (option) {
    case 'dateTime': return AppLocalizations.of(context).trailingInfoDateTime;
    case 'sizeAndCount': return AppLocalizations.of(context).trailingInfoSizeCount;
    case 'none':
    default:
      return AppLocalizations.of(context).trailingInfoNone;
  }
}

void _showTrailingInfoTypePickerDialog(BuildContext context, FileManagerProvider fileManager, ThemeData theme) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: theme.scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (ctx) {
      final current = fileManager.trailingInfoType;
      final options = [
        {'key': 'none', 'name': AppLocalizations.of(context).trailingInfoNone, 'desc': AppLocalizations.of(context).trailingInfoNoneHint},
        {'key': 'dateTime', 'name': AppLocalizations.of(context).trailingInfoDateTime, 'desc': AppLocalizations.of(context).trailingInfoDateHint},
        {'key': 'sizeAndCount', 'name': AppLocalizations.of(context).trailingInfoSizeCount, 'desc': AppLocalizations.of(context).trailingInfoSizeHint},
      ];

      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(2))),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(AppLocalizations.of(context).chooseTrailingInfoStyle, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      AppLocalizations.of(context).chooseTrailingInfoStyleHint,
                      style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    itemBuilder: (_, i) {
                      final opt = options[i];
                      final key = opt['key'] as String;
                      final name = opt['name'] as String;
                      final desc = opt['desc'] as String;
                      final isSelected = current == key;

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            key == 'none'
                                ? Icons.visibility_off_rounded
                                : key == 'dateTime'
                                    ? Icons.access_time_rounded
                                    : Icons.info_outline_rounded,
                            color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                            size: 20,
                          ),
                        ),
                        title: Text(name, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.w600)),
                        subtitle: Text(desc, style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurface.withValues(alpha: 0.5))),
                        trailing: isSelected
                            ? Icon(Icons.radio_button_checked_rounded, color: theme.colorScheme.primary)
                            : Icon(Icons.radio_button_off_rounded, color: theme.colorScheme.onSurface.withValues(alpha: 0.3)),
                        onTap: () {
                          fileManager.setTrailingInfoType(key);
                          Navigator.pop(ctx);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void _showExitOptionPickerDialog(BuildContext context, FileManagerProvider fileManager, ThemeData theme) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: theme.scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (ctx) {
      final current = fileManager.exitOption;
      final options = [
        {'key': 'confirm', 'name': AppLocalizations.of(context).settingsExitConfirmation, 'desc': AppLocalizations.of(context).settingsExitConfirmationHint},
        {'key': 'double_press', 'name': AppLocalizations.of(context).settingsDoublePressExit, 'desc': AppLocalizations.of(context).settingsDoublePressExitHint},
      ];

      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(2))),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(AppLocalizations.of(context).chooseExitBehavior, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    itemBuilder: (_, i) {
                      final opt = options[i];
                      final key = opt['key'] as String;
                      final name = opt['name'] as String;
                      final desc = opt['desc'] as String;
                      final isSelected = current == key;

                      return ListTile(
                        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(desc, style: const TextStyle(fontSize: 12)),
                        trailing: isSelected 
                            ? Icon(Icons.check_circle_rounded, color: theme.colorScheme.primary) 
                            : Icon(Icons.circle_outlined, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
                        onTap: () {
                          fileManager.setExitOption(key);
                          Navigator.pop(ctx);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void _showThemePickerDialog(BuildContext context, FileManagerProvider fileManager, ThemeData theme) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: theme.scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (ctx) {
      final current = fileManager.accentColorOption;
      final options = [
        {'key': 'blue', 'name': AppLocalizations.of(context).themeOriginalDefault, 'color': const Color(0xFF369FE7)},
        {'key': 'dynamic', 'name': AppLocalizations.of(context).accentMaterialYou, 'color': Colors.teal},
        {'key': 'orange', 'name': AppLocalizations.of(context).accentVibrantOrange, 'color': const Color(0xFFFF6D00)},
        {'key': 'purple', 'name': AppLocalizations.of(context).accentRoyalPurple, 'color': const Color(0xFF8E24AA)},
        {'key': 'green', 'name': AppLocalizations.of(context).accentEmeraldGreen, 'color': const Color(0xFF00C853)},
        {'key': 'red', 'name': AppLocalizations.of(context).accentCrimsonRed, 'color': const Color(0xFFD50000)},
        {'key': 'gold', 'name': AppLocalizations.of(context).accentAmberGold, 'color': const Color(0xFFFFD600)},
        {'key': 'pink', 'name': AppLocalizations.of(context).accentCyberpunkPink, 'color': const Color(0xFFFF2E93)},
        {'key': 'sapphire', 'name': AppLocalizations.of(context).accentSapphireBlue, 'color': const Color(0xFF0F52BA)},
        {'key': 'forest', 'name': AppLocalizations.of(context).accentForestGreen, 'color': const Color(0xFF228B22)},
        {'key': 'peach', 'name': AppLocalizations.of(context).accentSunsetPeach, 'color': const Color(0xFFFF7F50)},
      ];

      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(2))),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(AppLocalizations.of(context).chooseAccentTheme, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    itemBuilder: (_, i) {
                      final opt = options[i];
                      final key = opt['key'] as String;
                      final name = opt['name'] as String;
                      final color = opt['color'] as Color;
                      final isSelected = current == key;

                      return ListTile(
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: key == 'dynamic' ? theme.colorScheme.primary : color,
                            shape: BoxShape.circle,
                          ),
                          child: key == 'dynamic' 
                              ? const Icon(Broken.colorfilter, color: Colors.white, size: 20)
                              : isSelected ? const Icon(Icons.check, color: Colors.white, size: 20) : null,
                        ),
                        title: Text(name, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                        trailing: isSelected ? Icon(Icons.radio_button_checked, color: theme.colorScheme.primary) : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
                        onTap: () {
                          fileManager.setAccentColorOption(key);
                          Navigator.pop(ctx);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void _showFolderIconPickerDialog(BuildContext context, FileManagerProvider fileManager, ThemeData theme) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: theme.scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (ctx) {
      final current = fileManager.folderIconOption;
      final options = [
        {'key': 'broken', 'name': AppLocalizations.of(context).themeBrokenOutline, 'icon': Broken.folder},
        {'key': 'rounded', 'name': AppLocalizations.of(context).folderIconModernRounded, 'icon': Icons.folder_rounded},
        {'key': 'solid', 'name': AppLocalizations.of(context).folderIconClassicSolid, 'icon': Icons.folder},
        {'key': 'special', 'name': AppLocalizations.of(context).folderIconStarred, 'icon': Icons.folder_special_rounded},
        {'key': 'snippet', 'name': AppLocalizations.of(context).folderIconSnippet, 'icon': Icons.snippet_folder_rounded},
        {'key': 'outlined', 'name': AppLocalizations.of(context).folderIconMinimalOutlined, 'icon': Icons.folder_outlined},
      ];

      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(2))),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(AppLocalizations.of(context).chooseFolderIconStyle, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    itemBuilder: (_, i) {
                      final opt = options[i];
                      final key = opt['key'] as String;
                      final name = opt['name'] as String;
                      final icon = opt['icon'] as IconData;
                      final isSelected = current == key;

                      return ListTile(
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(icon, color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.primary, size: 20),
                        ),
                        title: Text(name, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                        trailing: isSelected ? Icon(Icons.radio_button_checked, color: theme.colorScheme.primary) : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
                        onTap: () {
                          fileManager.setFolderIconOption(key);
                          Navigator.pop(ctx);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void _showMenuIconStylePickerDialog(BuildContext context, FileManagerProvider fileManager, ThemeData theme) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: theme.scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (ctx) {
      final current = fileManager.menuIconStyle;
      final options = [
        {'key': 'hamburger', 'name': AppLocalizations.of(context).drawerStyleHamburger, 'icon': Broken.menu},
        {'key': 'category', 'name': AppLocalizations.of(context).drawerStyleCategoryGrid, 'icon': Broken.category},
      ];

      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(2))),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(AppLocalizations.of(context).chooseDrawerButtonStyle, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    itemBuilder: (_, i) {
                      final opt = options[i];
                      final key = opt['key'] as String;
                      final name = opt['name'] as String;
                      final icon = opt['icon'] as IconData;
                      final isSelected = current == key;

                      return ListTile(
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(icon, color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.primary, size: 20),
                        ),
                        title: Text(name, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                        trailing: isSelected ? Icon(Icons.radio_button_checked, color: theme.colorScheme.primary) : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
                        onTap: () {
                          fileManager.setMenuIconStyle(key);
                          Navigator.pop(ctx);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void _showAppIconPickerDialog(BuildContext context, FileManagerProvider fileManager, ThemeData theme) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: AppLocalizations.of(context).settingsAppIconPicker,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (context, anim1, anim2) => const SizedBox.shrink(),
    transitionBuilder: (context, anim1, anim2, child) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: anim1, curve: Curves.easeOutBack),
        child: FadeTransition(
          opacity: anim1,
          child: AlertDialog(
            backgroundColor: theme.colorScheme.surface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            title: Row(
              children: [
                Icon(Broken.category, color: theme.colorScheme.primary, size: 26),
                const SizedBox(width: 12),
                Text(AppLocalizations.of(context).appLauncherIcon, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context).appLauncherIconHint,
                    style: TextStyle(fontSize: 13, height: 1.3, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Flexible(
                    child: SingleChildScrollView(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.85,
                        children: [
                          _buildIconOptionCard(
                            context,
                            fileManager,
                            theme,
                            id: 'default',
                            title: AppLocalizations.of(context).settingsLogo,
                            imagePath: 'assets/ic_launcher.webp',
                          ),
                          _buildIconOptionCard(
                            context,
                            fileManager,
                            theme,
                            id: 'logo1',
                            title: AppLocalizations.of(context).logo1,
                            imagePath: 'assets/logo/n1.png',
                          ),
                          _buildIconOptionCard(
                            context,
                            fileManager,
                            theme,
                            id: 'logo2',
                            title: AppLocalizations.of(context).logo2,
                            imagePath: 'assets/logo/n2.png',
                          ),
                          _buildIconOptionCard(
                            context,
                            fileManager,
                            theme,
                            id: 'logo3',
                            title: AppLocalizations.of(context).logo3,
                            imagePath: 'assets/logo/n3.png',
                          ),
                          _buildIconOptionCard(
                            context,
                            fileManager,
                            theme,
                            id: 'logo4',
                            title: AppLocalizations.of(context).logo4,
                            imagePath: 'assets/logo/n4.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context).actionClose),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildIconOptionCard(
  BuildContext context,
  FileManagerProvider fileManager,
  ThemeData theme, {
  required String id,
  required String title,
  required String imagePath,
}) {
  final isSelected = fileManager.activeAppIcon == id;

  return Card(
    color: isSelected ? theme.colorScheme.primaryContainer.withValues(alpha: 0.4) : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(
        color: isSelected ? theme.colorScheme.primary : theme.dividerColor.withValues(alpha: 0.08),
        width: isSelected ? 2.0 : 1.0,
      ),
    ),
    child: InkWell(
      onTap: () {
        fileManager.setActiveAppIcon(id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).appIconSwitched(title)),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 56,
                  height: 56,
                  color: Colors.grey.withValues(alpha: 0.2),
                  child: const Icon(Icons.broken_image, size: 24),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

void _showFontFamilyPickerDialog(BuildContext context, FileManagerProvider fileManager, ThemeData theme) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: theme.scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (ctx) {
      final current = fileManager.fontFamilyOption;
      final hasCustomFont = fileManager.customFontPath != null;
      final options = [
        {'key': 'default', 'name': AppLocalizations.of(context).themeSignatureDefault, 'desc': AppLocalizations.of(context).themeOriginalGeometric},
        {'key': 'nothing', 'name': AppLocalizations.of(context).themeNothingDotMatrix, 'desc': AppLocalizations.of(context).themeDotMatrixHint},
        {'key': 'outfit', 'name': AppLocalizations.of(context).fontOutfit, 'desc': AppLocalizations.of(context).themeGeometricHint},
        {'key': 'jetbrains', 'name': AppLocalizations.of(context).fontJetBrains, 'desc': AppLocalizations.of(context).themeMonospaceHint},
        {'key': 'montserrat', 'name': AppLocalizations.of(context).fontMontserrat, 'desc': AppLocalizations.of(context).themeBoldHint},
        if (hasCustomFont)
          {'key': 'custom', 'name': AppLocalizations.of(context).themeCustomFontName(p.basename(fileManager.customFontPath!)), 'desc': AppLocalizations.of(context).themeCustomFontHint},
      ];

      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(2))),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context).appTypography,
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    AppLocalizations.of(context).appTypographyHint,
                    style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontSize: 13, fontFamily: 'Inter'),
                  ),
                  const SizedBox(height: 16),
                  ...options.map((opt) {
                    final isSelected = current == opt['key'];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      title: Text(
                        opt['name']!,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                          color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                          fontFamily: 'Inter',
                        ),
                      ),
                      subtitle: Text(
                        opt['desc']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                          fontFamily: 'Inter',
                        ),
                      ),
                      trailing: isSelected
                          ? Icon(Icons.radio_button_checked_rounded, color: theme.colorScheme.primary)
                          : Icon(Icons.radio_button_off_rounded, color: theme.colorScheme.onSurface.withValues(alpha: 0.3)),
                      onTap: () {
                        fileManager.setFontFamilyOption(opt['key']!);
                        Navigator.pop(ctx);
                      },
                    );
                  }),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    icon: const Icon(Broken.document_upload, size: 20),
                    label: Text(
                      hasCustomFont ? AppLocalizations.of(context).themeReplaceCustomFont : AppLocalizations.of(context).themeImportCustomFont,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(46),
                      foregroundColor: theme.colorScheme.primary,
                      side: BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.5)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () async {
                      Navigator.pop(ctx);
                      final picked = await InternalFilePickerScreen.show(
                        context,
                        rootPath: fileManager.rootPath,
                      );
                      if (picked != null && picked.isNotEmpty) {
                        final filePat = picked.first;
                        final ext = p.extension(filePat).toLowerCase();
                        if (ext == '.ttf' || ext == '.otf') {
                          final success = await fileManager.setCustomFontPath(filePat);
                          if (success) {
                            fileManager.setFontFamilyOption('custom');
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(AppLocalizations.of(context).customFontApplied(p.basename(filePat)))),
                              );
                            }
                          } else {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(AppLocalizations.of(context).failedToLoadFont)),
                              );
                            }
                          }
                        } else {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(AppLocalizations.of(context).invalidFileType),
                                content: Text(AppLocalizations.of(context).invalidFontFileHint),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(AppLocalizations.of(context).actionOk),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      }
                    },
                  ),
                  if (hasCustomFont) ...[
                    const SizedBox(height: 8),
                    TextButton.icon(
                      icon: const Icon(Broken.trash, size: 18, color: Colors.redAccent),
                      label: Text(AppLocalizations.of(context).removeCustomFont, style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontFamily: 'Inter')),
                      onPressed: () async {
                        Navigator.pop(ctx);
                        await fileManager.setCustomFontPath(null);
                        if (current == 'custom') {
                          fileManager.setFontFamilyOption('default');
                        }
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(AppLocalizations.of(context).customFontRemoved)),
                          );
                        }
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void _showAutoDeleteDaysPickerDialog(BuildContext context, ThemeData theme, VoidCallback onChanged) {
  showModalBottomSheet(
    context: context,
    backgroundColor: theme.scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (ctx) {
      final current = RecycleBinService.getAutoDeleteDays();
      final options = [
        {'days': 7, 'label': AppLocalizations.of(context).recycleBinDays7},
        {'days': 15, 'label': AppLocalizations.of(context).recycleBinDays15},
        {'days': 30, 'label': AppLocalizations.of(context).recycleBinDays30},
        {'days': 0, 'label': AppLocalizations.of(context).recycleBinNeverManual},
      ];

      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  AppLocalizations.of(context).autoDeleteDuration,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  AppLocalizations.of(context).autoDeleteDurationHint,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                ),
              ),
              const SizedBox(height: 16),
              ...options.map((opt) {
                final days = opt['days'] as int;
                final label = opt['label'] as String;
                final isSelected = current == days;

                return Card(
                  color: isSelected ? theme.colorScheme.primary.withValues(alpha: 0.12) : theme.colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: isSelected ? theme.colorScheme.primary : theme.dividerColor.withValues(alpha: 0.08)),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      RecycleBinService.setAutoDeleteDays(days);
                      onChanged();
                      Navigator.pop(ctx);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Row(
                        children: [
                          Icon(Icons.access_time_rounded, color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface.withValues(alpha: 0.6)),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              label,
                              style: TextStyle(
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                          if (isSelected) Icon(Icons.check_circle, color: theme.colorScheme.primary),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      );
    },
  );
}
