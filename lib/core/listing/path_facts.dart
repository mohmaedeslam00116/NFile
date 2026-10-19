import 'package:path/path.dart' as p;

import 'sort_rule.dart';

/// The facts that belong to a path: a Folder Sort Override, a Pinned Path.
///
/// They follow the path they name: they move with a renamed or moved folder, and
/// end with a deleted one. See `CONTEXT.md`.
class PathFacts {
  /// The Sort Rule of each folder that overrides the global one.
  final Map<String, SortRule> folderOverrides;

  /// The paths the user pinned.
  final Set<String> pinnedPaths;

  const PathFacts({
    required this.folderOverrides,
    required this.pinnedPaths,
  });

  /// The facts as they are after [oldPath] became [newPath].
  ///
  /// A folder that moved takes its own facts with it, and the facts of everything
  /// inside it move as well.
  PathFacts moved(String oldPath, String newPath) {
    final overrides = <String, SortRule>{
      for (final entry in folderOverrides.entries)
        _moved(entry.key, oldPath, newPath): entry.value,
    };
    final pins = pinnedPaths
        .map((path) => _moved(path, oldPath, newPath))
        .toSet();

    return PathFacts(folderOverrides: overrides, pinnedPaths: pins);
  }

  /// The facts as they are after [path] was deleted.
  ///
  /// A deleted folder takes its own facts with it, and the facts of everything
  /// inside it end with it.
  PathFacts deleted(String path) {
    final overrides = <String, SortRule>{
      for (final entry in folderOverrides.entries)
        if (!_isWithin(path, entry.key)) entry.key: entry.value,
    };
    final pins = pinnedPaths
        .where((pinned) => !_isWithin(path, pinned))
        .toSet();

    return PathFacts(folderOverrides: overrides, pinnedPaths: pins);
  }

  static bool _isWithin(String parent, String path) =>
      path == parent || p.isWithin(parent, path);

  static String _moved(String path, String oldPath, String newPath) {
    if (path == oldPath) return newPath;
    if (!p.isWithin(oldPath, path)) return path;
    return p.join(newPath, p.relative(path, from: oldPath));
  }
}
