import 'dart:io';

class HexViewerService {
  /// Reads up to [length] bytes from [path] starting at [offset] and returns
  /// them as a lowercase hex string. Returns null if the file cannot be read.
  static Future<String?> readHex(String path, {int offset = 0, int length = 4096}) async {
    try {
      final file = File(path);
      if (!file.existsSync()) return null;
      final raf = await file.open();
      await raf.setPosition(offset);
      final bytes = await raf.read(length);
      await raf.close();
      return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    } catch (_) {
      return null;
    }
  }
}
