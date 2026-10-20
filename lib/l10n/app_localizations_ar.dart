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
  String get noFilesToShare => 'لا توجد ملفات للمشاركة.';

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
  String get noResultsFound => 'لا توجد نتائج';

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
  String get filterAll => 'الكل';

  @override
  String get filterFolders => 'المجلدات';

  @override
  String deleteSelectedItemsQuestion(int count) {
    return 'هل تريد بالتأكيد حذف $count عنصرًا محددًا؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String deleteItemsQuestion(int count) {
    return 'هل تريد بالتأكيد حذف $count عنصرًا؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get deleteItemQuestion =>
      'هل تريد بالتأكيد حذف هذا العنصر؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get cannotCutPasteSameFolder =>
      'لا يمكن قص الملف ولصقه في المجلد نفسه.';

  @override
  String shareAppMessage(String url) {
    return 'جرّب NFile، مدير ملفات ومركز وسائط جميل يعمل دون إنترنت: $url';
  }

  @override
  String get deviceGalleryAuto => 'معرض الجهاز (تلقائي)';

  @override
  String get deviceAudioLibraryAuto => 'مكتبة صوت الجهاز (تلقائي)';

  @override
  String get deviceGalleryScreenshots => 'معرض الجهاز (لقطات الشاشة)';

  @override
  String get internalStorageAllFolders =>
      'التخزين الداخلي (تم فحص كل المجلدات)';

  @override
  String get searchYourStorage => 'ابحث في وحدة التخزين';

  @override
  String get searchThisFolder => 'ابحث في هذا المجلد';

  @override
  String get searchEverythingHint =>
      'اعثر على أي ملف أو مجلد أو مستند أو وسائط فورًا في جميع أنحاء جهازك';

  @override
  String searchInFolderNamed(String folder) {
    return 'ابحث في الملفات والمجلدات الفرعية: $folder';
  }

  @override
  String noMatchForQuery(String query, String filter) {
    return 'لم نعثر على أي شيء يطابق \"$query\" في $filter';
  }

  @override
  String get rootDirectory => 'الجذر';

  @override
  String get copyFileSuffix => '(نسخة)';

  @override
  String get tarFormatsMemoryWarning =>
      'تسبب صيغتا TAR.ZSTD و TAR.LZ4 استهلاكًا كبيرًا للذاكرة، وهما محسّنتان للملفات الأصغر من 600 ميغابايت. يرجى استخدام صيغة ZIP أو TAR للملفات الأكبر.';

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

  @override
  String get extractingBundle => 'يجري استخراج حزمة التطبيق للتثبيت...';

  @override
  String get noInstallableApk => 'لم يُعثر على ملف APK قابل للتثبيت في الحزمة';

  @override
  String get failedToTriggerInstaller => 'فشل تشغيل مُثبّت الملفات المقسّمة';

  @override
  String failedToExtractBundle(String error) {
    return 'فشل استخراج حزمة التطبيق: $error';
  }

  @override
  String get settingsBackedUp =>
      'نُسخت الإعدادات إلى NFile/Backups/Settings/nfile_settings_backup.json';

  @override
  String failedToBackupSettings(String error) {
    return 'فشل نسخ الإعدادات: $error';
  }

  @override
  String get settingsRestored => 'استُعيدت الإعدادات بنجاح!';

  @override
  String failedToRestoreSettings(String error) {
    return 'فشل استعادة الإعدادات: $error';
  }

  @override
  String get backupAndRestore => 'النسخ الاحتياطي والاستعادة';

  @override
  String get backupSettings => 'نسخ الإعدادات';

  @override
  String get backupSettingsHint =>
      'احفظ كل إعداداتك الحالية في NFile/Backups/Settings/';

  @override
  String get restoreSettings => 'استعادة الإعدادات';

  @override
  String get restoreSettingsHint =>
      'اختر ملف نسخة احتياطية بصيغة JSON واستعد منه الإعدادات';

  @override
  String get selectValidBackupFile =>
      'الرجاء اختيار ملف نسخة احتياطية صالح بصيغة .json';

  @override
  String get settingsCategories => 'فئات الإعدادات';

  @override
  String get generalAndBehavior => 'عام والسلوك';

  @override
  String get generalAndBehaviorHint =>
      'الشاشة الافتراضية، وأدوات التنقل، والاختصارات';

  @override
  String get appearanceAndThemes => 'المظهر والألوان';

  @override
  String get appearanceAndThemesHint =>
      'الألوان، وأيقونات التطبيق، وأنماط المجلدات، والخطوط';

  @override
  String get fileExplorerOptions => 'خيارات مستكشف الملفات';

  @override
  String get fileExplorerOptionsHint =>
      'شريط العنوان، والملفات المخفية، والتبويبات، والسحب والإفلات';

  @override
  String get listAndLayoutStyling => 'تنسيق القوائم والتخطيط';

  @override
  String get listAndLayoutStylingHint =>
      'أحجام المجلدات، والأعداد، وصيغ الوقت والتاريخ';

  @override
  String get mediaPreferences => 'تفضيلات الوسائط';

  @override
  String get mediaPreferencesHint =>
      'عرض الألبومات الافتراضي ومعاينات الصور المصغّرة';

  @override
  String get fileActionsAndViewers => 'إجراءات الملفات والعارضات';

  @override
  String get fileActionsAndViewersHint =>
      'إجراءات الفتح وضبط العارضات الافتراضية';

  @override
  String get recycleBinTrash => 'سلة المحذوفات (المهملات)';

  @override
  String get recycleBinTrashHint => 'خيارات سلة المحذوفات ومدة الحذف التلقائي';

  @override
  String get noSettingsFound => 'لم يُعثر على إعدادات';

  @override
  String get tryAnotherKeyword => 'جرّب البحث عن كلمة أخرى';

  @override
  String get defaultToBrowseScreen => 'البدء بشاشة التصفّح';

  @override
  String get defaultToBrowseScreenHint =>
      'افتح مستكشف التخزين مباشرة عند بدء التطبيق';

  @override
  String get rememberLastFolder => 'تذكّر آخر مجلد فُتح';

  @override
  String get rememberLastFolderHint =>
      'افتح آخر مجلد تصفّحته عند تشغيل التطبيق';

  @override
  String get showHomeBrowseBottomBar =>
      'إظهار الشريط السفلي في الرئيسية والتصفية';

  @override
  String get showHomeBrowseBottomBarHint =>
      'تبديل ظهور شريط التنقل السفلي في الشاشة الرئيسية';

  @override
  String get hideBottomNavLabels => 'إخفاء تسميات الشريط السفلي';

  @override
  String get hideBottomNavLabelsHint =>
      'إخفاء تسميات الشريط السفلي (الرئيسية/التصفية) لمظهر أنظف وأكثر اختصارًا';

  @override
  String get hideAndroidNavBar => 'إخفاء شريط تنقل أندرويد';

  @override
  String get hideAndroidNavBarHint =>
      'إخفاء شريط التنقل السفلي لتوسيع مساحة الشاشة (يظهر عند السحب لأعلى)';

  @override
  String get preventLeftBackGesture => 'منع إيماءة الرجوع من اليسار';

  @override
  String get preventLeftBackGestureHint =>
      'يستثني الحافة اليسرى من الشاشة من إيماءات الرجوع في أندرويد، فيصبح فتح القائمة بالتمرير أسهل. ما زال بإمكانك التمرير من الحافة اليمنى للرجوع.';

  @override
  String get appExitBehavior => 'سلوك خروج التطبيق';

  @override
  String get showBottomNavBar => 'إظهار الشريط السفلي';

  @override
  String get showBottomNavBarHint =>
      'تفعيل شريط الإجراءات السفلي في شاشة التصفّح';

  @override
  String get hideActionBarLabels => 'إخفاء تسميات شريط الإجراءات';

  @override
  String get hideActionBarLabelsHint =>
      'إظهار الأيقونات فقط في شريط التحديد أسفل شاشتي التصفّح والوسائط';

  @override
  String get customizeShortcutsHint =>
      'أعد ترتيب عناصر الفئات السريعة وأظهرها أو أخفها';

  @override
  String get showRecentFiles => 'إظهار الملفات الأخيرة';

  @override
  String get showRecentFilesHint =>
      'اعرض قائمة الملفات التي فُتحت مؤخرًا في الشاشة الرئيسية';

  @override
  String get accentColorDynamicTheme => 'اللون المميّز / السمة الديناميكية';

  @override
  String get folderIconStyle => 'نمط أيقونة المجلد';

  @override
  String get drawerButtonStyle => 'نمط زر قائمة التطبيق';

  @override
  String get amoledBlackMode => 'وضع الأسود لشاشات AMOLED';

  @override
  String get amoledBlackModeHint =>
      'استخدم خلفية سوداء تمامًا في الوضع الداكن لشاشات AMOLED';

  @override
  String get appIcon => 'أيقونة التطبيق';

  @override
  String get appTypographyFontFamily => 'خط التطبيق / عائلة الخطوط';

  @override
  String get useExpressiveIcons => 'استخدام أيقونات Material التعبيرية';

  @override
  String get useExpressiveIconsHint =>
      'استبدل أيقونات Broken المخصّصة بأيقونات Material Design القياسية';

  @override
  String get showAddressBar => 'إظهار شريط العنوان';

  @override
  String get showAddressBarHint =>
      'اعرض شريط عنوان قابل للتعديل على طراز مستكشف ويندوز أعلى قائمة الملفات';

  @override
  String get showFloatingAddButton => 'إظهار زر «+» العائم';

  @override
  String get showFloatingAddButtonHint =>
      'فعّل زر الإنشاء السريع (+) أسفل شاشة التصفّح';

  @override
  String get showHiddenFilesHint =>
      'إظهار ملفات ومجلدات النظام التي تبدأ بنقطة (.)';

  @override
  String get highlightExitedFolder => 'إبراز المجلد الذي خرجت منه';

  @override
  String get highlightExitedFolderHint =>
      'ومض المجلد الذي خرجت منه والتمرير إليه عند الرجوع';

  @override
  String get enableMultipleTabs => 'تفعيل التبويبات المتعددة';

  @override
  String get enableMultipleTabsHint =>
      'اسمح بفتح عدة مجلدات في تبويبات منفصلة للتنقل السريع';

  @override
  String get enableSplitScreen => 'تفعيل الشاشة المقسّمة';

  @override
  String get enableSplitScreenHint =>
      'تصفّح مجلدين جنبًا إلى جنب ونقل الملفات بسهولة';

  @override
  String get enableDragAndDrop => 'تفعيل السحب والإفلات';

  @override
  String get enableDragAndDropHint =>
      'اضغط مطوّلًا واسحب المجلدات أو الملفات لنقلها إلى مجلدات أخرى';

  @override
  String get confirmDragAndDrop => 'تأكيد إجراءات السحب والإفلات';

  @override
  String get confirmDragAndDropHint =>
      'اعرض قائمة الخيارات (نسخ، نقل، أرشفة) عند إفلات الملفات';

  @override
  String get showCountHeader => 'إظهار ترويسة عدد المجلدات والملفات';

  @override
  String get showCountHeaderHint =>
      'اعرض إجمالي عدد المجلدات والملفات أسفل شريط عنوان التخزين';

  @override
  String get showFolderContentCount => 'إظهار عدد محتويات المجلد';

  @override
  String get showFolderContentCountHint =>
      'احسب واعرض إجمالي الملفات والمجلدات داخل قوائم المجلدات';

  @override
  String get showFolderSize => 'إظهار حجم المجلد';

  @override
  String get showFolderSizeHint =>
      'احسب واعرض الحجم الإجمالي لكل الملفات داخل المجلدات (قد يؤثر على سرعة عرض القوائم)';

  @override
  String get use24HourTime => 'استخدام نظام 24 ساعة';

  @override
  String get use24HourTimeHint =>
      'بدّل بين صيغة 12 ساعة (ص/م) و24 ساعة في كل القوائم';

  @override
  String get hideTimeAndDate => 'إخفاء الوقت والتاريخ من القوائم';

  @override
  String get hideTimeAndDateHint =>
      'أخفِ تمامًا تواريخ وأوقات التعديل أسفل الملفات والمجلدات';

  @override
  String get adaptiveMultiLineNames => 'أسماء ملفات متعدّدة الأسطر';

  @override
  String get adaptiveMultiLineNamesHint =>
      'اسمح لأسماء الملفات بالالتفاف على ٣ أسطر بدلًا من بترها';

  @override
  String get hideThreeDotButtons => 'إخفاء أزرار النقاط الثلاث';

  @override
  String get hideThreeDotButtonsHint =>
      'أخفِ زر قائمة النقاط الثلاث بجوار المجلدات والملفات';

  @override
  String get threeDotTrailingInfo => 'معلومات بديلة عند إخفاء أزرار النقاط';

  @override
  String get defaultAlbumView => 'عرض الألبومات المفضّل';

  @override
  String get defaultAlbumViewHint =>
      'افتح فئتَي الصور والفيديوهات مباشرة في عرض المجلدات (الألبومات) المفضّل';

  @override
  String get showMediaPreviews => 'إظهار معاينات الوسائط';

  @override
  String get showMediaPreviewsHint =>
      'اعرض صور الفيديو والصور المصغّرة الفعلية بدل أيقونات الملفات العامة';

  @override
  String get skipOpenWithDialog => 'تخطَّ نافذة «فتح بـ»';

  @override
  String get skipOpenWithDialogHint =>
      'تجاوز نافذة اختيار التطبيق وافتح الملفات فورًا بالعارضات الافتراضية';

  @override
  String get resetDefaultViewers => 'إعادة ضبط عارضات الملفات الافتراضية';

  @override
  String get resetDefaultViewersHint =>
      'امسح كل الارتباطات المحفوظة في «فتح بـ» لعارضات الملفات';

  @override
  String get viewersReset => 'أُعيد ضبط كل اختيارات العارضات الافتراضية';

  @override
  String get enableRecycleBin => 'تفعيل سلة المحذوفات';

  @override
  String get enableRecycleBinHint =>
      'انقل الملفات والمجلدات المحذوفة إلى سلة محذوفات مخفية بدلًا من حذفها نهائيًا';

  @override
  String get autoDeleteDuration => 'مدة الحذف التلقائي من المهملات';

  @override
  String get autoDeleteDurationHint =>
      'ستُحذف عناصر سلة المحذوفات نهائيًا بعد هذه المدة.';

  @override
  String get chooseTrailingInfoStyle => 'اختر نمط المعلومات البديلة';

  @override
  String get chooseTrailingInfoStyleHint =>
      'اختر ما يظهر في الجانب الأيمن من الملفات والمجلدات عند إخفاء أزرار النقاط الثلاث.';

  @override
  String get chooseExitBehavior => 'اختر سلوك الخروج';

  @override
  String get chooseAccentTheme => 'اختر سمة اللون';

  @override
  String get chooseFolderIconStyle => 'اختر نمط أيقونة المجلد';

  @override
  String get chooseDrawerButtonStyle => 'اختر نمط زر القائمة';

  @override
  String get appLauncherIcon => 'أيقونة مشغّل التطبيق';

  @override
  String get appLauncherIconHint =>
      'اختر شعارًا مخصّصًا لأيقونة التطبيق في المشغّل. لاحظ أن بعض المشغّلات قد تستغرق بضع ثوانٍ للتحديث.';

  @override
  String get logo1 => 'الشعار ١';

  @override
  String get logo2 => 'الشعار ٢';

  @override
  String get logo3 => 'الشعار ٣';

  @override
  String get logo4 => 'الشعار ٤';

  @override
  String appIconSwitched(String title) {
    return 'تم تغيير أيقونة التطبيق إلى $title بنجاح!';
  }

  @override
  String get appTypography => 'خط التطبيق';

  @override
  String get appTypographyHint =>
      'اختر خطًا جميلًا لتخصيص المظهر العام لتطبيق NFile';

  @override
  String customFontApplied(String name) {
    return 'طُبِّق الخط المخصّص «$name» بنجاح!';
  }

  @override
  String get failedToLoadFont => 'فشل تحميل ملف الخط المختار.';

  @override
  String get invalidFileType => 'نوع ملف غير صالح';

  @override
  String get invalidFontFileHint =>
      'الرجاء اختيار ملف خط صالح بصيغة OpenType (.otf) أو TrueType (.ttf).';

  @override
  String get removeCustomFont => 'إزالة الخط المخصّص';

  @override
  String get customFontRemoved => 'أُزيل الخط المخصّص.';

  @override
  String get accentMaterialYou => 'Material You (ألوان الخلفية الديناميكية)';

  @override
  String get accentVibrantOrange => 'برتقالي نابض';

  @override
  String get accentRoyalPurple => 'بنفسجي ملكي';

  @override
  String get accentEmeraldGreen => 'أخضر زمردي';

  @override
  String get accentCrimsonRed => 'أحمر قرمزي';

  @override
  String get accentAmberGold => 'ذهبي كهرماني';

  @override
  String get accentCyberpunkPink => 'وردي سايبربانك';

  @override
  String get accentSapphireBlue => 'أزرق ياقوتي';

  @override
  String get accentForestGreen => 'أخضر الغابة';

  @override
  String get accentSunsetPeach => 'خوخ الغروب';

  @override
  String get folderIconClassicSolid => 'كلاسيكي مصمت (Material)';

  @override
  String get folderIconModernRounded => 'حديث مستدير (Material)';

  @override
  String get folderIconStarred => 'نجمة خاصة (Material)';

  @override
  String get folderIconSnippet => 'مستند مقتطف (Material)';

  @override
  String get folderIconMinimalOutlined => 'بسيط محدَّد (Material)';

  @override
  String get drawerStyleCategoryGrid => 'شبكة الفئات / شبكة Vuesax';

  @override
  String get drawerStyleHamburger => 'هامبرغر / قائمة كلاسيكية';

  @override
  String get defaultLogo => 'الشعار الافتراضي';

  @override
  String get fontDotMatrix => 'نقطية وsans';

  @override
  String get fontOutfit => 'Outfit الحديث';

  @override
  String get fontJetBrains => 'JetBrains Tech Mono';

  @override
  String get fontMontserrat => 'Montserrat الحضري';

  @override
  String get fontCustom => 'خط مخصّص مستورد';

  @override
  String get trailingInfoDateTime => 'التاريخ والوقت';

  @override
  String get trailingInfoSizeCount => 'حجم الملف / عدد العناصر';

  @override
  String get backupAndRestoreHint => 'احفظ إعداداتك في ملف JSON أو استعدها';

  @override
  String get ftpServerStopped => 'أُوقف خادم FTP بنجاح';

  @override
  String ftpServerStartedAt(String address) {
    return 'بدأ خادم FTP على $address';
  }

  @override
  String errorStartingFtpServer(String error) {
    return 'خطأ في بدء خادم FTP: $error';
  }

  @override
  String get stopServerBeforeChanging => 'أوقف الخادم قبل تغيير الإعدادات';

  @override
  String get changePort => 'تغيير المنفذ';

  @override
  String get portNumber => 'رقم المنفذ';

  @override
  String get invalidPortNumber => 'رقم المنفذ غير صالح';

  @override
  String get setUsername => 'تعيين اسم المستخدم';

  @override
  String get usernameNotEmpty => 'لا يمكن ترك اسم المستخدم فارغًا';

  @override
  String get stopServerBeforeEditing => 'أوقف الخادم قبل تعديل الإعدادات';

  @override
  String get ftpShortcutAdded => 'أُضيف اختصار خادم FTP إلى الشاشة الرئيسية!';

  @override
  String get changeDirectory => 'تغيير المجلد';

  @override
  String get changePortLower => 'تغيير المنفذ';

  @override
  String get setUser => 'تعيين المستخدم';

  @override
  String get anonymousAccess => 'وصول مجهول';

  @override
  String get createShortcut => 'إنشاء اختصار';

  @override
  String get networkStatus => 'حالة الشبكة';

  @override
  String get serverAddress => 'عنوان الخادم';

  @override
  String get homeDirectory => 'المجلد الرئيسي';

  @override
  String get userName => 'اسم المستخدم';

  @override
  String get showHiddenFilesLower => 'إظهار الملفات المخفية';

  @override
  String get secureFtpHint => 'اتصال FTP آمن عبر TLS صريح';

  @override
  String connectionAdded(String name) {
    return 'أُضيف «$name» بنجاح!';
  }

  @override
  String get systemAppDisabled => 'تطبيق النظام معطّل';

  @override
  String get noDocumentsApp =>
      'لا يوجد في جهازك تطبيق افتراضي لملفات النظام/المستندات (DocumentsUI) مفعّل، وهو مطلوب من أندرويد لاختيار المجلدات وتثبيتها.\n\nتأكّد من أن تطبيق النظام \"الملفات\" أو \"المستندات\" معطّل في إعدادات جهازك، أو فعّله لاستخدام ميزات مجلدات SAF.';

  @override
  String failedToRequestSafFolder(String error) {
    return 'فشل طلب مجلد SAF: $error';
  }

  @override
  String get enterConnectionName => 'الرجاء إدخال اسم الاتصال';

  @override
  String get enterServerAddress => 'الرجاء إدخال عنوان الخادم أو اسم المضيف';

  @override
  String connectedSuccessfully(String name) {
    return 'اتصل «$name» بنجاح!';
  }

  @override
  String connectionFailed(String error) {
    return 'فشل الاتصال: $error';
  }

  @override
  String get remoteConnections => 'الاتصالات البعيدة';

  @override
  String stepOf(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get selectNetworkService => 'اختر خدمة الشبكة';

  @override
  String get selectNetworkServiceHint =>
      'ثبّت خادمًا بعيدًا أو مشاركة NAS كقرص ديناميكي ضمن قوائم تخزين NFile.';

  @override
  String selectedTypeSettings(String type) {
    return 'إعدادات $type';
  }

  @override
  String get enterConnectionDetails =>
      'أدخل بيانات الاتصال لربط وحدة التخزين هذه.';

  @override
  String get connectionNameExample => 'مثال: NAS المكتب، مشاركة المنزل';

  @override
  String get connectionPathExample => 'مثال: /dav أو /';

  @override
  String get connectionUserExample => 'مثال: anonymous أو admin';

  @override
  String get creatingMountPoint => 'يجري إنشاء نقطة التثبيت...';

  @override
  String establishingPathway(String type) {
    return 'انتظر من فضلك بينما نُنشئ مسارًا موثوقًا إلى خادم $type.';
  }

  @override
  String get httpsSecure => 'HTTPS (آمن)';

  @override
  String get deleteItem => 'حذف العنصر';

  @override
  String deleteRemoteItemQuestion(String name) {
    return 'حذف «$name» نهائيًا من الخادم؟';
  }

  @override
  String get newRemoteFolder => 'مجلد بعيد جديد';

  @override
  String get copyToLocalDevice => 'نسخ إلى الجهاز';

  @override
  String get copyToLocalDeviceHint => 'يُنزّل الملف إلى حافظة الجهاز';

  @override
  String get moveToLocalDevice => 'نقل إلى الجهاز';

  @override
  String get moveToLocalDeviceHint => 'يُنزّل الملف ويحذفه من الخادم';

  @override
  String connectionTypeServer(String type) {
    return 'خادم $type';
  }

  @override
  String get uploadClipboardToServer => 'رفع حافظة الجهاز إلى الخادم';

  @override
  String get connectionLost => 'انقطع الاتصال';

  @override
  String get retryConnection => 'إعادة الاتصال';

  @override
  String get emptyDirectory => 'مجلد فارغ';

  @override
  String get uploadClipboardHere => 'ارفع الحافظة هنا';

  @override
  String errorLoadingVault(String error) {
    return 'خطأ في تحميل الخزنة: $error';
  }

  @override
  String get chooseProtectionMode => 'اختر نمط الحماية';

  @override
  String get chooseProtectionModeHint =>
      'اختر كيف تريد حماية ملفاتك المحدَّدة. تُشفَّر الملفات المحمية فورًا.';

  @override
  String get secureImportSandbox => 'استيراد آمن (صندوق عزل)';

  @override
  String get inPlaceScramble => 'تشويش في المكان (سريع)';

  @override
  String get scramblingProtecting => 'يجري التشويش والحماية...';

  @override
  String protectedItems(int count, String failed) {
    return 'حُمي $count عنصرًا بنجاح.$failed';
  }

  @override
  String restoredToOriginal(String name) {
    return 'استُعيد «$name» إلى مكانه الأصلي.';
  }

  @override
  String failedToRestoreFile(String error) {
    return 'فشل استعادة الملف: $error';
  }

  @override
  String get deletePermanentlyQuestion => 'حذف نهائي؟';

  @override
  String deletePermanentlyQuestionHint(int count) {
    return 'هل تريد بالتأكيد حذف هذه $count عناصر نهائيًا؟ لا يمكن التراجع عن ذلك.';
  }

  @override
  String get fileDeletedPermanently => 'حُذف الملف نهائيًا.';

  @override
  String failedToDeleteFile(String error) {
    return 'فشل حذف الملف: $error';
  }

  @override
  String get decryptingSecurely => 'يجري فك التشفير بأمان...';

  @override
  String failedToDecryptItem(String error) {
    return 'فشل فك تشفير العنصر وفتحه: $error';
  }

  @override
  String get securityDetails => 'تفاصيل الأمان';

  @override
  String get searchScrambledFiles => 'ابحث في الملفات المشوّشة...';

  @override
  String get hideFiles => 'إخفاء الملفات';

  @override
  String get securityStorage => 'تخزين آمن';

  @override
  String get totalSpaceSecured => 'إجمالي المساحة المؤمَّنة';

  @override
  String get hiddenFiles => 'الملفات المخفية';

  @override
  String get restoreUnhide => 'استعادة (إظهار)';

  @override
  String get deletePermanently => 'حذف نهائي';

  @override
  String get clearAll => 'مسح الكل';

  @override
  String get httpServerStopped => 'أُوقف خادم المشاركة المحلي عبر HTTP.';

  @override
  String httpServerStarted(String url) {
    return 'بدأ خادم المشاركة المحلي عبر HTTP! الرابط: $url';
  }

  @override
  String errorStartingHttpServer(String error) {
    return 'خطأ في بدء خادم HTTP: $error';
  }

  @override
  String get tunnelDeactivated => 'أُوقف نفق المشاركة عبر الإنترنت.';

  @override
  String get establishingRelay => 'يجري إنشاء وسيط آمن...';

  @override
  String get tunnelOnline => 'نفق الإنترنت السحابي متاح! الرابط المؤقت نشط.';

  @override
  String failedToStartCloudShare(String error) {
    return 'فشل بدء المشاركة السحابية: $error';
  }

  @override
  String get linkCopied => 'نُسخ الرابط إلى الحافظة!';

  @override
  String get scanQrCode => 'امسح رمز QR';

  @override
  String scanToOpen(String type) {
    return 'امسح الرمز بجهاز آخر لفتح $type فورًا.';
  }

  @override
  String get webSharingHub => 'مركز المشاركة عبر الويب';

  @override
  String get localWebShare => 'المشاركة المحلية عبر الويب';

  @override
  String get internetShareLink => 'رابط المشاركة عبر الإنترنت';

  @override
  String get httpLocalShareServer => 'خادم المشاركة المحلي عبر HTTP';

  @override
  String get httpLocalShareServerHint =>
      'يسمح للأجهزة الأخرى على شبكة Wi-Fi نفسها بالوصول إلى ملفاتك وعرضها وبثها في متصفحها.';

  @override
  String get serverOnlineStreaming => 'الخادم متاح ويبثّ';

  @override
  String get directBrowserUrl => 'رابط المتصفح المباشر:';

  @override
  String get copyUrl => 'نسخ الرابط';

  @override
  String get qrCode => 'رمز QR';

  @override
  String sharingDirectory(String folder) {
    return 'المجلد المُشارَك: $folder';
  }

  @override
  String get serverIdle => 'الخادم خامل';

  @override
  String get serverIdleHint =>
      'تأكّد أن الأجهزة الأخرى على شبكة Wi-Fi نفسها التي عليها هذا الجهاز، ثم ابدأ الخادم.';

  @override
  String get internetShareTunnel => 'نفق المشاركة عبر الإنترنت';

  @override
  String get internetShareTunnelHint =>
      'ينشئ رابط نفق عام مؤقتًا وآمنًا. شارك هذا الرابط مع أي شخص في أي مكان على الإنترنت ليُنزّل الملفات بسرعة عالية مهما كان حجمها.';

  @override
  String get cloudTunnelActive => 'نفق السحابة نشط';

  @override
  String get temporaryShareLink => 'رابط المشاركة المؤقت (نشط ٢٤ ساعة):';

  @override
  String get copyLink => 'نسخ الرابط';

  @override
  String get connectedClients => 'المتصفحات المتصلة';

  @override
  String get waitingForDownloads => 'في انتظار التنزيلات من الإنترنت...';

  @override
  String get internetSharingInactive => 'المشاركة عبر الإنترنت معطّلة';

  @override
  String get internetSharingInactiveHint =>
      'فعّل النفق لإنشاء رابط آمن يعمل خارج شبكة Wi-Fi المحلية.';

  @override
  String get compressingFiles => 'يجري ضغط الملفات';

  @override
  String get extractingArchive => 'يجري استخراج الأرشيف';

  @override
  String errorReadingSharedFile(String error) {
    return 'خطأ في قراءة الملف 공유ًا: $error';
  }

  @override
  String extractedTo(String item, String folder) {
    return 'استُخرج $item إلى $folder';
  }

  @override
  String itemsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'نُسخت $count عنصر إلى الحافظة ✓',
      many: 'نُسخت $count عنصرًا إلى الحافظة ✓',
      few: 'نُسخت $count عناصر إلى الحافظة ✓',
      two: 'نُسخ عنصران إلى الحافظة ✓',
      one: 'نُسخ عنصر واحد إلى الحافظة ✓',
      zero: 'نُسخ 0 عناصر إلى الحافظة ✓',
    );
    return '$_temp0';
  }

  @override
  String get deleteSelectedItems => 'حذف العناصر المحدَّدة';

  @override
  String deleteItemsFromArchiveQuestion(int count) {
    return 'هل تريد بالتأكيد حذف هذه $count عناصر من الأرشيف؟ لا يمكن التراجع عن ذلك.';
  }

  @override
  String get itemsDeletedSuccessfully => 'حُذفت العناصر بنجاح ✓';

  @override
  String get failedToDeleteItems => 'فشل حذف العناصر';

  @override
  String addedToArchive(int count) {
    return 'أُضيف $count عنصر إلى الأرشيف بنجاح ✓';
  }

  @override
  String pastedIntoArchive(int count) {
    return 'لُصق $count عنصر في الأرشيف ✓';
  }

  @override
  String selectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'محدَّد $count',
      many: 'محدَّد $count',
      few: 'محدَّد $count',
      two: 'محدَّدان',
      one: 'محدَّد واحد',
      zero: 'لا محدَّد',
    );
    return '$_temp0';
  }

  @override
  String get couldNotReadArchive => 'تعذّرت قراءة الأرشيف';

  @override
  String get extractToCurrentFolder => 'استخراج إلى المجلد الحالي';

  @override
  String pasteHereCount(int count) {
    return 'ألصق هنا ($count)';
  }

  @override
  String get addFile => 'إضافة ملف';

  @override
  String get losslessAudio => 'صوت بلا فقد';

  @override
  String get soundFx => 'مؤثرات صوتية';

  @override
  String get sleepTimer => 'مؤقّت النوم';

  @override
  String get playingQueue => 'قائمة التشغيل';

  @override
  String minutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقيقة',
      many: '$count دقيقة',
      few: '$count دقائق',
      two: 'دقيقتان',
      one: 'دقيقة واحدة',
      zero: '0 دقيقة',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSet(int count) {
    return 'ضُبط مؤقّت النوم على $count دقيقة.';
  }

  @override
  String get soundAndSpeedFx => 'مؤثرات الصوت والسرعة';

  @override
  String get playbackSpeed => 'سرعة التشغيل';

  @override
  String get pitchAdjustment => 'ضبط النغمة';

  @override
  String get resetToDefault => 'إعادة الضبط الافتراضي';

  @override
  String get backgroundPlaybackStopped => 'أُوقف التشغيل في الخلفية';

  @override
  String get backgroundPlaybackEnabled => 'فُعّل التشغيل في الخلفية';

  @override
  String get viewSynchronizedLyrics => 'عرض الكلمات المتزامنة';

  @override
  String get soundFxAndEqualizer => 'مؤثرات الصوت والمساواة';

  @override
  String get setSleepTimer => 'ضبط مؤقّت النوم';

  @override
  String get audioFileInfo => 'معلومات الملف الصوتي';

  @override
  String playingQueueCount(int count) {
    return 'قائمة التشغيل ($count)';
  }

  @override
  String get lyricsLoaded => 'حُمّلت الكلمات بنجاح';

  @override
  String get noSynchronizedLyrics => 'لم يُعثر على كلمات متزامنة';

  @override
  String get noSynchronizedLyricsHint =>
      'ضع ملف .lrc بنفس اسم الأغنية بجوارها، أو اختره يدويًا أدناه.';

  @override
  String get loadLrcFile => 'تحميل ملف LRC';

  @override
  String get tapLineToSeek => 'اضغط سطرًا للانتقال في التشغيل';

  @override
  String get noDataToExport => 'لا توجد بيانات للتصدير.';

  @override
  String exportedTo(String file) {
    return 'صُدِّر بنجاح إلى $file';
  }

  @override
  String exportFailed(String error) {
    return 'فشل التصدير: $error';
  }

  @override
  String get sqliteReader => 'قارئ قواعد بيانات SQLite';

  @override
  String get failedToOpenDatabase => 'فشل فتح قاعدة البيانات';

  @override
  String get noTablesFound => 'لم يُعثر على جداول في قاعدة البيانات هذه.';

  @override
  String get exportTableToCsv => 'تصدير الجدول إلى CSV';

  @override
  String get searchRows => 'ابحث في الصفوف...';

  @override
  String get noRowsFound => 'لم يُعثر على صفوف';

  @override
  String showingRange(int from, int to) {
    return 'عرض $from - $to';
  }

  @override
  String get noSchemaLoaded => 'لم تُحمَّل تفاصيل المخطط.';

  @override
  String schemaType(String type) {
    return 'النوع: $type';
  }

  @override
  String schemaDefault(String value) {
    return 'القيمة الافتراضية: $value';
  }

  @override
  String get sqlEditor => 'محرّر SQL';

  @override
  String get selectTemplate => 'قالب SELECT';

  @override
  String get enterSelectQuery => 'أدخل استعلام SELECT هنا...';

  @override
  String get exportResultsToCsv => 'تصدير النتائج إلى CSV';

  @override
  String get runQuery => 'تشغيل الاستعلام';

  @override
  String queryReturnedRows(int count) {
    return 'أعاد الاستعلام $count صفًا';
  }

  @override
  String errorLoading(String error) {
    return 'خطأ في التحميل: $error';
  }

  @override
  String get savedSuccessfully => 'حُفظ بنجاح ✓';

  @override
  String errorSaving(String error) {
    return 'خطأ في الحفظ: $error';
  }

  @override
  String get pdfDisplaySettings => 'إعدادات عرض PDF';

  @override
  String get pdfDisplaySettingsHint =>
      'حسّن أداء العرض للمستندات الكبيرة أو الغنية بالتصميم أو الممسوحة ضوئيًا.';

  @override
  String get quickPerformancePresets => 'إعدادات أداء سريعة';

  @override
  String get standardMode => 'الوضع العادي';

  @override
  String get standardModeHint => 'الأفضل للمستندات النصية';

  @override
  String get lagFreeMode => 'وضع بلا تأخّر';

  @override
  String get lagFreeModeHint => 'الأفضل للمطابقات والصور';

  @override
  String get detailedTuning => 'خيارات ضبط تفصيلية';

  @override
  String get pageLayout => 'تخطيط الصفحة';

  @override
  String get singlePage => 'صفحة واحدة';

  @override
  String get scrollDirection => 'اتجاه التمرير';

  @override
  String get enableTextSelection => 'تفعيل تحديد النص';

  @override
  String get enableTextSelectionHint =>
      'عطّله لزيادة سرعة عرض الصفحات بدرجة كبيرة وإزالة تقطّع التمرير.';

  @override
  String get displaySettings => 'إعدادات العرض';

  @override
  String get openWithLabel => 'فتح بـ';

  @override
  String get emptySheet => 'ورقة فارغة';

  @override
  String slideNumber(int number) {
    return 'الشريحة $number';
  }

  @override
  String get openWithApp => 'فتح بتطبيق';

  @override
  String get shareComingSoon => 'المشاركة قريبًا';

  @override
  String get htmlPreview => 'معاينة HTML';

  @override
  String get markdownPreview => 'معاينة Markdown';

  @override
  String imageIndexOfTotal(int current, int total) {
    return '$current من $total';
  }

  @override
  String get failedToLoadImage => 'فشل تحميل الصورة';

  @override
  String get confirmDeletion => 'تأكيد الحذف';

  @override
  String confirmPermanentDelete(int count) {
    return 'هل تريد بالتأكيد حذف $count عنصرًا محدَّدًا نهائيًا؟';
  }

  @override
  String deletedItemsCount(int count) {
    return 'حُذف $count عنصرًا بنجاح';
  }

  @override
  String pastedItemsTo(int count, String folder) {
    return 'لُصق $count عنصر في $folder';
  }

  @override
  String get noFilesToRename => 'لم يُعثر على ملفات فعلية لإعادة تسميتها';

  @override
  String get longPressToOpenWith => 'اضغط مطوّلًا للفتح بـ...';

  @override
  String copiedNameToClipboard(String name) {
    return 'نُسخ $name إلى الحافظة';
  }

  @override
  String cutNameToClipboard(String name) {
    return 'نُقل $name إلى الحافظة';
  }

  @override
  String permanentlyDeleteName(String name) {
    return 'حذف «$name» نهائيًا؟';
  }

  @override
  String deletedName(String name) {
    return 'حُذف $name';
  }

  @override
  String get fileNotShareable => 'الملف غير موجود أو لا يمكن مشاركته.';

  @override
  String get sortOptions => 'خيارات الترتيب';

  @override
  String get sortNewestFirst => 'الأحدث أولًا';

  @override
  String get sortOldestFirst => 'الأقدم أولًا';

  @override
  String get sortDateWise => 'حسب التاريخ';

  @override
  String get sortNewestGrouped => 'الأحدث أولًا (مجموعًا حسب الشهر)';

  @override
  String get sortOldestGrouped => 'الأقدم أولًا (مجموعًا حسب الشهر)';

  @override
  String get sortSizeLargeFirst => 'الحجم (الكبير أولًا)';

  @override
  String get sortSizeSmallFirst => 'الحجم (الصغير أولًا)';

  @override
  String noItemsOfKindFound(String kind) {
    return 'لم يُعثر على $kind';
  }

  @override
  String get allItems => 'كل العناصر';

  @override
  String countItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عنصر',
      many: '$count عنصرًا',
      few: '$count عناصر',
      two: 'عنصران',
      one: 'عنصر واحد',
      zero: '0 عناصر',
    );
    return '$_temp0';
  }

  @override
  String restoredSuccessfully(int count) {
    return 'استُعيد $count عنصر بنجاح';
  }

  @override
  String errorRestoringItems(String error) {
    return 'خطأ في استعادة العناصر: $error';
  }

  @override
  String permanentlyDeleted(int count) {
    return 'حُذف $count عنصرًا نهائيًا';
  }

  @override
  String errorDeletingItems(String error) {
    return 'خطأ في حذف العناصر: $error';
  }

  @override
  String get emptyRecycleBinQuestion => 'إفراغ سلة المحذوفات؟';

  @override
  String get emptyRecycleBinQuestionHint =>
      'هل تريد بالتأكيد حذف كل عناصر سلة المحذوفات نهائيًا؟ لا يمكن التراجع عن ذلك.';

  @override
  String get emptyBin => 'إفراغ السلة';

  @override
  String get binEmptied => 'أُفرغت سلة المحذوفات بنجاح';

  @override
  String errorEmptyingBin(String error) {
    return 'خطأ في إفراغ السلة: $error';
  }

  @override
  String get searchDeletedFiles => 'ابحث في الملفات المحذوفة...';

  @override
  String get emptyRecycleBinAction => 'إفراغ سلة المحذوفات';

  @override
  String originalPath(String path) {
    return 'المسار الأصلي: $path';
  }

  @override
  String deletedAtAndSize(String date, String size) {
    return 'حُذف: $date • $size';
  }

  @override
  String get recycleBinIsEmpty => 'سلة المحذوفات فارغة';

  @override
  String get recycleBinIsEmptyHint =>
      'العناصر التي تحذفها عند تفعيل سلة المحذوفات تظهر هنا. يمكنك استعادتها أو حذفها نهائيًا.';

  @override
  String errorLoadingFile(String error) {
    return 'خطأ في تحميل الملف: $error';
  }

  @override
  String get fileSavedSuccessfully => 'حُفظ الملف بنجاح';

  @override
  String errorSavingFile(String error) {
    return 'خطأ في حفظ الملف: $error';
  }

  @override
  String replacedOccurrences(int count) {
    return 'استُبدل $count موضعًا';
  }

  @override
  String get selectSyntax => 'اختر الصياغة';

  @override
  String get findAndReplace => 'بحث / استبدال';

  @override
  String get saveFile => 'حفظ الملف';

  @override
  String get moreOptions => 'خيارات أخرى';

  @override
  String defaultZoom(int size) {
    return 'التكبير الافتراضي ($size نقطة)';
  }

  @override
  String syntaxOf(String language) {
    return 'الصياغة ($language)';
  }

  @override
  String get replaceWithDots => 'استبدل بـ...';

  @override
  String get replaceAll => 'استبدال الكل';

  @override
  String get slideToUnlock => 'اسحب / اضغط لفتح القفل';

  @override
  String get lockControls => 'قفل أدوات التحكم';

  @override
  String get repeatMode => 'وضع التكرار';

  @override
  String get mediaPathCopied => 'نُسخ مسار الوسائط إلى الحافظة.';

  @override
  String speedValue(double speed) {
    return 'السرعة $speed×';
  }

  @override
  String get continuousLayout => 'مستمر';

  @override
  String editorLanguageAndLines(String language, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سطر',
      many: '$count سطرًا',
      few: '$count أسطر',
      two: 'سطران',
      one: 'سطر واحد',
      zero: '0 سطر',
    );
    return '$language  $_temp0';
  }

  @override
  String get editorModified => ' (معدَّل)';

  @override
  String deleteVaultFileQuestionHint(String name) {
    return 'هل تريد بالتأكيد حذف «$name» نهائيًا؟ لا يمكن التراجع عن ذلك.';
  }

  @override
  String get appManager => 'مدير التطبيقات';

  @override
  String get refreshList => 'تحديث القائمة';

  @override
  String get sortBySize => 'ترتيب حسب الحجم';

  @override
  String get sortAlphabetically => 'ترتيب أبجدي';

  @override
  String get exactStorageCalculation => 'حساب دقيق للحجم';

  @override
  String get exactStorageCalculationHint =>
      'لرؤية أحجام التطبيقات الدقيقة (APK والبيانات والتخزين المؤقت) بدل حجم ملف التثبيت وحده، فعّل إذن الوصول إلى بيانات الاستخدام لتطبيق NFile في إعدادات النظام.';

  @override
  String get grantUsageAccess => 'منح إذن الوصول إلى الاستخدام';

  @override
  String get storageAnalytics => 'تحليل التخزين';

  @override
  String get rescanStorage => 'إعادة فحص التخزين';

  @override
  String get scanningDeviceStorage => 'يجري فحص تخزين الجهاز';

  @override
  String get analyzingStorage =>
      'يجري تحليل الملفات، وتصنيف الوسائط، وقراءة مساحة التطبيقات المثبتة...';

  @override
  String get totalStorage => 'إجمالي التخزين';

  @override
  String storageUsedWithPercent(String size, String percent) {
    return '$size مُستخدَمة ($percent%)';
  }

  @override
  String get systemAndOther => 'النظام / أخرى';

  @override
  String percentOfTotalStorage(String percent) {
    return '$percent% من إجمالي التخزين';
  }

  @override
  String get uninstallApps => 'إلغاء تثبيت التطبيقات';

  @override
  String uninstallAppsQuestion(int count) {
    return 'هل تريد بالتأكيد إلغاء تثبيت $count تطبيق محدَّد؟';
  }

  @override
  String get backingUpApps => 'يجري نسخ التطبيقات المحدَّدة...';

  @override
  String backedUpApps(int count) {
    return 'نُسخ $count تطبيق بنجاح إلى NFile/Backups/Apps/';
  }

  @override
  String failedToBackUpApps(String error) {
    return 'فشل نسخ بعض التطبيقات: $error';
  }

  @override
  String get noApplicationsFound => 'لم يُعثر على تطبيقات';

  @override
  String packageAndVersion(String package, String version) {
    return '$package • الإصدار $version';
  }

  @override
  String appSizeAndInstalled(String size, String date) {
    return 'الحجم: $size • تاريخ التثبيت: $date';
  }

  @override
  String get launchApplication => 'تشغيل التطبيق';

  @override
  String get systemSettingsDetails => 'إعدادات النظام / التفاصيل';

  @override
  String get backUpApk => 'نسخ ملف APK';

  @override
  String get backingUpApk => 'يجري نسخ ملف APK...';

  @override
  String get shareApkFile => 'مشاركة ملف APK';

  @override
  String get uninstallApplication => 'إلغاء تثبيت التطبيق';

  @override
  String backupKindAndVersion(String kind, String version) {
    return '$kind • الإصدار $version';
  }

  @override
  String backupKindAndVersionFull(String kind, String version) {
    return '$kind • الإصدار $version';
  }

  @override
  String backupSizeAndDate(String size, String date) {
    return 'الحجم: $size • تاريخ النسخة: $date';
  }

  @override
  String get restoreOrInstallApp => 'استعادة التطبيق أو تثبيته';

  @override
  String get shareBackupFile => 'مشاركة ملف النسخة';

  @override
  String get deleteBackupFile => 'حذف ملف النسخة';

  @override
  String get noBackupsFound => 'لم يُعثر على نسخ';

  @override
  String downloadingFile(String file) {
    return 'يُنزَّل: $file';
  }

  @override
  String sentBytes(String amount) {
    return 'أُرسل: $amount';
  }

  @override
  String get exitConfirmationLabel => 'تأكيد الخروج';

  @override
  String get actionCancel => 'إلغاء';

  @override
  String get actionExit => 'خروج';

  @override
  String get actionHome => 'الرئيسية';

  @override
  String get actionBrowse => 'تصفّح';

  @override
  String get drawerNavigation => 'التنقّل';

  @override
  String get customizationAndSettings => 'التخصيص والإعدادات';

  @override
  String get lightMode => 'الوضع الفاتح';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get categoryImages => 'الصور';

  @override
  String get categoryVideos => 'الفيديوهات';

  @override
  String get categoryAudio => 'الصوت';

  @override
  String get categoryDocuments => 'المستندات';

  @override
  String get categoryArchives => 'الأرشيفات';

  @override
  String get categoryDownloads => 'التنزيلات';

  @override
  String get categoryApks => 'ملفات APK';

  @override
  String get categoryScreenshots => 'لقطات الشاشة';

  @override
  String get categoryApps => 'التطبيقات';

  @override
  String get categoryManager => 'المدير';

  @override
  String get categoryBin => 'السلة';

  @override
  String get categorySettings => 'الإعدادات';

  @override
  String get categoryConfigure => 'إعداد';

  @override
  String get itemFolder => 'مجلد';

  @override
  String get itemFile => 'ملف';

  @override
  String get actionCustomize => 'تخصيص';

  @override
  String get actionDone => 'تم';

  @override
  String get actionRename => 'إعادة تسمية';

  @override
  String get searchGloballyHint => 'بحث شامل...';

  @override
  String get searchInFolderHint => 'بحث في هذا المجلد...';

  @override
  String get actionCopy => 'نسخ';

  @override
  String get actionCut => 'نقل';

  @override
  String get actionDelete => 'حذف';

  @override
  String get actionShare => 'مشاركة';

  @override
  String get actionProperties => 'الخصائص';

  @override
  String get allRecentFiles => 'كل الملفات الأخيرة';

  @override
  String get actionRefresh => 'تحديث';

  @override
  String get deleteItemLabel => 'حذف العنصر';

  @override
  String get closeSearch => 'إغلاق البحث';

  @override
  String get searchInPane => 'بحث في اللوحة';

  @override
  String get searchPlaceholder => 'بحث...';

  @override
  String get unpinTab => 'إلغاء تثبيت التبويب';

  @override
  String get pinTab => 'تثبيت التبويب';

  @override
  String get openWithAlways => 'دائمًا';

  @override
  String get actionArchive => 'أرشفة';

  @override
  String get actionExtract => 'استخراج';

  @override
  String get timeJustNow => 'الآن';

  @override
  String get timeYesterday => 'أمس';

  @override
  String timeMinutesAgo(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count دقيقة',
      many: 'قبل $count دقيقة',
      few: 'قبل $count دقائق',
      two: 'قبل دقيقتين',
      one: 'قبل دقيقة',
      zero: 'الآن',
    );
    return '$_temp0';
  }

  @override
  String timeHoursAgo(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count ساعة',
      many: 'قبل $count ساعة',
      few: 'قبل $count ساعات',
      two: 'قبل ساعتين',
      one: 'قبل ساعة',
      zero: 'الآن',
    );
    return '$_temp0';
  }

  @override
  String timeDaysAgo(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count يوم',
      many: 'قبل $count يومًا',
      few: 'قبل $count أيام',
      two: 'قبل يومين',
      one: 'قبل يوم',
      zero: 'اليوم',
    );
    return '$_temp0';
  }

  @override
  String get appTagline => 'NFile - مدير ملفات جميل';

  @override
  String get localFolder => 'مجلد محلي';

  @override
  String get unknownArtist => 'فنان غير معروف';

  @override
  String get sdCardOrUsb => 'بطاقة SD / USB';

  @override
  String get connecting => 'جارٍ الاتصال...';

  @override
  String get starting => 'جارٍ البدء...';

  @override
  String dateDayMonth(int day, String month) {
    return '$day $month';
  }

  @override
  String get monthJanuary => 'يناير';

  @override
  String get monthFebruary => 'فبراير';

  @override
  String get monthMarch => 'مارس';

  @override
  String get monthApril => 'أبريل';

  @override
  String get monthMay => 'مايو';

  @override
  String get monthJune => 'يونيو';

  @override
  String get monthJuly => 'يوليو';

  @override
  String get monthAugust => 'أغسطس';

  @override
  String get monthSeptember => 'سبتمبر';

  @override
  String get monthOctober => 'أكتوبر';

  @override
  String get monthNovember => 'نوفمبر';

  @override
  String get monthDecember => 'ديسمبر';
}
