import 'package:nfile/services/root_shizuku_service.dart';

class PermissionsService {
  /// Changes the mode of [path] using the root/Shizuku backend.
  static Future<bool> chmod(String path, String mode, {required bool useRoot}) async {
    try {
      final res = await RootShizukuService.runCommand('chmod $mode "$path"', useRoot: useRoot);
      return res != null;
    } catch (_) {
      return false;
    }
  }

  /// Changes the owner of [path] using the root/Shizuku backend.
  static Future<bool> chown(String path, String owner, {required bool useRoot}) async {
    try {
      final res = await RootShizukuService.runCommand('chown $owner "$path"', useRoot: useRoot);
      return res != null;
    } catch (_) {
      return false;
    }
  }
}
