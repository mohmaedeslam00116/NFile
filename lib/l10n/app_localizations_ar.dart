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

  @override
  String get preparingShare => 'يجري تجهيز المجلدات للمشاركة...';

  @override
  String get compressingContents => 'يجري ضغط المحتويات، انتظر من فضلك';

  @override
  String get noShareableItems => 'لم يُعثر على عناصر قابلة للمشاركة.';

  @override
  String errorPreparingShare(String error) {
    return 'خطأ في تجهيز الملفات للمشاركة: $error';
  }

  @override
  String get newFile => 'ملف جديد';

  @override
  String get fileName => 'اسم الملف';

  @override
  String fileNameTaken(String fileName, String createdName) {
    return 'الاسم «$fileName» موجود بالفعل. أُنشئ «$createdName» بدلًا منه.';
  }

  @override
  String get newFolder => 'مجلد جديد';

  @override
  String get folderName => 'اسم المجلد';

  @override
  String folderNameTaken(String folderName, String createdName) {
    return 'الاسم «$folderName» موجود بالفعل. أُنشئ «$createdName» بدلًا منه.';
  }

  @override
  String get createNewDirectory => 'أنشئ مجلدًا جديدًا';

  @override
  String get createNewTextDocument => 'أنشئ مستندًا نصيًا فارغًا';

  @override
  String get newArchive => 'أرشيف جديد';

  @override
  String get compressFolderContents => 'ضغط محتويات المجلد الحالي';

  @override
  String get viewAndSortOptions => 'خيارات العرض والترتيب';

  @override
  String get layoutMode => 'نمط التخطيط';

  @override
  String get listView => 'عرض قائمة';

  @override
  String get gridView => 'عرض شبكي';

  @override
  String get sizeAndPaddingOptions => 'خيارات الحجم والمسافات';

  @override
  String get iconAndFolderSize => 'حجم الأيقونة والمجلد';

  @override
  String get itemPaddingAndSpacing => 'حشوة العناصر والمسافات بينها';

  @override
  String get sortBy => 'ترتيب حسب';

  @override
  String get showHiddenFiles => 'إظهار الملفات المخفية';

  @override
  String get showHiddenHint => 'إظهار ملفات ومجلدات النظام التي تبدأ بنقطة (.)';

  @override
  String get onlyThisFolder => 'هذا المجلد فقط';

  @override
  String get onlyThisFolderHint => 'تفعيل ترتيب مخصّص لهذا المجلد';

  @override
  String get storageVolumes => 'وحدات التخزين';

  @override
  String get networkConnections => 'اتصالات الشبكة';

  @override
  String get addNetworkConnection => 'إضافة اتصال شبكة';

  @override
  String connectionTypeAndHost(String type, String host) {
    return '$type • $host';
  }

  @override
  String get removeConnection => 'إزالة الاتصال';

  @override
  String get createNew => 'إنشاء جديد';

  @override
  String foldersCount(int count) {
    return 'المجلدات: $count';
  }

  @override
  String filesCount(int count) {
    return 'الملفات: $count';
  }

  @override
  String get noResultsFound => 'لم يُعثر على نتائج';

  @override
  String nothingMatchesSearch(String query, String filter) {
    return 'لم نعثر على أي شيء يطابق «$query» ضمن $filter';
  }

  @override
  String get emptyFolderHint =>
      'لا يحتوي هذا المجلد على أي ملفات أو مجلدات فرعية.';

  @override
  String get actionCancelled => 'أُلغي الإجراء / أُفرغت الحافظة';

  @override
  String get pastedHoldingClipboard =>
      'تم اللصق (مع الاحتفاظ بالافظة لصقٍ متكرر)';

  @override
  String get pastedSuccessfully => 'تم اللصق بنجاح';

  @override
  String get pasteHere => 'ألصق هنا';

  @override
  String get selectMode => 'وضع التحديد';

  @override
  String get storageVolumesAndSdCard => 'وحدات التخزين وبطاقة SD';

  @override
  String labelFilterActive(String label) {
    return 'فلتر $label مُفعَّل';
  }

  @override
  String get createFolder => 'إنشاء مجلد';

  @override
  String get enterFolderName => 'أدخل اسم المجلد';

  @override
  String errorCreatingFolder(String error) {
    return 'خطأ في إنشاء المجلد: $error';
  }

  @override
  String get selectStorageDrive => 'اختر وحدة التخزين';

  @override
  String get selectStorage => 'اختر التخزين';

  @override
  String get clearSelection => 'إلغاء التحديد';

  @override
  String get folderIsEmpty => 'المجلد فارغ';

  @override
  String pinSelected(int count) {
    return 'تثبيت المحدَّد ($count)';
  }

  @override
  String get pinThisFolder => 'ثبّت هذا المجلد';

  @override
  String addSelected(int count) {
    return 'إضافة المحدَّد ($count)';
  }

  @override
  String get overallProgress => 'التقدّم الإجمالي';

  @override
  String get renamingFiles => 'يجري إعادة تسمية الملفات...';

  @override
  String get updatingFolderContent => 'انتظر من فضلك، يجري تحديث محتوى المجلد';

  @override
  String get batchRename => 'إعادة تسمية جماعية';

  @override
  String configuringItems(int count) {
    return 'يجري ضبط $count عنصرًا';
  }

  @override
  String get placeholderName => '%% (الاسم)';

  @override
  String get placeholderNameHint => 'الاسم الأصلي (%%)';

  @override
  String get placeholderNum => '# (رقم)';

  @override
  String get placeholderNumHint => 'رقم تسلسلي (#)';

  @override
  String get placeholderTripleHint => 'رقم تسلسلي ثلاثي (###)';

  @override
  String placeholderBase(String n) {
    return '$n (الأساس)';
  }

  @override
  String placeholderBaseHint(String n) {
    return 'اسم الملف دون الامتداد ($n)';
  }

  @override
  String placeholderExtensionWithDot(String de) {
    return '$de (.امتداد)';
  }

  @override
  String placeholderExtensionWithDotHint(String de) {
    return 'الامتداد مع النقطة ($de)';
  }

  @override
  String placeholderExtension(String e) {
    return '$e (امتداد)';
  }

  @override
  String placeholderExtensionHint(String e) {
    return 'الامتداد دون النقطة ($e)';
  }

  @override
  String placeholderFull(String N) {
    return '$N (كامل)';
  }

  @override
  String placeholderFullHint(String N) {
    return 'الاسم الكامل مع الامتداد ($N)';
  }

  @override
  String get namePattern => 'نمط الاسم';

  @override
  String get namePatternExample => 'مثال: Image_#';

  @override
  String get startNumber => 'رقم البداية';

  @override
  String get findText => 'ابحث عن نص';

  @override
  String get searchTerm => 'كلمة البحث';

  @override
  String get replaceWith => 'استبدل بـ';

  @override
  String get renamePreview => 'معاينة إعادة التسمية';

  @override
  String reviewingItems(int count) {
    return 'يجري مراجعة $count عنصرًا';
  }

  @override
  String get backToEdit => 'العودة إلى التعديل';

  @override
  String get applyChanges => 'تطبيق التغييرات';

  @override
  String get fileAlreadyExists => 'الملف موجود بالفعل';

  @override
  String fileConflictQuestion(String fileName) {
    return 'يوجد ملف باسم «$fileName» في مجلد الوجهة بالفعل. ماذا تريد أن تفعل؟';
  }

  @override
  String get existingFile => 'الملف الموجود';

  @override
  String get applyToAllConflicts => 'تطبيق على بقية التعارضات';

  @override
  String get cancelPaste => 'إلغاء اللصق';

  @override
  String get keepBoth => 'الإبقاء على الاثنين';

  @override
  String get renameFile => 'إعادة تسمية الملف';

  @override
  String get newFilename => 'اسم الملف الجديد';

  @override
  String get createArchive => 'إنشاء أرشيف';

  @override
  String get archiveName => 'اسم الأرشيف';

  @override
  String get archiveFormat => 'صيغة الأرشيف';

  @override
  String compressionLevel(String level) {
    return 'مستوى الضغط: $level';
  }

  @override
  String get passwordOptional => 'كلمة المرور (اختياري)';

  @override
  String get splitVolumeSize => 'حجم الجزء بالميغابايت (اختياري)';

  @override
  String get splitVolumeSizeHint => 'اتركه فارغًا لأرشيف واحد';

  @override
  String get deleteSourceAfter => 'حذف الملفات الأصلية بعد الانتهاء';

  @override
  String get separateArchivePerFile => 'إنشاء أرشيف منفصل لكل ملف';

  @override
  String get dragAndDropOptions => 'خيارات السحب والإفلات';

  @override
  String get destinationLocation => 'موقع الوجهة';

  @override
  String get droppedFolder => 'المجلد المُفلَت';

  @override
  String get currentFolder => 'المجلد الحالي';

  @override
  String get chooseAction => 'اختر الإجراء';

  @override
  String get moveHere => 'انقل إلى هنا';

  @override
  String get moveHereHint => 'اقطع العنصر والصقه في مجلد الوجهة';

  @override
  String get copyHere => 'انسخ إلى هنا';

  @override
  String get copyHereHint => 'يترك الملف الأصلي كما هو وينسخه هنا';

  @override
  String get archiveHere => 'أرشِف هنا';

  @override
  String get archiveHereHint => 'اضغط العنصر في أرشيف zip/tar هنا';

  @override
  String archiveCreated(String name) {
    return 'أُنشئ الأرشيف «$name» بنجاح!';
  }

  @override
  String failedToCreateArchive(String error) {
    return 'فشل إنشاء الأرشيف: $error';
  }

  @override
  String get extractArchive => 'استخراج الأرشيف';

  @override
  String get extractToFolder => 'استخراج إلى مجلد';

  @override
  String get passwordIfEncrypted => 'كلمة المرور (إن كان مشفّرًا)';

  @override
  String get allFiles => 'كل الملفات';

  @override
  String get allFilesHint => 'إظهار كل الملفات والمجلدات في هذا المجلد';

  @override
  String get documentsOnly => 'المستندات فقط';

  @override
  String get documentsOnlyHint =>
      'ملفات PDF وWord وجداول النصوص والنصوص والكتب الإلكترونية';

  @override
  String get imagesOnly => 'الصور فقط';

  @override
  String get imagesOnlyHint => 'صيغ JPEG وPNG وWebP وصور الكاميرا الخام';

  @override
  String get audioOnly => 'الصوتيات فقط';

  @override
  String get audioOnlyHint => 'صيغ MP3 وWAV وAAC وصوتيات عالية الدقة';

  @override
  String get videosOnly => 'الفيديوهات فقط';

  @override
  String get videosOnlyHint => 'صيغ MP4 وMKV وWebM ومقاطع فيديو عالية الدقة';

  @override
  String get archivesOnly => 'الأرشيفات فقط';

  @override
  String get archivesOnlyHint =>
      'ملفات ZIP و7Z وRAR وغيرها من الملفات المضغوطة';

  @override
  String get filterFilesByType => 'تصفية الملفات حسب النوع';

  @override
  String get filterFilesHint => 'اختر فئة لعرض الملفات المطابقة فقط';

  @override
  String processingItem(int current, int total) {
    return 'يجري معالجة العنصر $current من $total';
  }

  @override
  String get transferSpeed => 'سرعة النقل';

  @override
  String get estimatedTime => 'الزمن التقديري';

  @override
  String get dataProcessed => 'البيانات المعالجة';

  @override
  String get cancelOperation => 'إلغاء العملية';

  @override
  String get pastedItemsSuccessfully => 'لُصقت العناصر بنجاح';

  @override
  String get calculatingSizes => 'يجري حساب الأحجام...';

  @override
  String get itemsSelected => 'العناصر المحدَّدة';

  @override
  String get totalSize => 'الحجم الإجمالي';

  @override
  String get selectedPaths => 'المسارات المحدَّدة:';

  @override
  String copiedLabelToClipboard(String label) {
    return 'نُسخ $label إلى الحافظة';
  }

  @override
  String get copySelected => 'نسخ المحدَّد';

  @override
  String get cutSelected => 'نقل المحدَّد';

  @override
  String get archiveCompress => 'أرشفة (ضغط)';

  @override
  String get propertiesAndInfo => 'الخصائص والمعلومات';
}
