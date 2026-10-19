import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nfile/core/listing/listing_scope.dart';
import 'package:nfile/models/file_filter_type.dart';
import 'package:nfile/models/file_item_model.dart';
import 'package:nfile/models/folder_tab_model.dart';
import 'package:nfile/providers/file_manager_provider.dart';
import 'package:nfile/services/pin_service.dart';
import 'package:nfile/services/preferences_service.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

FileItemModel entry(String path, {bool isDirectory = false, int size = 0}) =>
    FileItemModel(
      entity: isDirectory ? Directory(path) : File(path),
      name: p.basename(path),
      path: path,
      isDirectory: isDirectory,
      size: size,
      modified: DateTime.utc(2026, 1, 1),
    );

List<String> namesOf(List<FileItemModel> entries) =>
    entries.map((e) => e.name).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await PreferencesService.init();
    await PinService.init();
  });

  FileManagerProvider providerWith(FolderTab tab) {
    final provider = FileManagerProvider();
    provider.tabs.add(tab);
    return provider;
  }

  group('the provider derives Listings', () {
    test('listingFor(tab) returns a Listing ordered by the folder override', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)],
      );
      final provider = providerWith(tab);

      // The global rule sorts by name; the override of this folder sorts by size.
      provider.setFolderOverrideEnabled('/d', true);
      provider.setSortType(SortRule.sizeLargest);

      expect(namesOf(provider.listingFor(tab).entries), ['b.txt', 'a.txt']);
    });

    test('listingFor(tab) returns the global rule when the folder has no override', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)],
      );
      final provider = providerWith(tab);

      provider.setSortType(SortRule.nameAsc);

      expect(namesOf(provider.listingFor(tab).entries), ['a.txt', 'b.txt']);
    });

    test('with a search active, listingFor(tab) returns the search Listing', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/directory-entry.txt')],
        searchEntries: [entry('/d/found.txt')],
        isSearchActive: true,
      );
      final provider = providerWith(tab);

      expect(namesOf(provider.listingFor(tab).entries), ['found.txt']);
    });

    test('a search Listing does not inherit the override of the folder', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/a.txt', size: 1)],
        searchEntries: [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)],
        isSearchActive: true,
      );
      final provider = providerWith(tab);

      provider.setFolderOverrideEnabled('/d', true);
      provider.setSortType(SortRule.sizeLargest);

      // The search spans folders, so it keeps the global rule: by name.
      expect(namesOf(provider.listingFor(tab).entries), ['a.txt', 'b.txt']);
    });

    test('activeListing is the Listing of the active tab', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/a.txt')],
      );
      final provider = providerWith(tab);

      expect(provider.activeListing.entries.map((e) => e.name), ['a.txt']);
    });
  });

  group('the cache of the provider', () {
    test('hands back the same Listing while the inputs do not change', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/a.txt')],
      );
      final provider = providerWith(tab);

      expect(provider.listingFor(tab), same(provider.listingFor(tab)));
      expect(provider.activeListing, same(provider.listingFor(tab)));
    });

    test('builds a new Listing when the Sort Rule changes', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)],
      );
      final provider = providerWith(tab);

      final before = provider.listingFor(tab);
      provider.setSortType(SortRule.sizeLargest);
      final after = provider.listingFor(tab);

      expect(after, isNot(same(before)));
      expect(namesOf(after.entries), ['b.txt', 'a.txt']);
    });
  });

  group('the tab', () {
    test('knows the source of its entries', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/a.txt')],
        searchEntries: [entry('/d/found.txt')],
      );

      expect(tab.scope, isA<DirectoryScope>());
      expect(tab.sourceEntries, tab.entries);

      tab.isSearchActive = true;

      expect(tab.scope, isA<SearchScope>());
      expect(tab.sourceEntries, tab.searchEntries);
    });
  });

  group('the per-path facts', () {
    test('follow a renamed folder', () async {
      final dir = await Directory.systemTemp.createTemp('nfile-facts');
      addTearDown(() => dir.delete(recursive: true));
      final oldPath = p.join(dir.path, 'old');
      final newPath = p.join(dir.path, 'new');
      Directory(oldPath).createSync();

      SharedPreferences.setMockInitialValues({'cached_total_storage': 1024});
      await PreferencesService.init();
      await PinService.init();

      final provider = FileManagerProvider();
      await provider.loadDirectory(dir.path, showLoading: false);
      provider.setFolderOverrideEnabled(oldPath, true);
      await PinService.pin(oldPath);

      await provider.renameFile(oldPath, 'new');

      expect(provider.folderSortTypes.containsKey(oldPath), isFalse);
      expect(provider.folderSortTypes.containsKey(newPath), isTrue);
      expect(PinService.isPinned(oldPath), isFalse);
      expect(PinService.isPinned(newPath), isTrue);
    });
  });

  group('the visible order is derived, not stored', () {
    test('pinning a path during a search leaves the directory Entries untouched', () async {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/directory.txt')],
      );
      final provider = providerWith(tab);
      tab.isSearchActive = true;
      tab.searchEntries = [entry('/d/found.txt')];

      await provider.togglePinPath('/d/found.txt');

      expect(namesOf(tab.entries), ['directory.txt']);
      // The pin was applied: the found entry is hoisted to the top of the search
      // Listing, and the directory Entries are still the directory's.
      expect(PinService.isPinned('/d/found.txt'), isTrue);
      expect(namesOf(provider.listingFor(tab).entries), ['found.txt']);
    });

    test('the visible list of a search is ordered by the Sort Rule', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        entries: [entry('/d/directory.txt')],
      );
      final provider = providerWith(tab);
      tab.isSearchActive = true;
      tab.searchEntries = [entry('/d/b.txt'), entry('/d/a.txt')];

      expect(namesOf(provider.activeListing.entries), ['a.txt', 'b.txt']);
    });

    test('the visible list is narrowed by the Filter, not by the load', () async {      final dir = await Directory.systemTemp.createTemp('nfile-listing');
      addTearDown(() => dir.delete(recursive: true));
      await File('${dir.path}/a.png').writeAsBytes([1, 2, 3]);
      await File('${dir.path}/b.txt').writeAsString('bb');

      // A cached storage volume keeps the provider from asking the platform for
      // the volumes when it loads a directory.
      SharedPreferences.setMockInitialValues({'cached_total_storage': 1024});
      await PreferencesService.init();

      final provider = FileManagerProvider();
      await provider.loadDirectory(dir.path, showLoading: false);

      provider.setFilterType(FileFilterType.images);

      expect(namesOf(provider.activeListing.entries), ['a.png']);
    });
  });
}
