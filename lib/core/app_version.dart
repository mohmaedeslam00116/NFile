/// The version of the application.
///
/// The version used to be written in the source, in two places, and it was
/// already behind the version of the pubspec. It is written in one place now,
/// and the test of the version says that it is the version the application
/// has.
class AppVersion {
  const AppVersion._();

  /// The version of the application, without the number of the build.
  static const String current = '1.0.47';

  /// The channel of the release.
  static const String channel = 'Stable';
}
