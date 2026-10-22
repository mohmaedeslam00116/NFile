# What Arabic-speaking users ask for and complain about (Android file managers)

Research ticket #46 · 2026-10-22 · corpus of 4,104 Arabic-language Play Store reviews plus Arabic
community threads.

This document records what Arabic-speaking users say about Android file managers, in their own
words, clustered by pain. For every cluster it states how often the complaint repeats, which app
it was heard on, a link to the text, and whether NFile answers it today.

Arabic is quoted verbatim; the translation is mine.

---

## 1. Method, and what I could and could not read

### 1.1 The review corpus

Google Play's store pages are rendered by script, so a plain `fetch` of a store page returns no
reviews. I drove a real headless Chrome over the DevTools Protocol, opened each app's store page
in the Arabic locale (`hl=ar`), clicked **عرض جميع المراجعات** ("see all reviews"), and then
replayed the store's own review RPC (`rpcids=oCPfdb`) from inside the page to walk its pagination
tokens to the end of the list. Each review was captured as first-party text: author, star rating,
date, body, and the review id that makes a permanent link.

Locales swept: `gl=SA` (primary), then `EG`, `AE`, `MA`, `DZ`, `KW`, `QA`. Sweeping the locales
returned the *same* review sets, so the corpus below is the full set the store exposed for these
apps in Arabic-market locales, not a truncated slice.

| App | Play id | Reviews collected | Written in Arabic | Date span of the Arabic set |
|---|---|---:|---:|---|
| Material Files | `me.zhanghai.android.files` | 100 | 87 | 2020-08 → 2026-09 |
| X-plore | `com.lonelycatgames.Xplore` | 1,002 | 848 | 2015-05 → 2026-10 |
| Files by Google | `com.google.android.apps.nbu.files` | 1,503 | 1,427 | 2018-09 → 2026-10 |
| MiXplorer Silver | `com.mixplorer.silver` | 9 | 6 | 2020-03 → 2026-08 |
| Total Commander | `com.ghisler.android.TotalCommander` | 146 | 118 | 2012-06 → 2026-09 |
| Solid Explorer | `pl.solidexplorer2` | 231 | 186 | 2015-07 → 2026-10 |
| ZArchiver | `ru.zdevs.zarchiver` | 1,508 | 1,432 | 2018-09 → 2026-10 |
| **Total** | | **4,499** | **4,104** | |

### 1.2 Community and forum text read

| Source | What was read | Language |
|---|---|---|
| `r/saudi_gamers` — "مشكلة في Zarchiver" | post + 3 comments | Arabic |
| `r/egyptrandom` — "حد عنده حل المشكله دي" | post + 3 comments | Arabic |
| `zyzoom.net` thread 420062 — "أندرويد - اذن النقل داخل ملف الداتا" | all 4 pages of posts | Arabic |
| Lonely Cat Games — "No access to Android/data on Android 11+" | full page | English (vendor, first-party) |
| ZDevs — "Storage access permissions" | full page | English (vendor, first-party) |
| `superuser2.com` — "الحل النهائي لمشكلة عدم وصولك لملفات data…" | full article | Arabic (tech site) |

### 1.3 Limits of this research — read these before trusting the counts

- **Reddit's own pages are blocked from this machine.** Every request to `reddit.com` (including
  `.json` and `old.reddit.com`) returned HTTP 403, and headless Chrome got Reddit's "Prove your
  humanity" bot challenge instead of the thread. The two Reddit threads above are therefore quoted
  from the search engine's rendering of those pages — the post and comment text is Reddit's, but
  I could not re-fetch the page myself to verify it.
- **Arabic Stack Exchange (`arabic.stackexchange.com`) and Ask Ubuntu Arabic
  (`askubuntu.com/ar`) both returned Cloudflare HTTP 403** from this machine. They are the two
  largest Arabic-language Q&A archives, and I could not read either. Nothing from them is used
  below.
- **The apps' own forums yielded no Arabic.** ZDevs' site is documentation only (RU/EN) with no
  user forum; X-plore's site is documentation only; Solid Explorer's and Total Commander's forums
  are English; the MiXplorer thread on XDA is English. So for "the apps' own forums" the honest
  answer is: **no Arabic-language user forum content exists for these apps** — the Arabic voice
  lives in the Play reviews and in Arabic-language communities such as the two subreddits and
  `zyzoom.net` above.
- **Material Files is capped at 100 reviews** by the store's review service for this client, in
  every locale I tried (SA, EG, AE, MA, DZ, KW, QA — identical 100 each time). Its 87 Arabic
  reviews are therefore a *sample*, not its population, and its numbers below understate it.
- **MiXplorer proper is not on Google Play.** The only listing is *MiXplorer Silver*
  (`com.mixplorer.silver`) with 9 reviews, 6 in Arabic. MiXplorer is distributed from its own
  site and XDA. So the ticket's "MiXplorer" benchmark has almost no Arabic store voice, and the
  community voice for it is English.
- Counts below are **distinct Arabic reviews matching a tight pattern**, not impressions. One
  review may match several clusters. Patterns are listed in the appendix and are reproducible.

### 1.4 A note on what the numbers mean

The corpus is dominated by positive reviews (Files by Google: 1,031 five-star out of 1,427
Arabic; ZArchiver: 860 five-star out of 1,432). The clusters below are therefore the *pain* the
happy majority never mentions. Where a cluster is thin (1–5 reviews), I say so rather than
inflating it.

---

## 2. The clusters

Summary table. "Reviews" = distinct Arabic reviews in the corpus that carry the complaint.
"Most-upvoted" = the store's own thumbs-up count on the **most-upvoted complaint or request** in
that cluster. A review that merely mentions the topic in passing, or praises a competitor's
version of it, is not counted here.

| # | Cluster | Reviews | Most-upvoted | Where heard |
|---|---|---:|---:|---|
| 1 | Android/data and Android/obb are unreachable | 116 | +1,919 | ZArchiver, Files by Google, X-plore, Material Files, Total Commander, Solid Explorer |
| 2 | The operation reports success while failing | 71 | +4,152 | ZArchiver |
| 3 | Rename is broken inside data/obb | 5 | +1,560 | ZArchiver |
| 4 | No recycle bin; deletes are permanent | 9 | +86 | Files by Google, X-plore, ZArchiver |
| 5 | The "secure folder" eats or locks away my own files | 36 | +1,254 | Files by Google |
| 6 | The app is not in Arabic, or Arabic was removed | 12 | +42 | Solid Explorer, Total Commander |
| 7 | Ads and donation walls | 28 | +10 | Files by Google, X-plore, ZArchiver, Solid Explorer |
| 8 | Trial expiry / licence nagging / paid | 5 | +25 | Solid Explorer, MiXplorer Silver |
| 9 | No copy/paste, no multi-file move | 4 | +152 | ZArchiver, X-plore, Files by Google |
| 10 | No in-app media playback, or playback that stops | 5 | +531 | Files by Google |
| 11 | Wants a storage analyzer / duplicate finder / app manager | 17 | +20 | Files by Google |
| 12 | Search and filtering too weak | 5 | +32 | Files by Google, X-plore, Solid Explorer, ZArchiver |
| 13 | Cannot send or share a file out of the app | 2 | +17 | ZArchiver, X-plore |
| 14 | Cannot write to the SD card / USB drive | 1 | +2 | X-plore |
| 15 | Too complex, or Arabic printed over an English UI | 26 | +228 | X-plore, ZArchiver, Files by Google, Total Commander |
| 16 | Slow, hangs, or wedges | 13 | +119 | Files by Google, ZArchiver, X-plore, Solid Explorer |
| 17 | Does not work on tablets | 1 | +28 | ZArchiver |
| 18 | Transfer over Wi-Fi / an FTP server | 2 | +34 (praise, not a request) | X-plore |
| 19 | Cloud drives (Drive, Dropbox, OneDrive, iCloud) | 1 | +961 (praise for a competitor) | Files by Google |
| 20 | Open or edit PDFs, documents and books in the app | 14 | +530 | Files by Google, X-plore, ZArchiver |
| 21 | Install an APK from the manager | 2 | +14 | X-plore, Total Commander |
| — | **Two panes / split view** | **0** | — | *no evidence found* |

---

## 3. Cluster details

### Cluster 1 — Android/data and Android/obb are unreachable

**The pain.** The two folders where games and apps keep their data are closed to the file
manager, so save files, mods and back-ups cannot be reached.

