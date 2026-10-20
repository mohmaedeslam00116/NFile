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

  @override
  String couldNotOpenLink(String url) {
    return 'تعذّر فتح الرابط: $url';
  }

  @override
  String get aboutNFile => 'عن NFile';

  @override
  String appVersionWithChannel(String version, String channel) {
    return 'الإصدار $version ($channel)';
  }

  @override
  String get aboutDescription =>
      'تطبيق NFile مدير ملفات جميل وسلس ومفتوح المصدر، ومركز وسائط يعمل دون إنترنت، مبني بـ Flutter. صُمّم لأداء فائق، ولمظهر زجاجي نقي، وتجربة مستخدم متصلة.';

  @override
  String get coreHighlights => 'أبرز المزايا';

  @override
  String get extremeSpeed => 'سرعة فائقة';

  @override
  String get statelessCaching => 'تخزين مؤقت بلا حالة ومسح غير متزامن';

  @override
  String get vaultSecure => 'خزنة آمنة';

  @override
  String get encryptedWorkspace => 'مساحة عمل آمنة ومشفّرة';

  @override
  String get serversHub => 'مركز الخوادم';

  @override
  String get richUi => 'واجهة غنية';

  @override
  String get amoledBlack => 'أسود AMOLED وبذور ألوان جميلة';

  @override
  String get connectAndShare => 'اتصل وشارك';

  @override
  String get starOnRepository => 'ضع نجمة على المستودع';

  @override
  String get joinTelegramChannel => 'انضم إلى قناة تيليجرام';

  @override
  String get shareAppWithFriends => 'شارك التطبيق مع الأصدقاء';

  @override
  String get exploreSourceCode => 'استكشف شيفرة المصدر على GitHub';

  @override
  String get madeWithLove => 'صُنع بـ ❤️ بواسطة Rubex';

  @override
  String get copyrightNotice => '© 2026 NFile. جميع الحقوق محفوظة.';

  @override
  String copiedItemsToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'نُسخت $count عنصر إلى الحافظة',
      many: 'نُسخت $count عنصرًا إلى الحافظة',
      few: 'نُسخت $count عناصر إلى الحافظة',
      two: 'نُسخ عنصران إلى الحافظة',
      one: 'نُسخ عنصر واحد إلى الحافظة',
      zero: 'نُسخت 0 عناصر إلى الحافظة',
    );
    return '$_temp0';
  }

  @override
  String cutItemsToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'نُقل $count عنصر إلى الحافظة',
      many: 'نُقل $count عنصرًا إلى الحافظة',
      few: 'نُقل $count عناصر إلى الحافظة',
      two: 'نُقل عنصران إلى الحافظة',
      one: 'نُقل عنصر واحد إلى الحافظة',
      zero: 'نُقل 0 عناصر إلى الحافظة',
    );
    return '$_temp0';
  }

  @override
  String errorSharing(String error) {
    return 'خطأ في المشاركة: $error';
  }

  @override
  String get noFilesToShare => 'لا توجد ملفات للمشاركة';

  @override
  String get deleteSelected => 'حذف المحدَّد';

  @override
  String get successfullyDeletedItems => 'تم حذف العناصر بنجاح';

  @override
  String get copiedToClipboard => 'نُسخ إلى الحافظة';

  @override
  String get cutToClipboard => 'نُقل إلى الحافظة';

  @override
  String get enterNewName => 'أدخل اسمًا جديدًا';

  @override
  String get deleteFile => 'حذف الملف';

  @override
  String get selectAll => 'تحديد الكل';

  @override
  String get noRecentFiles => 'لا توجد ملفات أخيرة';

  @override
  String get noRecentFilesHint =>
      'ستظهر هنا الملفات التي أُنشئت أو نُزّلت حديثًا.';

  @override
  String selectedItemsWithSize(int count, String size) {
    return '$count محدَّد ($size)';
  }

  @override
  String get moreActions => 'إجراءات أخرى';

  @override
  String get dashboardRefreshed => 'تم تحديث لوحة المعلومات';

  @override
  String get exitApplication => 'الخروج من التطبيق';

  @override
  String get confirmExitMessage =>
      'هل تريد بالتأكيد الخروج؟ اضغط زر الرجوع مجددًا أو اضغط «الخروج» لإغلاق التطبيق.';

  @override
  String get pressBackAgainToExit => 'اضغط زر الرجوع مجددًا للخروج';

  @override
  String get myFiles => 'ملفاتي';

  @override
  String get refreshDashboard => 'تحديث لوحة المعلومات';

  @override
  String get newTab => 'تبويب جديد';

  @override
  String get duplicateTab => 'تكرار التبويب';

  @override
  String get closeOtherTabs => 'إغلاق التبويبات الأخرى';

  @override
  String get closeTab => 'إغلاق التبويب';

  @override
  String get showInLocation => 'إظهار في مكانه';

  @override
  String countAndName(int count, String name) {
    return '$count $name';
  }

  @override
  String countAndDate(String count, String date) {
    return '$count • $date';
  }

  @override
  String labelActive(String label) {
    return '$label مُفعَّل';
  }

  @override
  String get noMatchesFound => 'لم يُعثر على مجلدات أو ملفات مطابقة';

  @override
  String pathNotFound(String path) {
    return 'المسار غير موجود: $path';
  }

  @override
  String get enterAbsolutePath => 'أدخل مسارًا مطلقًا...';

  @override
  String copiedPath(String path) {
    return 'نُسخ: $path';
  }

  @override
  String get systemRoot => 'جذر النظام';

  @override
  String get globalSearch => 'بحث شامل';

  @override
  String get recycleBin => 'سلة المحذوفات';

  @override
  String get serversAndTools => 'الخوادم والأدوات';

  @override
  String get privateWallet => 'المحفظة الخاصة';

  @override
  String get ftpServer => 'خادم FTP';

  @override
  String get webSharing => 'المشاركة عبر الويب';

  @override
  String get addRemoteConnection => 'إضافة اتصال بعيد';

  @override
  String get quickCategories => 'الفئات السريعة';

  @override
  String get addShortcut => 'إضافة اختصار';

  @override
  String get moreSettings => 'المزيد من الإعدادات';

  @override
  String appVersion(String version) {
    return 'NFile الإصدار $version';
  }

  @override
  String get beautifulMediaSuite => 'منظومة وسائط جميلة';

  @override
  String get openWith => 'فتح بـ...';

  @override
  String get builtInViewer => 'عارض NFile المدمج';

  @override
  String get builtInViewerDescription => 'تجربة NFile المدمجة الأصلية';

  @override
  String get systemExternalApp => 'تطبيق خارجي من النظام';

  @override
  String get externalAppDescription =>
      'الفتح بتطبيقات الطرف الثالث الموجودة على الجهاز';

  @override
  String get justOnce => 'مرة واحدة فقط';

  @override
  String get goToParentDirectory => 'الانتقال إلى المجلد الأعلى';

  @override
  String get searchInTab => 'بحث في التبويب';

  @override
  String get noResults => 'لا نتائج';

  @override
  String get emptyFolder => 'مجلد فارغ';

  @override
  String get internalStorage => 'التخزين الداخلي';

  @override
  String get browseDeviceFiles => 'تصفّح ملفات الجهاز';

  @override
  String storageUsed(String size) {
    return '$size مُستخدَمة';
  }

  @override
  String storageTotal(String size) {
    return '$size إجمالًا';
  }

  @override
  String storageUsedPercent(int percent) {
    return '$percent% مُستخدَمة';
  }

  @override
  String storageFree(String size) {
    return '$size متاحة';
  }

  @override
  String get noShortcutsPinned =>
      'لا توجد اختصارات مثبّتة. اضغط «تخصيص الاختصارات» لإضافتها.';

  @override
  String get customizeShortcuts => 'تخصيص الاختصارات';

  @override
  String get dragToReorderHint =>
      'اسحب العناصر من المقبض (=) لإعادة ترتيب الأيقونات في الشاشة الرئيسية.';

  @override
  String get addFolderFileShortcut => 'إضافة اختصار مجلد أو ملف';

  @override
  String get customPaths => 'المسارات المخصّصة';

  @override
  String customPathsCount(int count) {
    return '$count مسار مخصّص';
  }

  @override
  String get deleteShortcut => 'حذف الاختصار';

  @override
  String get defaultScanLocations => 'مواقع المسح الافتراضية:';

  @override
  String get restoreLocation => 'استعادة الموقع';

  @override
  String get excludeLocation => 'استثناء الموقع';

  @override
  String get customScanLocations => 'مواقع المسح المخصّصة:';

  @override
  String get noCustomPaths => 'لم تُضَف أي مسارات مخصّصة.';

  @override
  String get addCustomPath => 'إضافة مسار مخصّص';

  @override
  String get recentFiles => 'الملفات الأخيرة';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get restrictedSystemFolder => 'مجلد نظام مقيَّد';

  @override
  String get restrictedFolderExplanation =>
      'يقيّد أندرويد 11 وما فوق الوصول المعتاد إلى مجلدَي Android/data وAndroid/obb لحماية بيانات التطبيقات. ولعرض هذه الملفات وتعديلها يحتاج NFile إلى أذونات متقدمة.';

  @override
  String get useRootAccess => 'استخدام صلاحيات Root (Superuser)';

  @override
  String get grantShizukuAccess => 'منح وصول Shizuku (دون Root)';

  @override
  String get howToSetupShizuku => 'كيف أُعدّ Shizuku؟';

  @override
  String get searchSettings => 'ابحث في الإعدادات...';

  @override
  String failedToTransfer(String error) {
    return 'فشل النقل: $error';
  }

  @override
  String get operationCancelled => 'أُلغيت العملية';

  @override
  String failedToConnect(String error) {
    return 'فشل الاتصال بالخادم البعيد: $error';
  }

  @override
  String get compressionLimitExceeded => 'تجاوز حدّ الضغط';

  @override
  String get cannotMoveFolderIntoItself =>
      'لا يمكن نقل مجلد إلى داخل نفسه أو إلى المكان نفسه';

  @override
  String movedSuccessfully(String name) {
    return 'نُقل $name بنجاح';
  }

  @override
  String failedToMoveItem(String error) {
    return 'فشل نقل العنصر: $error';
  }

  @override
  String get cannotCopyFolderIntoItself =>
      'لا يمكن نسخ مجلد إلى داخل نفسه أو إلى المكان نفسه';

  @override
  String copiedSuccessfully(String name) {
    return 'نُسخ $name بنجاح';
  }

  @override
  String failedToCopyItem(String error) {
    return 'فشل نسخ العنصر: $error';
  }

  @override
  String get sdCard => 'بطاقة SD';

  @override
  String transferFailed(String error) {
    return 'فشل النقل: $error';
  }

  @override
  String get movedItemsSuccessfully => 'نُقلت العناصر بنجاح';

  @override
  String get copiedItemsSuccessfully => 'نُسخت العناصر بنجاح';

  @override
  String get releaseChannel => 'مستقر';
}
