import 'dart:collection';

import 'package:shared_preferences/shared_preferences.dart';

class PinService {
  static SharedPreferences? _prefs;
  static const String _keyPinnedPaths = 'pinned_paths';
  static Set<String> _pinnedPaths = {};

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final list = _prefs?.getStringList(_keyPinnedPaths) ?? [];
    _pinnedPaths = list.toSet();
  }

  /// The paths the user pinned. The view is read-only: pin and unpin are the only
  /// ways to change it.
  static Set<String> get pinnedPaths => UnmodifiableSetView(_pinnedPaths);

  static bool isPinned(String path) {
    return _pinnedPaths.contains(path);
  }

  static Future<void> pin(String path) async {
    _pinnedPaths.add(path);
    await _prefs?.setStringList(_keyPinnedPaths, _pinnedPaths.toList());
  }

  static Future<void> unpin(String path) async {
    _pinnedPaths.remove(path);
    await _prefs?.setStringList(_keyPinnedPaths, _pinnedPaths.toList());
  }

  static Future<void> togglePin(String path) async {
    if (isPinned(path)) {
      await unpin(path);
    } else {
      await pin(path);
    }
  }
}