**How often.** 116 Arabic reviews (2.8% of the corpus). 108 of them are on ZArchiver alone
(7.5% of ZArchiver's 1,432 Arabic reviews) — and ZArchiver is the file manager Arabic Android
users actually reach for. A further 135 ZArchiver Arabic reviews mention `داتا`/`data`/`obb` at
all; 44 of them use the words "رفض الوصول" (access denied).

**Apps heard on.** ZArchiver (108), Files by Google (5), X-plore (1), Material Files (1),
Solid Explorer (1), Total Commander (1).

**The text.**

> «أصبح سيء لا يشغل على اندرويد حديث مثل اندرويد 14 كل ما افتح مسار Android ثم data ثم ملف لعبة تنكتب كلمة (تم رفض الوصول ) رغم إني سامح بفي الأذونات كامله ولاكن هذه المشكلة مستمره ولا يمكنني حتى انقل ملفات obb أو data بسبب هاذه الشيء رغم كان برنامج ممتاز اتمنى إصلاح ذالك الشيء بأسرع وقت من دعم ZDevs وشكراً جزيلًا.»
> — *ZArchiver, 2026-01-01, 1★, +1,919 votes*
> "It has become bad, it doesn't run on a modern Android like Android 14; every time I open the path Android → data → a game's folder it says **(access denied)**, even though I granted all the permissions; the problem persists and I can't even move obb or data files."

> «لا يستطيع الدخول الى android - data ويعطي الوصول مرفوص»
> — *X-plore, 2026-06-06, 1★, +11 votes*
> "It cannot enter android-data and gives access refused."

> «تطبيق لا يصلح لشيء يجب أن يكون لديك روت للوصول للداتا The app is useless because you need root
> to get to the data folder»
> — *Material Files, 2024-08-11, 1★, +1 vote*

> «لا يمكن تعديل ملاحظات تكست على بطاقة الذاكرة. ولا يمكن الكتابة على هارد خارجي من OTG»
> — *Total Commander, 2019-08-16, 3★, +73 votes*
> "Cannot edit text notes on the memory card, and cannot write to an external OTG drive."

Links:
[ZArchiver +1919](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=95752562-f406-4e22-ac72-0c25283eb06e) ·
[X-plore +11](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=1a8c77fe-6e89-4eda-b847-e60d4e86a6c1) ·
[Material Files](https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=e5a3e391-ff0b-4427-9d04-222e01bbd903) ·
[Total Commander +73](https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=a142b9ac-7fb5-4813-aea0-128a642f2e58) ·
[Files by Google +35](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=bf843b16-9b43-421e-9b6a-9ab419304283)

**Outside the store, the same pain in Arabic.** On `zyzoom.net`, thread "أندرويد - اذن النقل داخل
ملف الداتا" (7 February 2025), the thread starter writes:

> «عاوز حل لاذن النقل داخل ملف الداتا لانى جربت تطبيقات كتير ومفيش فايدة»
> "I want a solution for the transfer permission inside the data folder, because I have tried many
> apps and there is no point."
> — [zyzoom.net/threads/420062](https://zyzoom.net/threads/420062/)

and, three posts later, after being told to try X-plore:

> «حتى مع تطبيق shizuku يظهر نفس رمز الخطا مع كل التطبيقات»
> "Even with the Shizuku app the same error code appears with every app."

> «نفس النتيجة بعد ما احاول نسخ الملف يقول رفض الوصول مع خطأ فى العملية»
> "Same result after I try to copy the file — it says access refused with an error in the operation."

A moderator's answer in that thread names the workaround every Arabic user is told about —
uninstall the Files (DocumentsUI) update:

> «اذهب لاعدادات التطبيقات في الهاتف ابحث عن تطبيق files بالانجليزية … ابحق عن خيار uninstall
> updates أو ازالة التحديثات بعدها ارجع لتطبيق zarchiver وحاول مجددا الدخول لمجلد data / obb»
> "Go to the phone's app settings, look for the 'files' app in English … look for 'uninstall
> updates', then go back to ZArchiver and try entering data / obb again."

On `r/saudi_gamers` (June 2026):

> «كيف افتح ملفات ال Data ؟ تطبيق ZArchiver ما عاد يفتحها للاسف»
> "How do I open the Data files? ZArchiver no longer opens them, unfortunately."
> — [r/saudi_gamers](https://www.reddit.com/r/saudi_gamers/comments/1u8ifpm/)

and the reply that frames it as a platform wall, not an app bug:

> «في التحديثات الأخيرة في Android صار ممنوع إنك تدخل هذا المكان إلا إذا كان معك كمبيوتر عشان الحماية»
> "In recent Android updates it became forbidden to enter this place unless you have a computer,
> for protection."

and the one that spells out the cost:

> «لو تتكلم عن Android/Data استعمل shizuku — لو تتكلم عن Data/data ما يمديك، لازمك تسوي رووت للجوال
> و ذا بيمسح كل شي»
> "If you mean Android/Data, use Shizuku — if you mean Data/data, you can't; you must root the
> phone, and that wipes everything."

On `r/egyptrandom` (September 2026) the user wants to move shows to a flash drive:

> «Zarchiver بيديني انه مفيش اكسس عليه نهائي وحاولت بكل الطرق … عايز انقلهم علي فلاشه ومش عارف»
> "ZArchiver tells me there's no access at all and I've tried every way … I want to move them to a
> flash drive and I don't know how."
> — [r/egyptrandom](https://www.reddit.com/r/egyptrandom/comments/1w89rwm/)

The two vendors confirm this is a platform wall, not a bug they can fix. Lonely Cat Games
([known problems](https://www.lonelycatgames.com/docs/xplore/known-problems/no-android-data)) calls
it "a fight between app developers and Android developers, where one side is trying to find holes
in the system in order to provide functionality that users ask for, while the other side is trying
to patch holes in order to block what they planned to be blocked." ZDevs
([storage access permissions](https://zdevs.ru/en/za/sd_permissions.html)) says the March 2024
security patch "cannot be reversed, thus leaving two options: having root rights or Shizuku."

**Does NFile answer it? Partly.** NFile has a root mode and a Shizuku mode
(`lib/services/root_shizuku_service.dart`), and it shows a `RestrictedFolderBanner` that offers
*enable root* / *enable Shizuku* when the user hits a restricted system folder. That is exactly the
escape hatch the zyzoom thread tells people to use — and it is the route the Arabic thread
residents end up on.

It does **not** solve the unrooted case. NFile browses local storage by path
(`/storage/emulated/0`) under `MANAGE_EXTERNAL_STORAGE`, and on Android 11+ that permission alone
does not open `Android/data`; NFile's SAF client is a *remote* client
(`lib/services/remote/saf_client.dart`), not a document-tree grant for local storage. X-plore gets
in unrooted through a SAF path picker that lands directly on `Android/data` — the trick documented
in [sdmaid#5183](https://github.com/d4rken-org/sdmaid/issues/5183) — and NFile has no such route.
Nor does the `RestrictedFolderBanner` carry the forum's own instruction to uninstall the Files app
update, which is the single workaround Arabic users are told to use.

### Cluster 2 — The operation reports success while failing

**The pain.** The app says the copy/move/delete "completed" and then reports errors — or says
"completed with errors" and the files are half moved or not moved at all.

**How often.** 71 Arabic reviews, all on ZArchiver (5.0% of its Arabic reviews). 36 of them use
the exact phrase "اكتملت العملية مع وجود أخطاء" ("the operation completed with errors"); 69 use the
"مع وجود أخطاء" ("with errors") form. The single most-upvoted review in the whole corpus
(+4,152) is in this cluster.

**Apps heard on.** ZArchiver only. (The same failure mode appears on Files by Google, but users
describe it as "فشلت العملية" — "the operation failed" — which I did not fold into this cluster.)

**The text.**

> «البرنامج اصبح سيء جدا لدرجة انني لا استطيع نقل ملفات بعد الان يقول لي في كل مرة تمت العملية مع
> وجود اخطاء و لا ينقل الملفات كاملة ارجو اصلاح هذا حتا لو كنت اريد حذف الملفات يقول لي تمت العملية
> مع وجود اخطاء و الملفات لا تُحذف كاملة خصوصا عندما اريد نقل ملفات الى data هل هذه مشكلة اندرويد 13؟»
> — *ZArchiver, 2024-03-30, 1★, +4,152 votes*
> "The app has become very bad to the point that I can no longer move files; every time it tells me
> the operation completed with errors and doesn't move the files completely. I beg you to fix this —
> even when I try to delete files it says the operation completed with errors and the files are not
> deleted completely, especially when I want to move files into data. Is this an Android 13 problem?"

> «أرجو حل المشكلة في أجهزة سامسونج يدعم أندرويد 14 المشكلة هي تم الرفض الوصول في ملفات data توضيح
> المشكلة اكتملت العملية مع وجود أخطاء المشكلة الثانية تحديد مسار غير صحيح إلى أندرويد data»
> — *ZArchiver, 2024-03-10, 1★, +687 votes*
> "Please fix the problem on Samsung devices running Android 14. The problem is: access refused in
> data files. To clarify: the operation completed with errors. The second problem: an incorrect
> path is selected for Android data."

> «هاذا التطبيق كان بلنسبه لي افضل تطبيق ملفات لكن لم يعد يعمل على اندرويد13 … يضهر كلمه اكتملة
> العمليه مع وجود اخطاء»
> — *ZArchiver, 2023-05-23, 1★, +682 votes*
> "This app was the best file app for me but it no longer works on Android 13 … it shows the words
> 'the operation completed with errors'."

Links:
[+4,152](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=4765c2aa-bbd7-4ce8-8180-f31e0ad777b2) ·
[+1,111](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=2ea3486b-248c-4de1-994a-56f2316845d6) ·
[+687](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=ba5c03f0-804a-4923-a409-16b0bf2add77) ·
[+682](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=ca4f257d-2f29-4cc9-a7f9-ca6028a238f0) ·
[+536](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=d124240b-4083-40e6-8373-eb9fd8ebf72f)

**Does NFile answer it?** Not demonstrably. NFile has a file-operation progress dialog and a
conflict dialog (`lib/ui/widgets/file_operation_progress_dialog.dart`,
`lib/ui/widgets/conflict_dialog.dart`), but I found no evidence in the code that a partial failure
is surfaced as a failure to the user rather than as a completed operation with a warning. This is
a cluster NFile cannot be said to answer from the code alone; it needs a check that a failed item
in a batch is reported, counted and named.

### Cluster 3 — Rename is broken inside data/obb

**The pain.** Rename worked before the Android 13 update and now does not, specifically inside
`data` and `obb`.

**How often.** 5 Arabic reviews carry the precise "cannot rename in data/obb" wording; a broader
match on "تغيير اسم" (change name) finds 15 ZArchiver Arabic reviews, and 30 mention Android 13.
The rename complaint is the second-most-upvoted review in the corpus (+1,560).

**Apps heard on.** ZArchiver.

**The text.**

> «تطبيق أصبح اسوء كل مرة بحب انقل ملف يقول خطأ + لا استطيع تغير اسم ملف و حتا في اندرويد 13 لم
> يعد يشتغل كما كان مرجو تحديث وإصلاح مشاكل»
> — *ZArchiver, 2023-08-01, 1★, +1,560 votes*
> "The app has become worse: every time I want to move a file it says error, and I can't rename a
> file; even on Android 13 it no longer works as it did. Please update and fix."

> «لا أستطيع تغير اسم الملف في ال data او ال obb في اصدار اندرويد 13 ارجو حل المشكلة !»
> — *ZArchiver, 2023-02-02, 1★*
> "I can't rename the file in data or obb on Android 13. Please fix!"

> «لا يمكن تغير اسم الملف في اندرويد 13نرجو تحديث و كل للمشكله»
> — *ZArchiver, 2023-05-09, 1★, +4 votes*
> "Can't rename the file on Android 13."

Links:
[+1,560](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=a8384ddc-df36-448e-b807-a9c35cc16835) ·
[+167](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=fd305019-2eba-4bc6-ab72-6fd3968ea1dd) ·
[+4](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=5c989d8f-fa91-4280-acb4-449077d42e06) ·
[2023-12-16](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=3171a46c-5369-4022-adc6-c9a222a56700)

**Does NFile answer it?** Partly. Rename exists (`lib/ui/widgets/file_action_dialogs.dart`) and
NFile's root/Shizuku modes give it a path into `data`/`obb` that an unrooted SAF file picker
does not. But the specific 2023-era Android 13 failure — SAF grants a write URI for `data` that
does not extend to renaming inside it — is a platform behaviour NFile has to handle explicitly,
and I found no code in the repo that special-cases rename inside a restricted tree.

### Cluster 4 — No recycle bin; deletes are permanent

**The pain.** There is no trash, so a delete is a delete, and there is no way back.

**How often.** 9 Arabic reviews: Files by Google (7), X-plore (1), ZArchiver (1). Small in raw
count but it is the single most *requested* feature in the corpus — several of the requests come
from five-star reviewers asking for it explicitly.

**Apps heard on.** Files by Google, X-plore, ZArchiver.

**The text.**

> «تطبيق جميل جدا ولكن ياريت تعملوا سلة المهملات هسااا ،لانه انحذفت من عندي الملفات الضرورية و
> مايعرف كيف ارجعهم إذا اعملتوها بعلي ل 5 نجوم بدل 4.»
> — *Files by Google, 2024-12-21, 4★, +21 votes*
> "A very nice app, but please make a trash bin now, because important files were deleted from me
> and there's no way to get them back. If you do it, I'll give 5 stars instead of 4."

> «لايوجد تطوير للتطبيق ولا يوجد سلة محذوفات لاسترجاع الملفات ...سله محذوفات تحدد الملفات المحذوفة
> من الجاهز وتحدد ماهن الملفات المحذوفة من الذاكرة الخارجيةSD»
> — *Files by Google, 2021-12-25, 1★, +3 votes*
> "The app has no development and no recycle bin to restore files … a recycle bin that identifies
> the files deleted from the phone and identifies which were deleted from the external SD card."

> «عند حذف ملف من ذاكرة الهاتف الخارجية التطبيق يقوم بحذفه نهائياً ولا وجود لخيار حدف الملف الى
> سلة المحذوفات»
> — *X-plore, 2023-05-06, 3★, +4 votes*
> "When deleting a file from the external memory card, the app deletes it permanently — there is no
> option to move the file to the recycle bin."

> «ولا يوجد حتى سلة محذوفات في هذا التطبيق»
> — *ZArchiver, 2026-06-01, 3★, +86 votes*
> "And there isn't even a recycle bin in this app."

Links:
[Files by Google +21](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=16120424-5353-41e6-b299-d46f93b5133d) ·
[Files by Google +3](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=73bd6609-6028-473d-8efc-9dc1a2fa16e0) ·
[X-plore +4](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=2dcdb37b-bb10-443b-831e-e4e5aec41e8b) ·
[ZArchiver +86](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=491775c2-3a4c-46da-821e-b55c2f2f75ed)

**Does NFile answer it? Yes, with one hole.** NFile has a recycle bin
(`lib/services/recycle_bin_service.dart`, `lib/ui/screens/recycle_bin_screen.dart`) and the store
listing advertises it. But the trash lives at a fixed path —
`/storage/emulated/0/.nfile_trash` — i.e. internal storage only. The exact complaint above from
the X-plore reviewer ("deleting from the external memory card deletes permanently") therefore
still holds for NFile on SD card.

### Cluster 5 — The "secure folder" eats or locks away my own files

**The pain.** The private/secure area of the app loses the user's files on an app update, or
refuses the user's own password, or can be wiped with a "reset" that asks for no password at all.

**How often.** 36 Arabic reviews (2.5% of Files by Google's 1,427 Arabic reviews). The most
upvoted single review in this cluster is +1,254.

**Apps heard on.** Files by Google only.

**The text.**

> «تطبيق ممتاز وجميل لاكن بعد التحديث الاخير هناك مشكلة في نقل الملفات او الصور الى المجلد الآمن
> احول انقل ملفات يظهر لي هناك خطاء ولا استطيع عكس قبل التحديث كنت انقل الملفات بسهولة»
> — *Files by Google, 2024-05-05, 4★, +1,254 votes*
> "A great app, but since the last update there's a problem moving files or images into the Secure
> Folder — when I try to move files it says error and I can't undo it; before the update I moved
> files easily."

> «تطبيق جميل بعض الشيء لكن سبب النجمة الواحدة هو الغباء في تصميم المجلد الأمن الذي يستطيع أي شخص
> وبدون معرفة كلمة السر حذف محتويات المجلد من خيار إعادة ضبط المجلد الأمن»
> — *Files by Google, 2023-03-13, 1★, +429 votes*
> "A good app, but the reason for one star is the stupidity of the Secure Folder design: anybody,
> without knowing the password, can delete the contents of the folder via the 'reset secure folder'
> option."

> «قبل فتره كنت محتفظ بصور مهمه جدا في المجلد الآمن وقمت ب ازالة تحديث تطبيق الملفات وانحذفن
> الصور الذي في المجلد الآمن؟ … انحذف كل شيء منه من يتحمل مسؤولية هذا الأخطاء»
> — *Files by Google, 2025-10-21, 1★, +191 votes*
> "A while ago I kept very important photos in the Secure Folder and I removed an update of the
> Files app, and the photos in the Secure Folder were deleted … everything was deleted from it.
> Who is responsible for this bug?"

> «نسيت رمز التعريف الشخصي للدخول الى المجلد الأمن . اريد استعادة الرمز لاتمكن من الدخول . ولدي
> بيانات خاصة داخل المجلد الامن مهمة لي.»
> — *Files by Google, 2024-07-18, 2★, +53 votes*
> "I forgot the PIN for the Secure Folder. I want to restore the code so I can get in. I have
> important private data inside it."

Links:
[+1,254](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=4624d485-48b8-4aae-9e41-de8be194180b) ·
[+429](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=2554a106-453c-45c0-951b-5e9e01df2805) ·
[+191](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=e306745b-a82e-492b-bd85-86213ec0099b) ·
[+53](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=478b2861-2a96-4b00-910d-d30f553b3e82) ·
[+436 (files vanished)](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=02ddc3af-15e5-4c15-8ea9-787be2c532d8)

**Does NFile answer it? Partly, and for a different complaint.** NFile has an encrypted vault
(`lib/services/vault_service.dart`, `lib/core/vault/vault_password.dart`) whose password verifier
is Argon2id over a random salt, and it is a separate storage area rather than a folder inside the
managed tree — so an app update that rewrites the user's files does not wipe it. The complaint NFile
does *not* answer is the "reset the secure folder and lose everything" and "forgot my PIN" pair:
NFile has no recovery path and no password reset that silently destroys the contents. Note the
shape of the Arabic demand is not "give me a hidden folder" but "give me a hidden folder that
cannot be wiped without my password and cannot lose my data".

### Cluster 6 — The app is not in Arabic, or Arabic was removed

**The pain.** The app's interface is English, or used to be Arabic and stopped being Arabic.

**How often.** 12 Arabic reviews: Solid Explorer (11 of its 186 Arabic reviews, 5.9%),
Total Commander (1). Every one of the Solid Explorer reviews is the same sentence. The
most-upvoted carries +42 votes.

**Apps heard on.** Solid Explorer, Total Commander.

**The text.**

> «كان التطبيق يدعم اللغة العربية ، فلماذا لا يدعم اللغة العربية.»
> — *Solid Explorer, 2024-05-27, 4★, +8 votes*
> "The app used to support Arabic — why doesn't it support Arabic?"

> «تطبيق تافه جدا، سابقا كان يحتوي على اللغة العربية لكن تم حذفها لاسباب مجهولة، الأفضل استخدام
> MiXplorer او ES Explorer او ESuper.»
> — *Solid Explorer, 2024-03-28, 1★, +42 votes*
> "A very poor app; it used to contain the Arabic language but it was removed for unknown reasons.
> Better to use MiXplorer or ES Explorer or ESuper."

> «تطبيق ممتاز لكن لماذا تم حذف اللغة العربية ، لو ترجع اللغة العربية لكان من أحسن التطبيقات»
> — *Solid Explorer, 2026-01-12, 2★, +1 vote*
> "An excellent app, but why was the Arabic language removed? If the Arabic language came back it
> would be one of the best apps."

> «الرجاء إضافة اللغة العربية أنا قمت بتعريب هذا التطبيق الكثير من المرات ولكن لا يوجد اي نفع .. لماذا»
> — *Total Commander, 2015-12-11, 5★, +5 votes*
> "Please add the Arabic language. I have translated this app many times but to no effect … why?"

Links:
[Solid Explorer +42](https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=d09c84c1-3099-47eb-a605-271ac9e58c70) ·
[Solid Explorer +8](https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=a13eec13-2129-4aa5-b977-46b91f202e6c) ·
[Solid Explorer "أين اللغة العربية"](https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=025acd13-a655-46f6-b08f-a0e7ebca6990) ·
[Total Commander](https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=45a91eec-87b5-4ed2-a7b9-a15ba0a30565)

**Does NFile answer it? Yes for the app; not for the store page.** The in-app Arabic is complete:
`lib/l10n/app_ar.arb` and `lib/l10n/app_en.arb` both carry **1,130 keys**, with **zero** English
keys missing from the Arabic file — this is not a partially translated UI. But the **store
listing** has only one locale: `fastlane/metadata/android/` contains `en-US` and nothing else.
There is no `ar` listing. Since the store page is where an Arabic-speaking user meets the app
first, and since this cluster shows how strongly Arabic speakers react to an English UI, the
missing Arabic listing is a live version of the complaint NFile otherwise answers.

### Cluster 7 — Ads and donation walls

**The pain.** Ads that fill the screen and are hard to dismiss, and features unlocked by
donating (X-plore's "pay for a beer" gate).

**How often.** 28 Arabic reviews: Files by Google (13), X-plore (7), ZArchiver (6), Solid Explorer
(2). X-plore's reviews attack the donation gate specifically.

**Apps heard on.** Files by Google, X-plore, ZArchiver, Solid Explorer.

**The text.**

> «اعلانات مزعجه كده و صعب الخروج منها و تملئ الشاشه كلها»
> — *X-plore, 2025-08-22, 1★, +10 votes*
> "Annoying ads, hard to get out of, and they fill the whole screen."

> «عند تفعيل الواي فاي بيقولك اتبرع بمشروب يعني ميزة غير مجانية .... لا انصح بالتحميل»
> — *X-plore, 2021-01-23, 1★, +5 votes*
> "When you enable Wi-Fi it tells you to donate a beer — i.e. a feature that isn't free … I do not
> recommend downloading it."

> «بس عيبه انه لازم تتبرع لفتح باقى الميزات والمصيبه التبرع يكون بالبيره»
> — *X-plore, 2016-12-16, 3★, +5 votes*
> "Its flaw is that you must donate to open the rest of the features, and the donation is a beer."

> «عدم اخفاء علامة التبرع للموسيقى»
> — *X-plore, 2019-11-15, 1★, +4 votes*
> "It doesn't hide the donation tag for music."

> «اعلانات كثيرة»
> — *Solid Explorer, 2022-03-09, 1★*
> "A lot of ads."

Links:
[X-plore +10](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=31976cac-6519-4e97-a06b-011d1a2a63fd) ·
[X-plore +5 (beer)](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=6814dbae-2460-4524-9d47-283c170f2530) ·
[X-plore +4](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=3be961de-b138-4b13-a95c-774e3a85fef6) ·
[Solid Explorer](https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=c2dd6322-261d-41f9-83a3-94f81437e8da) ·
[Files by Google](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=4c705f86-73a5-432a-bf5d-43f05ef851df)

**Does NFile answer it? Yes.** There is no advertising or analytics dependency in `pubspec.yaml`
(no ad SDK, no analytics, no attribution SDK), so the screen-filling ad and the donation gate have
nowhere to live.

### Cluster 8 — Trial expiry / licence nagging / paid

**The pain.** The app works, then the trial ends, or it keeps asking to buy a licence the user
already bought.

**How often.** 5 Arabic reviews: Solid Explorer (4), MiXplorer Silver (1).

**Apps heard on.** Solid Explorer, MiXplorer Silver.

**The text.**

> «من ٱفضل مدير ملفات و يتمتع بعدة ميزات ممتازة في الشكل و الٱسلوب ، لكن التطبيق محدود الصلاحية و
> يصبح مدفوع بعد التجربة ، لو أمكن أن يكون متاح مجاناً .»
> — *Solid Explorer, 2020-10-11, 1★, +25 votes*
> "One of the best file managers, with excellent features in look and style, but the app is
> limited and becomes paid after the trial — if possible, make it available free."

> «مع كامل احترامي التطبيق مل فيه اي حاجه تفيد جاري الحذف انا مشتري لا تجددون اشتراكي حتى الالغاء
> ما يوجد مدري كيف»
> — *Solid Explorer, 2019-05-29, 1★*
> "With all due respect the app has nothing useful in it, I'm deleting it. I am a buyer — don't
> renew my subscription; there's even no cancel. How?"

Links:
[Solid Explorer +25](https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=9eacbb77-e9b5-4cf1-914b-1fcf4254d222) ·
[Solid Explorer licence](https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=b9383c80-249f-47f4-b9e6-80eb5ef2bea1) ·
[MiXplorer Silver](https://play.google.com/store/apps/details?id=com.mixplorer.silver&reviewId=38e90e09-be4d-4f89-9fd4-5668fe8a8bc4)

**Does NFile answer it? Yes, on the evidence available.** NFile ships as a single free app with no
licence check in the codebase and no in-app purchase wiring. (Note the practical caveat: an
Arabic-speaking user arriving at the store still meets an `en-US`-only listing — see cluster 6.)

### Cluster 9 — No copy/paste, no multi-file move

**The pain.** Files move one at a time, or the app has no clipboard at all.

**How often.** One explicit multi-file request (ZArchiver, +152 votes — among the highest-voted
*requests* in the corpus), plus three adjacent complaints: X-plore (2) and Files by Google (1).
Four Arabic reviews in all.

**Apps heard on.** ZArchiver, X-plore, Total Commander, Files by Google.

**The text.**

> «لماذا لا يمكن نقل أو نسخ عدة ملفات مع بعض إلى مكان مغاير ، يوجد نقل ملف واحد لا أكثر و هذا يجعل
> النقل بطيء و مشتت و غير عملي ، نطالبكم بإدراج النقل المتعدد لعدة ملفات في نفس الوقت في التحديث
> القادم ، و شكراً.»
> — *ZArchiver, 2024-09-30, 3★, +152 votes*
> "Why can't I move or copy several files together to another place? There is moving one file and
> no more, and that makes moving slow, confusing and impractical. We ask you to add multi-file
> moving for several files at once in the next update. Thank you."

> «لا استطيع. ان ارسل. بيه الى مسنجر اتمنى تحسينه»
> — *X-plore, 2022-05-14, 1★, +11 votes*
> "I can't send with it to Messenger — I wish it would be improved."

> «لا ينسخ ولا ينقل من ملفات الهارد الخارجي :( فقط قراءة ملفات»
> — *Total Commander, 2022-03-12, 2★, +13 votes*
> "It doesn't copy or move from external drive files — read only."

Links:
[ZArchiver +152](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=b61a3ab5-1aeb-48ef-a845-767e901da704) ·
[X-plore +11](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=92e1d2c9-b2ee-4d6c-b514-9ab80f0ea807) ·
[Total Commander +13](https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=a0cacef8-2542-4a5a-9022-6aeece869e9b) ·
[Files by Google "no paste"](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=a145c4b4-e17f-4975-98fb-bbeadd1b1b18)

**Does NFile answer it? Yes.** NFile's listing is a selection model with a selection action bar
(`lib/ui/widgets/selection_action_bar.dart`, `lib/ui/widgets/selection_context_bottom_sheet.dart`)
and copy / move / rename / delete over the whole selection, plus drag and drop
(`lib/ui/widgets/drag_drop_handler.dart`).

### Cluster 10 — No in-app media playback, or playback that stops

**The pain.** The manager should play the audio and video it lists — and when it does, the music
stops when you leave the screen.

**How often.** 5 Arabic reviews, all on Files by Google; the most-upvoted is +531.

**Apps heard on.** Files by Google.

**The text.**

> «ممتاز جداً ، ونرجوا تصحيح المشكلات مثل مشكلة الفرز بجميع مراحله … وأيضاً السماح بتعديل
> الصور والفيديو وتشغيل الفيديو في الخلفية»
> — *Files by Google, 2024-11-19, 4★, +531 votes*
> "Excellent, and we ask you to fix problems like the sorting problem in all its stages … and also
> allow editing photos and video and playing video in the background."

> «لماذا يتم ايقاف الموسقاء فجئه بدون اي سبب يتوقف الموسيقاء … وتمناء ان اقدر تشغيل الفيديو في
> الخلفيه الخارجيه زي تطبيق مكس»
> — *Files by Google, 2024-07-08, 3★, +86 votes*
> "Why does the music stop suddenly for no reason … and I wish I could play video in the background
> outside, like the Mix app."

> «التطبيق ممتاز لكن ينقصه بعض الاضافات مثل : 1- تشغيل الفيديو في الخلفية . 2- إضافة مؤقت للنوم .
> 3- إمكانية تعديل الفيديو.»
> — *Files by Google, 2024-11-13, 3★, +29 votes*
> "The app is excellent but some additions are missing: 1- play video in the background. 2- add a
> sleep timer. 3- the ability to edit video."

Links:
[+531](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=1dd6a5b9-4938-48ea-89ce-42d24c073531) ·
[+86](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=1900e6f7-20b0-490e-a779-53443e9da74a) ·
[+29](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=315c1471-9488-42e8-8458-7fe8f1d6521d)

**Does NFile answer it? Yes for playback; no for the sleep timer or video editing.** NFile has a
native media index and built-in players with lyrics and a waveform
(`lib/ui/screens/audio_player/`, `lib/ui/screens/video_player/`,
`lib/services/audio_background_handler.dart` for background audio). There is **no** sleep timer and
**no** photo/video editor — those two sub-requests are not answered.

### Cluster 11 — Wants a storage analyzer, duplicate finder or app manager

**The pain.** "What is eating my storage?" — and most concretely, the duplicate-file finder.

**How often.** 17 Arabic reviews, all on Files by Google, and most of them are *praise* of the
feature Files by Google has, which is itself the signal: the request is "give me this". Two
reviews are explicit requests; the most-upvoted request carries +20 votes, while the
most-upvoted review that merely praises the feature carries +1,248.

**Apps heard on.** Files by Google.

**The text.**

> «سعيد به واغناني عن تطبيقات أخرى واتمنى والمطلوب اضافة أولا إيجاد الملفات المكررة لتسهيل مهام
> المستخدم وثانيا وزيادة سرعة التحميل لانه بطيئة جدا»
> — *Files by Google, 2023-11-11, 4★, +20 votes*
> "I'm happy with it and it made me forget other apps; what I want and what is required: first,
> finding duplicate files to make the user's tasks easier; second, increasing the loading speed
> because it is very slow."

> «التطبيق لا يحذف الملفات المكررة ولا تستطيع عمل زووم إن في ملفات الفيديو .. التطبيق فاشل»
> — *Files by Google, 2026-08-23, 1★, +11 votes*
> "The app doesn't delete duplicate files and you can't zoom in on video files … the app is
> rubbish."

> «ممتاز جدا وخصوصا خاصية متابعة مساحة التخزين والتنبيه على الأشياء التي تأخذ مساحة ولا فائدة منها
> مثل الملفات المكررة والتطبيقات الخاملة»
> — *Files by Google, 2022-07-28, 5★, +15 votes*
> "Excellent, especially the storage-tracking feature and the warning about things that take up
> space and are useless, like duplicate files and idle apps."

Links:
[+20 request](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=82dac3eb-87dd-4ab5-9d8e-c05058715197) ·
[+11](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=64bd18e8-beeb-496a-8f97-c43edd7c5af4) ·
[+15](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=d7ace482-8a9a-417c-a18f-eff8bd918c64)

**Does NFile answer it? Mostly, but not the duplicate finder.** NFile has a storage analyzer
(`lib/ui/screens/storage_analyzer/storage_analyzer_screen.dart`), an app manager with app backup
and batch actions (`lib/ui/screens/storage_analyzer/app_manager_screen.dart`,
`app_batch_action_bar.dart`), and per-extension open-with defaults. What NFile does **not** have
is a **duplicate-file finder** — grepping the whole `lib/` tree for duplicate detection returns
only "duplicate tab" (duplicating a browser tab). The one concrete request in this cluster is
therefore not answered.

### Cluster 12 — Search and filtering too weak

**The pain.** Search that doesn't reach inside files, and results you can't act on.

**How often.** 5 Arabic reviews: Files by Google (2), X-plore (1), Solid Explorer (1), ZArchiver
(1). The most-upvoted is +32 and it is a request, not a complaint.

**Apps heard on.** Files by Google, X-plore, Solid Explorer, ZArchiver.

**The text.**

> «هذا الإصدار معيووووووب لايسمح بمشاركة ملفاتapk عبر البلوتوث. ايضا عندما نقوم بالبحث عن ملف يعرض
> النتائج ولكن لايسمح بنسخ الملف الذي نقوم بتحديده وهذا عيب كبير ايضاً. كذلك لايتوفر في التطبيق خيار
> البحث داخل الملفات أتمنى تلافي هذه العيوب في التحديث القادم.»
> — *Files by Google, 2026-07-20, 1★, +32 votes*
> "This version is broken: it doesn't allow sharing APK files over Bluetooth. Also, when we search
> for a file it shows results but doesn't allow copying the file we select, which is a big flaw.
> Also there is no option to search *inside* files. I hope these flaws are avoided in the next
> update."

> «أرجو اضافة مكتشف الملفات المتكررة»
> — *Files by Google, 2019-02-02, 3★, +5 votes*
> "Please add a duplicate-file finder."

Links:
[+32](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=75b18303-fc82-45f1-b553-c1ae041dea58) ·
[+5](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=241277dc-8902-4765-a2d9-a40338cc74d8) ·
[X-plore search inside text files](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=f6091872-e9f5-4aa9-8e2f-499977b08291)

**Does NFile answer it? Mostly.** NFile has per-tab and global search, filters and derived
listings (`lib/core/listing/`, `lib/ui/screens/global_search_screen.dart`,
`lib/ui/widgets/file_filter_bottom_sheet.dart`). Two things are not answered: **search inside file
contents** (X-plore and Solid Explorer reviewers both praise their apps for it) and **search inside
archives**.

### Cluster 13 — Cannot send or share a file out of the app

**The pain.** No way to send a file to Messenger, WhatsApp, or anywhere else.

**How often.** 2 explicit Arabic reviews (ZArchiver +17, X-plore). Both are requests, and the
Files by Google corpus adds a third, larger one ("no paste / can't copy to flash drive").

**Apps heard on.** ZArchiver, X-plore.

**The text.**

> «تطبيق جميل يجمع الملفات معا في مجلد واحد بس في مشكله اني بقدرش اشارك الملف طب اذا بشاركوش شو
> بدي فيه بتمنى اضيفوا خاصية مشاركه الملف»
> — *ZArchiver, 2020-05-08, 3★, +17 votes*
> "A nice app that collects the files in one folder, but there's a problem: I can't share the file,
> so if I share it, what do I put in it? I wish you would add a file-sharing feature."

> «كيف ارسل ملف pdf من هذا البرنامج»
> — *X-plore, 2018-11-14, 2★*
> "How do I send a PDF file from this program?"

Links:
[ZArchiver +17](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=d747b05f-d468-4a4e-a925-eb316c4d685d) ·
[X-plore](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=fcdda705-6a0f-4810-ab4a-f718c7328e36)

**Does NFile answer it? Yes.** NFile handles share intents (`lib/services/intent_handler_service.dart`),
registers a documents provider (`.NFileDocumentsProvider`, `com.rubex.nfile.documents`), and ships a
share target. One caveat: NFile's per-extension open-with defaults are about *opening* files, so
the "share out" path depends on the share intent being wired for the whole selection.

### Cluster 14 — Cannot write to the SD card / USB drive

**The pain.** The external drive shows up but is read-only, or won't open.

**How often.** 1 explicit Arabic review on X-plore (the USB one) plus the Total Commander external
drive review quoted in cluster 1 (write to an external OTG drive, +73 votes). Thin, but the Total
Commander instance is one of that app's most-upvoted Arabic reviews ever.

**Apps heard on.** X-plore, Total Commander.

**The text.**

> «للأسف لا يقرأ ذاكرة USB عندما يتم توصيلة بالجهاز.يظهر اشارة وجود الفلاشة لكن لايستطيع الفتح..»
> — *X-plore, 2016-12-04, 1★, +2 votes*
> "Unfortunately it doesn't read USB memory when connected to the device. It shows the flash drive's
> presence but can't open it."

> «لا يمكن تعديل ملاحظات تكست على بطاقة الذاكرة. ولا يمكن الكتابة على هارد خارجي من OTG»
> — *Total Commander, 2019-08-16, 3★, +73 votes*
> "Cannot edit text notes on the memory card. And cannot write to an external OTG drive."

Links:
[X-plore](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=12f951bf-2062-41ac-b44e-122ec394ac04) ·
[Total Commander +73](https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=a142b9ac-7fb5-4813-aea0-128a642f2e58)

**Does NFile answer it? Partly.** NFile surfaces SD and USB volumes (`sdCardOrUsb`,
`sdCardWithUsb` in the Arabic strings) and its remote layer has an SAF client. But writing to an
external volume still depends on the OS's SAF grant, and — as cluster 1 shows — the same grant
that lets you *see* `Android/data` is what lets you *write* there.

### Cluster 15 — Too complex, or Arabic printed over an English UI

**The pain.** The app is hard to learn — and the RTL layout is broken, with menus landing on the
wrong side.

**How often.** 26 Arabic reviews: ZArchiver (12), X-plore (8), Files by Google (5), Total Commander
(1). This is a recurring shape across the whole corpus, not one app.

**Apps heard on.** X-plore, ZArchiver, Files by Google, Total Commander.

**The text.**

> «جميل جداً كفكرة لكن معقد في انشائه مش سهل تفهمه محتاج ترتيب اكتر لانك بندخل حاجة نخرج من حاجة
> تانية برغم انه عاجبني لكن احتمال احذفه تنا عاوزة حاجة سهلة مش حاجة تضيع وقتي»
> — *X-plore, 2018-04-19, 3★, +2 votes*
> "Very nice as an idea but it's complicated, it's not easy to understand; it needs more structure,
> because you go into one thing and come out of another. Even though I like it, I might delete it —
> I want something easy, not something that wastes my time."

> «التطبيق فيه مشكله على الجهة اليمين انتو خربتو البرنامج ما بيظهر اشكال الاقراص على اليمين وحصلت
> معاي بعدة انواع تلفونات»
> — *X-plore, 2024-09-24, 1★, +2 votes*
> "The app has a problem on the right side — you broke it, the disc icons don't show on the right,
  and it happened to me on several kinds of phone."

> «البرنامج اصبح مقرف ومن اسوء البرامج بعد ان اصبح لا يقرأ اي ملف من اندرويد 11فما فوق»
> — *ZArchiver, 2022-11-12, 1★, +15 votes*
> "The app became disgusting, one of the worst apps, after it stopped reading any file from
> Android 11 and above."

> «صحيح انه ينسخ ويلصق لكن فيه عيب انه يلصق مع كتابة وقت العملية ! عدا عن ان الايقونات ليس عليها
> شرح بل عليك ان تجربها لتعرف ما هي . اتمنى انطوروه»
> — *Total Commander, 2026-06-26, 3★*
> "True, it copies and pastes, but it has a flaw: it pastes while writing the operation time! And
> besides, the icons have no explanation — you have to try them to know what they are. I hope they
> develop it."

> «سيء و معقد انا محمل ماين كرافت مجانا ولما آجي احط مودات في ملفات تظهر و ملفات ما تظهر اتمنى
> إصلاح هذه المشكلة في أقرب وقت ممكن»
> — *ZArchiver, 2024-03-04, 1★, +228 votes*
> "Bad and complicated. I downloaded Minecraft for free, and when I come to put mods in, some files
> show up and other files don't. I hope you fix this as soon as possible."

Links:
[X-plore complex](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=cf15d443-dda9-4c78-bb3b-334291cfb736) ·
[X-plore RTL](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=d03227eb-1b8d-481d-a4fe-d349751c715f) ·
[ZArchiver +228](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=bb82459a-175c-4884-913b-7cc5c49d4071) ·
[ZArchiver Android 11](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=ed446345-3e9a-4fcd-b5e7-bed2563a09c8) ·
[Total Commander](https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=10fbd0c2-88d1-43e1-94f6-06c845ebbb74)

**Does NFile answer it? Mostly.** NFile is a Flutter app with a full Arabic RTL UI, an
address-bar model (`lib/ui/widgets/nfile_address_bar.dart`) and a tabs model
(`lib/ui/widgets/directory_tab_bar.dart`) rather than a nested "go in, come out" tree. The
specific "the icons have no explanation" complaint is a design note rather than a missing feature.
Note also that one ZArchiver reviewer writes in a way that shows Arabic users reading a *right to
left* UI fluently ("لا يظهر على اليمين" = "doesn't show on the right") — the RTL expectation is
simply that the interface is mirrored, which NFile does.

### Cluster 16 — Slow, hangs, or wedges

**The pain.** The app takes forever to open, to load a folder, or to move a large file; sometimes
it freezes on a copy.

**How often.** 13 Arabic reviews: Files by Google (8), ZArchiver (3), X-plore (1), Solid Explorer
(1).

**Apps heard on.** Files by Google, ZArchiver, X-plore, Solid Explorer.

**The text.**

> «تطبيق (جوجل فايلز Google Files) صار سيء للغاية‼️ بطيء جدا في التحميل‼️ لا يفتح إلا بعد وقت‼️»
> — *Files by Google, 2024-11-07, 1★, +119 votes*
> "The Google Files app has become very bad, extremely slow to load, it doesn't open until later."

> «برنامج غبي و ينرفز يعلق على جاري النسخ ومو قاعد ينسخ معلق عليها ندور برنامج ثاني»
> — *X-plore, 2022-11-20, 1★, +2 votes*
> "A stupid app that gets annoyed and hangs during the copy and doesn't stay copying — I'll look
> for another app."

> «بطيء جدا في فك الضغط عن الملفات و بطيئ ايضا في نقل الملفات»
> — *Solid Explorer, 2020-06-30, 2★, +6 votes*
> "Very slow at extracting files, and also slow at moving files."

Links:
[Files by Google +119](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=13a98ed8-33ec-40da-bff3-272590c4e441) ·
[X-plore hangs](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=70324b72-6e7a-45f7-ac7f-151fc5f7d89d) ·
[Solid Explorer slow](https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=966a43f7-9dae-4a12-a558-f0b05d45899e)

**Does NFile answer it?** Partly, and I cannot claim a performance verdict from this research.
NFile has a native media index, background operation progress dialogs and a background archive
service (`lib/services/background_archive_service.dart`,
`lib/ui/widgets/background_operation_progress_dialog.dart`). Whether it is fast is a measurement
question that this corpus does not answer — the Arabic complaints are all aimed at the two apps
with the largest installed base, which is a base effect.

### Cluster 17 — Does not work on tablets

**The pain.** It runs on my phone but not on my tablet.

**How often.** 1 Arabic review (ZArchiver). Thin.

**Apps heard on.** ZArchiver.

**The text.**

> «تطبيق جيد ولكن لا يعمل على طبلات يعمل على هوتف فقط أرجو تصحيح خطأ.»
> — *ZArchiver, 2020-05-06, 3★, +28 votes*
> "A good app, but it doesn't work on tablets, it works on phones only. Please fix the bug."

Link: [ZArchiver +28](https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=628a246d-fb9d-46d2-8483-e2bbcdfccd70)

**Does NFile answer it? Unverified.** NFile is a Flutter app, so it runs on tablets, but I found
no tablet-specific layout, no multi-column adaptation and no large-screen handling in
`lib/ui/`. There is also no Arabic review that says the opposite (that a tablet file manager works
well), so this cluster is one review deep and should be treated as a question, not a finding.

### Cluster 18 — Transfer over Wi-Fi / an FTP server

**The pain.** Getting files on and off the phone from a computer without a cable.

**How often.** 2 Arabic reviews, both on X-plore, and both are *praise* of the feature rather than a
request. The Arabic demand here is thin.

**Apps heard on.** X-plore.

**The text.**

> «استخدمته عشان ادخل على سيرفر ftp وماشاءالله ممتاز. وفيه مشغل فيديوهات جيد لكن يحتاج ميزات
> اكثر.»
> — *X-plore, 2022-06-20, 5★, +34 votes*
> "I used it to connect to an FTP server, and it's excellent. And it has a good video player, but it
> needs more features."

Links: [X-plore FTP +34](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=4ac566bd-fa34-4296-98df-ae874954d8fb)

**Does NFile answer it? Yes.** NFile ships an FTP server (`lib/services/ftp_server_service.dart`,
`lib/ui/screens/ftp_server_screen.dart`) and a web sharing server with an SSH tunnel and a QR code
(`lib/services/web_sharing_service.dart`, `lib/ui/screens/web_sharing_screen.dart`), plus FTP,
SFTP, WebDAV and SAF remote *clients*. The one thing to flag: the **LAN/SMB client is a mock**
(`lib/services/remote/lan_client.dart` contains a mock write path), so NFile's SMB story is not
real yet — but SMB and NAS were never asked for in Arabic either (see the no-evidence table in
§4).

### Cluster 19 — Cloud drives (Drive, Dropbox, OneDrive, iCloud)

**The pain.** The manager should reach into Google Drive / Dropbox / OneDrive as if they were
folders.

**How often.** 1 Arabic review, and it is praise for a competitor's Drive integration rather than a
request. This is the thinnest cluster in the set.

**Apps heard on.** Files by Google.

**The text.**

> «ممتاز، عملي، سريع، انيق و مريح للاستخدام! استخدام هذا التطبيق بدلا من مدير الملفات الخاص بشاومي
> و ريدمي هو افضل خيار. كما انه يتوفر على مزايا كثيرة و يمكنه الوصول الى google drive بسرعة»
> — *Files by Google, 2024-07-30, 5★, +961 votes*
> "Excellent, practical, fast, elegant and comfortable to use! Using this app instead of Xiaomi's
> and Redmi's own file manager is the best option. It also has many features and can reach Google
> Drive quickly."

Link: [Files by Google +961](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=8346a4ce-9556-4a03-8530-919c89bb0e99)

**Does NFile answer it? No.** NFile's remote layer is FTP, SFTP, WebDAV and SAF — there is no
Google Drive, Dropbox, OneDrive or iCloud provider anywhere in `lib/`. This is a genuine gap, but
the *evidence* for it in Arabic is one review, so it is a candidate rather than a proven demand.

### Cluster 20 — Open or edit PDFs, documents and books in the app

**The pain.** The manager should be able to open and edit the documents it lists, and the reading
experience should work (zoom, page turning, landscape).

**How often.** 14 Arabic reviews: Files by Google (7), X-plore (5), ZArchiver (2). The
most-upvoted complaint carries +530 votes, and the longest review in the cluster (+899) lists PDF
reading among several other asks.

**Apps heard on.** Files by Google, X-plore, ZArchiver.

**The text.**

> «يحتاج الى الكثير من الميزات 1.فتح ملفات pdfوexeوword 2.المسح الضوئي لايعمل عندي 3.حذف الملفات
> بشكل اسهل واسرع 4.تحتاج الملفات الى ترتيب بشكل افضل»
> — *Files by Google, 2024-10-31, 3★, +53 votes*
> "It needs a lot of features: 1. open pdf, exe and word files; 2. the scanner doesn't work for
> me; 3. deleting files easier and faster; 4. the files need better sorting."

> «كان قبل التحديث الأخير جيد يظهر الملفات من القائمة الرئسية والآن لم يعد يظهر الا القليل من ملفات pdf
> أرجوا معالجة هذه المشكلة.»
> — *Files by Google, 2023-05-07, 3★, +530 votes*
> "Before the last update it was good and showed the files from the main menu; now it only shows a
> few PDF files. Please fix this."

> «التطبيق سيئ في قراءة الكتب لا يتم تكبير الصفحة ولايتم التنقل بين صفحات الكتاب في وضع الهاتف
> الافقي…»
> — *X-plore, 2023-04-21, 1★, +3 votes*
> "The app is bad at reading books — you can't zoom the page and you can't turn pages in landscape."

> «يجب إضافة فى التطبيق مشغل مستندات txt , ويجب إضافة محرر نصوص أو نص»
> — *Files by Google, 2026-04-27, 5★, +4 votes*
> "A txt document viewer must be added to the app, and a text editor must be added."

Links:
[+899](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=4c705f86-73a5-432a-bf5d-43f05ef851df) ·
[+530](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=350846bf-94bd-4257-b2d0-dab75e14eb43) ·
[+53](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=61fef1c5-dc84-4845-9880-29a9fd10e9f1) ·
[X-plore books](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=3fe7a0e3-e072-4891-99b1-cff3f037f6b7) ·
[Files by Google text editor](https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=9bda0b1a-79aa-431b-8541-20002b957e63)

**Does NFile answer it? Yes for documents; no for books/scanning.** NFile has a text editor, a
document viewer that renders PDFs (`lib/ui/screens/document_viewer_screen.dart`, built on
`syncfusion_flutter_pdfviewer`), a Markdown viewer, an HTML viewer and a database reader
(`lib/ui/screens/text_editor_screen.dart`, `markdown_viewer_screen.dart`,
`html_viewer_screen.dart`, `database_reader_screen.dart`). There is **no** document scanner (the
"المسح الضوئي" request) and no dedicated book/EPUB reader with page turning.

### Cluster 21 — Install an APK from the manager

**The pain.** Install an APK straight from the folder you are browsing.

**How often.** 2 Arabic reviews: X-plore (1), Total Commander (1).

**Apps heard on.** X-plore, Total Commander.

**The text.**

> «بعد آخر تحديث لا يقوم البرنامج بتثبيت ملفات خارجيه (APK) بسبب سياسة جوجل»
> — *Total Commander, 2022-10-27, 2★, +1 vote*
> "After the last update the program no longer installs external files (APK) because of Google's
> policy."

> «أرجو حل هذه المشكلة : عند نسخ تطبيق من التطبيقات المثبتة او عند إرساله يظهر بصيغة ملف مضغوط zip
> وليس بصيغة تطبيق apk»
> — *X-plore, 2020-10-15, 5★, +14 votes*
> "Please solve this problem: when copying an app from the installed apps or when sending it, it
> appears as a compressed zip file and not as an apk."

Links:
[Total Commander](https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=66923ebf-dbd3-4943-b5c0-7c3aecf67131) ·
[X-plore +14](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=3ad8c96a-23c5-463f-a02a-9e57831f8550)

**Does NFile answer it? Partly.** NFile has an APK installer service
(`lib/services/apk_installer_service.dart`). Note that the Total Commander complaint is about
Google's install policy blocking it, not about the feature being absent — the same policy applies
to any app.

---

## 4. Clusters with no evidence

A cluster with no evidence is not a cluster. These are the ones I looked for and did not find in
4,104 Arabic reviews:

| Candidate cluster | Result |
|---|---|
| **Two panes / split view** | **0 reviews.** I searched for "شاشتين", "نافذتين", "مقسم", "ثنائي", "بجنب بعض", "two panes", "split view", "dual pane". No Arabic reviewer of any of the seven apps asked for a dual-pane or split-screen layout. Note that NFile *has* split screen and tabs anyway — the demand simply is not Arabic, or is not expressed in Arabic. |
| **Arabic filename rendering (bidi / reversed text)** | **0 reviews.** No Arabic complaint about Arabic file names appearing reversed or mangled. Worth noting because it is a classic Arabic-language expectation; its absence is a real finding, not an oversight. |
| **File permissions / owner / chmod** | **0 reviews.** Nobody asked for chmod-style permission bits. |
| **SFTP / WebDAV / NAS / SMB** | **0 reviews.** No Arabic reviewer asked for NAS or SMB. The one Arabic "remote" complaint (cluster 18) is about FTP, and it is praise. |
| **Resumable / background transfers** | **0 reviews.** |
| **Bookmarks / pinned paths** | **0 genuine reviews.** The two hits for "المفضلة" are about a favourite *company*, not favourite folders. |

---

## 5. What this means for NFile, in one page

Answered today, with the reason it matters:

| Pain | NFile |
|---|---|
| Android/data + Android/obb unreachable (116 reviews) | Partly — root + Shizuku modes and a restricted-folder banner exist; the unrooted SAF route that actually works does not |
| "Completed with errors" while failing (71) | **Unproven** — no evidence in the code that partial failures are reported as failures |
| Rename broken in data/obb (5) | Partly — rename exists; no restricted-tree special case |
| No recycle bin (9) | Yes, but internal storage only — SD deletes are still permanent |
| Secure folder loses / locks files (36) | Partly — Argon2id vault answers "hide my files"; "forgot my PIN" and "reset wiped it" are unanswered |
| Not in Arabic (12) | Yes in-app (1,130/1,130 keys) — but the **store listing has no Arabic locale** |
| Ads / donation walls (28) | Yes — no ad or analytics SDK |
| Trial / licence nagging (5) | Yes — no licence check, no in-app purchase |
| No copy-paste / multi-file move (4) | Yes — selection model + drag and drop |
| No media playback (5) | Yes for playback and background audio; no sleep timer, no video editor |
| Storage analyzer / duplicates / app manager (17) | Analyzer and app manager yes; **no duplicate-file finder** |
| Weak search (5) | Yes for file search and filters; **not** for searching inside file contents or archives |
| Cannot share a file out (2) | Yes — share intent + documents provider |
| Cannot write to SD/USB (1) | Partly — volumes surfaced, but writes depend on the SAF grant |
| Complex / broken RTL (26) | Mostly — full Arabic RTL UI, tabs and address bar |
| Slow / hangs (13) | Partly — needs measurement, this research cannot settle it |
| Tablets (1) | Unverified — no large-screen layout found |
| FTP / Wi-Fi transfer (2) | Yes — FTP server, web sharing server with SSH tunnel and QR |
| Cloud drives (1) | **No** — no Drive/Dropbox/OneDrive/iCloud provider |
| PDFs / documents / books (14) | Yes for documents; no scanner, no book reader |
| Install an APK (2) | Partly — installer exists, but Google's policy constrains it |

Three gaps stand out, in the order the Arabic evidence supports them: **the honest-failure
reporting of file operations** (71 reviews, the most-upvoted complaint in the corpus), the
**duplicate-file finder** (the one explicit request in the storage-tools cluster), and the
**missing Arabic store listing** for an app whose entire interface is Arabic.

---

## Appendix A — How the corpus was collected

1. Headless Chrome (`--headless=new`) driven over the DevTools Protocol from Python
   (`websockets.sync.client` for CDP, `requests` for the debugging endpoint).
2. For each app: open `https://play.google.com/store/apps/details?id=<appid>&hl=ar&gl=<gl>`,
   wait for load, click the **عرض جميع المراجعات** ("see all reviews") button to open the reviews
   dialog, then read the review RPC out of the page's own traffic.
3. The store's review RPC is `POST /_/PlayStoreUi/data/batchexecute?rpcids=oCPfdb` with
   `f.req=[[["oCPfdb","<args>",null,"generic"]]]`, where `<args>` is
   `[null,[2,<sort>,[20,null,<token>],null,[null,null,null,null,null,null,null,null,2]],["<appId>",7]]`.
   The response payload is JSON: `payload[0]` is the list of reviews and `payload[1][1]` is the next
   pagination token. Paging until the token is exhausted yields the full set.
4. Each review yields: id, author, star rating, body, epoch, thumbs-up count. The permalink used
   throughout is `https://play.google.com/store/apps/details?id=<appid>&reviewId=<reviewId>`.
5. A review is counted as "Arabic" if its body contains at least one character in
   U+0600–U+06FF. Counting is by distinct review id, so a review quoted twice counts once.

Cluster membership uses a fixed regular expression per cluster, applied to the review body, case
insensitively. The patterns are in `final.py` in the working directory of the research run; each
cluster's matching reviews, with dates, ratings, vote counts and permalinks, were dumped to
`final_evidence/<cluster>.txt`.

## Appendix B — Vendors' own documents read for corroboration

- Lonely Cat Games, "No access to Android/data on Android 11+" —
  <https://www.lonelycatgames.com/docs/xplore/known-problems/no-android-data>
- ZDevs, "Storage access permissions" — <https://zdevs.ru/en/za/sd_permissions.html>
- ZDevs, "ZArchiver — Description of errors" — <https://www.zdevs.ru/ru/za/errors_desc.html>
  ("Эта папка имеет ограничение доступа Android" — "This folder has an Android access restriction")
- ZDevs, "ZArchiver — User guide" — <https://zdevs.ru/en/za/user_guide.html>

## Appendix C — Arabic tech-site corroboration

- `superuser2.com`, "الحل النهائي لمشكلة عدم وصولك لملفات data على جميع هواتف الأندرويد
  12/13/14/15" (31 October 2025) — <https://www.superuser2.com/2025/10/data-12131415.html>.
  An Arabic technical article describing the same wall ("تم رفض الوصول", "محتويات هذا المجلد لا
  يمكن عرضها", "0 ملف") and the same workarounds (Shizuku, root, ADB). It is an article, not a
  user post, and is cited only as corroboration that the pain is one Arabic users write about
  outside the store as well.
