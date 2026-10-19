import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
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
        currentFiles: [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)],
      );
      final provider = providerWith(tab);

      // The global rule sorts by name; the override of this folder sorts by size.
      provider.setFolderOverrideEnabled('/d', true);
      provider.setSortType(FileSortType.sizeLargest);

      expect(namesOf(provider.listingFor(tab).entries), ['b.txt', 'a.txt']);
    });

    test('listingFor(tab) returns the global rule when the folder has no override', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        currentFiles: [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)],
      );
      final provider = providerWith(tab);

      provider.setSortType(FileSortType.nameAsc);

      expect(namesOf(provider.listingFor(tab).entries), ['a.txt', 'b.txt']);
    });

    test('with a search active, listingFor(tab) returns the search Listing', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        currentFiles: [entry('/d/directory-entry.txt')],
        searchResults: [entry('/d/found.txt')],
        isSearchActive: true,
      );
      final provider = providerWith(tab);

      expect(namesOf(provider.listingFor(tab).entries), ['found.txt']);
    });

    test('a search Listing does not inherit the override of the folder', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        currentFiles: [entry('/d/a.txt', size: 1)],
        searchResults: [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)],
        isSearchActive: true,
      );
      final provider = providerWith(tab);

      provider.setFolderOverrideEnabled('/d', true);
      provider.setSortType(FileSortType.sizeLargest);

      // The search spans folders, so it keeps the global rule: by name.
      expect(namesOf(provider.listingFor(tab).entries), ['a.txt', 'b.txt']);
    });

    test('activeListing is the Listing of the active tab', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        currentFiles: [entry('/d/a.txt')],
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
        currentFiles: [entry('/d/a.txt')],
      );
      final provider = providerWith(tab);

      expect(provider.listingFor(tab), same(provider.listingFor(tab)));
      expect(provider.activeListing, same(provider.listingFor(tab)));
    });

    test('builds a new Listing when the Sort Rule changes', () {
      final tab = FolderTab(
        id: 'tab-1',
        currentPath: '/d',
        currentFiles: [entry('/d/a.txt', size: 1), entry('/d/b.txt', size: 99)],
      );
      final provider = providerWith(tab);

      final before = provider.listingFor(tab);
      provider.setSortType(FileSortType.sizeLargest);
      final after = provider.listingFor(tab);

      expect(after, isNot(same(before)));
      expect(namesOf(after.entries), ['b.txt', 'a.txt']);
    });
  });
}
