import '../core/listing/listing_scope.dart';
import 'file_item_model.dart';

class FolderTab {
  final String id;
  String currentPath;

  /// The Entries of the directory the tab is showing.
  List<FileItemModel> entries;

  /// The Entries a search found.
  List<FileItemModel> searchEntries;

  bool isLoading;
  bool isRestrictedMode;
  bool needsPermission;
  bool useRootMode;
  bool useShizukuMode;
  bool isRootAvailable;
  final Set<String> selectedPaths;
  double scrollOffset;
  final Map<String, double> scrollPositions;
  bool isPinned;

  // Tab-specific search state
  String searchQuery;
  String searchFilter;
  bool isSearching;
  bool isSearchActive;

  FolderTab({
    required this.id,
    required this.currentPath,
    this.entries = const [],
    this.isLoading = false,
    this.isRestrictedMode = false,
    this.needsPermission = false,
    this.useRootMode = false,
    this.useShizukuMode = false,
    this.isRootAvailable = false,
    Set<String>? selectedPaths,
    this.scrollOffset = 0.0,
    Map<String, double>? scrollPositions,
    this.isPinned = false,
    this.searchQuery = '',
    this.searchFilter = 'All',
    this.searchEntries = const [],
    this.isSearching = false,
    this.isSearchActive = false,
  }) : selectedPaths = selectedPaths ?? {},
       scrollPositions = scrollPositions ?? {};

  /// Where the tab's Entries come from: one directory, or a search across a subtree.
  ///
  /// The scope follows the tab: a search spans folders, so it uses the global Sort
  /// Rule, while a directory may use the Folder Sort Override that names it.
  ListingScope get scope => isSearchActive
      ? SearchScope(currentPath)
      : DirectoryScope(currentPath);

  /// The Entries of the tab's source — the ones the Listing is derived from.
  List<FileItemModel> get sourceEntries =>
      isSearchActive ? searchEntries : entries;

  bool get displayLoading => isSearchActive ? isSearching : isLoading;
}
