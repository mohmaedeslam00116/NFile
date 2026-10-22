import 'dart:io';
import 'package:crypto/crypto.dart';

class ChecksumService {
  /// Computes the [algorithm] checksum (md5 or sha256) of the file at [path].
  static Future<String?> compute(String path, String algorithm) async {
    try {
      final file = File(path);
      if (!file.existsSync()) return null;
      final digest = algorithm.toLowerCase() == 'md5'
          ? await md5.bind(file.openRead()).first
          : await sha256.bind(file.openRead()).first;
      return digest.toString();
    } catch (_) {
      return null;
    }
  }
}
