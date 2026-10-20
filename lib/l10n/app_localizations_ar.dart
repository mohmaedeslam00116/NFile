// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'NFile';

  @override
  String get openingSharedDocument => 'جارٍ فتح المستند المشترك...';

  @override
  String get resolvingSecureContent => 'جارٍ تحليل تدفّق المحتوى الآمن';

  @override
  String get storageAccessRequired => 'مطلوب إذن الوصول إلى التخزين';

  @override
  String get storageAccessExplanation =>
      'يحتاج تطبيق NFile إلى إذن التخزين ليُدِر ملفات الوسائط وينظّمها ويعرضها بسلاسة.';

  @override
  String get grantPermission => 'منح الإذن';
}
