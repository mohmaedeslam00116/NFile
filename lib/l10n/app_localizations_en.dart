// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'NFile';

  @override
  String get openingSharedDocument => 'Opening shared document...';

  @override
  String get resolvingSecureContent => 'Resolving secure content stream';

  @override
  String get storageAccessRequired => 'Storage Access Required';

  @override
  String get storageAccessExplanation =>
      'NFile requires storage permission to manage, organize, and display your media files seamlessly.';

  @override
  String get grantPermission => 'Grant Permission';
}
