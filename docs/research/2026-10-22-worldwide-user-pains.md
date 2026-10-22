# What file-manager users ask for, everywhere

**Ticket:** #51 — "What file-manager users ask for, everywhere" (part of #43)
**Date:** 2026-10-22
**Read together with:** #46 — "What Arabic-speaking users ask for" (the Arabic strand)
**App:** NFile, an Android file manager (fork of Senzme/NFile)

The question this document answers: *what do the users of Android file managers ask for and
complain about — in every language the users write in, not only in Arabic?*

---

## 1. How this was read, and what could not be read

### 1.1 The Play Store: the pages are script-rendered, so the reviews were read from the store's own review call

Google Play's store pages do not carry review text in their HTML — the pages are rendered by
script and the review list arrives later, from the store's internal RPC endpoint. The reviews
were therefore read from that endpoint directly
(`https://play.google.com/_/PlayStoreUi/data/batchexecute`, review RPC id `UsvDTd`), with the
`hl` (language) and `gl` (country) parameters set per request, which is what makes Play return
the reviews **written in that language**. Every quote below is the reviewer's own text, and every
link points at the review itself on the store page (`…&reviewId=…`).

That is the honest reading path: not the rendered page, but the store's own review call. What
could not be read: the per-app aggregate "most relevant" ranking shown on the page, and the
review-count badge (the counts in this document are counts of reviews *read*, not of reviews
that exist).

### 1.2 The communities

| Community | How it was read | What could not be read |
|---|---|---|
| Reddit | The PullPush Reddit archive (`api.pullpush.io/reddit/search/comment`), because reddit.com and old.reddit.com both answer this network with "You've been blocked by network security" (HTTP 403), and `r.jina.ai` gets the same block | Threads themselves could not be fetched; the comments are the archive's copies, and the permalinks are reconstructed (`/r/<sub>/comments/<post>/_/<comment>/`) |
| Material Files issue tracker | The GitHub API — 1,543 issues, each one a user's own request, in English, Chinese, Spanish, Russian and others | Nothing; this tracker reads in full |
| Total Commander vendor forum (`ghisler.ch/board`) | Not readable: the board is behind an Anubis proof-of-work wall, which answers every crawler with "Making sure you're not a bot!". What was read instead: the vendor's own Android changelog (`totalcommander.ch/android/history2.txt`) and the search tool's reading of the board index | The Android suggestion threads themselves |
| XDA | Forum index readable; the search page needs a login | Thread-level search |
| 4pda, Baidu Tieba, Zhihu, Reddit's own front page | Cloudflare / bot walls | — |
| Yahoo!知恵袋 (Japanese Q&A), 5ch, Coolapk | Reachable, but the file-manager traffic in them is thin and the search endpoints ignore the query | Japanese Q&A search |

**What is therefore missing from this reading:** forum threads, app-developer support boards, and
the Japanese and Chinese Q&A sites. The store reviews and the Material Files issue tracker
carried the weight; the forums added corroboration, not new clusters.

### 1.3 The corpus

- **32,607 store reviews** — 7 benchmark apps (Material Files, X-plore, Files by Google,
  MiXplorer, Total Commander, Solid Explorer, ZArchiver) × 38 language/country locales
  (`en-US`, `en-GB`, `ru`, `es-ES`, `es-419`, `pt-BR`, `de`, `fr`, `id`, `tr`, `zh-CN`, `ja`, `ko`,
  `hi`, `vi`, `th`, `it`, `pl`, `nl`, `uk`, `ar-EG`, `ar-SA`, `fa`, `he`, `cs`, `ro`, `el`, `hu`,
  `sv`, `da`, `fi`, `nb`, `bg`, `sk`, `sr`, `ms`, `fil`, `sw`, `am`).
- **1,543 GitHub issues** on Material Files (zhanghai/MaterialFiles) — the app's own tracker, in
  the writers' own languages.
- **651 Reddit comments** that are actually about file managers, out of 1,667 that passed the
  length filter (out of ~1,900 fetched across 35 queries in 17 languages).

### 1.4 How the counts were made

Each cluster is a keyword pattern over the review text; a review counts once per cluster it
matches, and one review can land in several clusters. The counts are therefore **how often the
pain is heard**, not how many distinct users felt it, and they are a floor, not a ceiling: a
review that complains without using the keyword is not counted. Cluster membership was read by
hand afterwards, from the samples.

---

## 2. The clusters at a glance

| # | The pain | Heard on | Store reviews | Community items | NFile today |
|---|---|---|---|---|---|
| C1 | Ads and the paywall | X-plore, Solid Explorer, MiXplorer, ZArchiver, Material Files, Files by Google | 159 | 8 | **Answered** (no ads, no paywall) |
| C2 | Cloud accounts break or are missing | Solid Explorer, X-plore, MiXplorer, Total Commander, Material Files | 520 | 12 + 21 | **Not answered** |
| C3 | LAN / SMB to the PC or NAS is flaky or absent | Solid Explorer, X-plore, Total Commander, MiXplorer, Material Files | 799 | 62 | **Not answered** (the LAN/SMB client is a mock) |
| C4 | FTP / SFTP / WebDAV transfer fails, times out, is slow | Solid Explorer, X-plore, Total Commander, Material Files, MiXplorer | 689 | 143 | **Answered** (clients + FTP server) |
| C5 | Restricted folders: `Android/data`, `Android/obb`, scoped storage | all seven | 256 | 81 | **Partly** (root + Shizuku) |
| C6 | Archive formats: RAR, 7z, and extractions that fail | ZArchiver, X-plore, Solid Explorer, Total Commander, Material Files | 324 | 72 | **Partly** (zip/tar family, no RAR/7z) |
| C7 | Encrypted / password-protected archives | ZArchiver, Material Files, MiXplorer, Solid Explorer | 14 | 28 | **Partly** (password on zip, no AES-256 7z) |
| C8 | No trash, no undo — a delete is final | Solid Explorer, Material Files, X-plore, Total Commander | 57 | 11 | **Answered** (recycle bin) |
| C9 | Storage analysis, duplicate finder, junk cleanup | Files by Google, X-plore, Solid Explorer, Total Commander | 136 | 11 | **Partly** (analyser yes, duplicate finder no) |
| C10 | App manager, APK details, app lock | Total Commander, ZArchiver, X-plore, Files by Google, Solid Explorer | 611 | 18 | **Partly** (app manager yes, app lock no) |
| C11 | Bulk rename, multi-select gestures | Total Commander, ZArchiver, MiXplorer, Solid Explorer | 29 | 18 | **Answered** |
| C12 | Properties: checksum, permissions, owner, hex view | Total Commander, Material Files, X-plore, MiXplorer | 18 | 78 | **Partly** (no checksum, no chmod, no hex) |
| C13 | Media playback: cast, subtitles, album art, player controls | X-plore, Total Commander, Solid Explorer, MiXplorer | 137 | 35 | **Partly** |
| C14 | Office and PDF documents inside the file manager | X-plore, Files by Google, Solid Explorer, MiXplorer | 191 | 60 | **Answered** |
| C15 | A real text editor | Total Commander, Solid Explorer, X-plore, ZArchiver | 57 | 25 | **Answered** |
| C16 | Look and feel: theme, dark mode, layout, tablet and TV | X-plore, Solid Explorer, Total Commander, MiXplorer, Material Files | 164 | 90 | **Partly** |
| C17 | Language: the app's own language, and right-to-left | Solid Explorer, X-plore | 9 | 16 | **Partly** (English + Arabic, device language) |
| C18 | Moving files between the phone and the PC | Total Commander, MiXplorer, X-plore, Material Files | 32 | 14 | **Not answered** (no MTP/USB) |
| C19 | Speed: slow operations, slow transfers, high CPU | Solid Explorer, Files by Google, X-plore, Material Files | 86 | 136 | **Partly** |
| C20 | Files that do not appear after a move or an extraction | Solid Explorer, Files by Google, MiXplorer | 8 | 7 | **Partly** |
| C21 | Opening a terminal in the current folder | Material Files, MiXplorer, Total Commander | 25 | 23 | **Not answered** |
| C22 | Home-screen shortcut, widget, recent files | Material Files, MiXplorer, Solid Explorer, Files by Google | 32 | 36 | **Partly** (recent files yes, widget no) |
| C23 | An HTTP server on the phone | MiXplorer, X-plore | 15 | 6 | **Answered** (web sharing server) |
| C24 | Open-with defaults and the share sheet | Material Files, Total Commander, X-plore, Files by Google | 29 | 49 | **Answered** |
| C25 | Crashes, broken functions, regressions after an update | all seven | 344 | 136 | **Partly** (open) |

**25 clusters carry evidence. 10 of them also carry Arabic-language evidence** in the same corpus
(C2, C4, C5, C6, C8, C10, C14, C17, C19, C25) — see §5.

---

## 3. The clusters

Each cluster: the pain in one line, how often it repeats, which app it was heard on, the text it
came from (quoted, and translated where it is not in English), and whether NFile answers it.

### C1 — The advertising and the paywall

**The pain:** *the app wants to be paid twice — once in the shop, and again in ads.*

Heard 159 times in the store reviews across all seven apps (X-plore 55, Solid Explorer 56,
MiXplorer 28), and 8 times on the Material Files tracker, where the ask is the opposite one: an
ad-free, F-Droid-visible build.

> "The X-plore developer broke and ruined this once good app. He added loud pop-up full-screen
> modal video ads when you are trying to use it. It became buggy and sometimes corrupts files.
> The text editor is buggy/flaky, causing text to get deleted, and the Undo function was
> removed."
> — X-plore, 1★, 2026-10-17
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=563e6173-cc2a-4e76-8901-5f6a72868d86>

> "Utilisateur depuis des années, j'ai même pris la version payante. Il méritait son 5 à
> l'époque, depuis les nouvelles mises à jour et interfaces, c'est un enchaînement de bugs et de
> problèmes. Je l'utilise beaucoup pour ftp et smb. […] Le FTP plante depuis 1 mois, obligé de
> kill l'application."
> *— "User for years, I even bought the paid version. It used to deserve its 5 stars; since the
> latest updates and interfaces it is one long chain of bugs and problems. I use it a lot for FTP
> and SMB. […] FTP has been crashing for a month; I have to kill the app."*
> — Solid Explorer, 1★, 2026-05-06
> <https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=de42fa1f-1627-4d2c-abcd-df6842af8a80>

> "ho pagato 5 euro e serve un ingegnere per poter accedere a Google drive non ci sono
> parole… e non sono riuscito ad accedere l'app o funziona per tutto o a questo punto non serve,
> ne ho un altra cui accedo comodamente fatte in modo che funzioni"
> *— "I paid 5 euros and you need an engineer to get Google Drive access; there are no words…
> and I could not access it. Either the app works for everything or, at this point, it is no use;
> I have another one I access comfortably. Make it work."*
> — X-plore, 1★, 2026-05-26
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=3fec1250-56fb-4278-80f6-98e24ef0faf6>

**NFile today: answers it.** NFile carries no advertising and no paywall, and the Material Files
tracker shows the ad-free build is what the F-Droid crowd asks for by name.

### C2 — Cloud accounts break, or were never there

**The pain:** *the cloud account the user paid for stops authenticating — or the app never had
cloud accounts at all.*

Heard 520 times in the store reviews (Solid Explorer 191, X-plore 135, MiXplorer 104, Total
Commander 48), spread over 31 locales, and 12 times on the Material Files tracker.

> "App ottima perché ti permette di gestire svariati storage in un unico posto, peccato che da
> qualche tempo a questa parte non mi permette di creare la connessione a Dropbox, rimane in
> loop la richiesta di accesso e una volta approvata la richiede, all'infinito."
> *— "Excellent app because it lets you manage several storages in one place; shame that for
> some time now it will not let me create the Dropbox connection: the access request stays in a
> loop and, once approved, asks again, forever."*
> — Solid Explorer, 4★, 2026-01-21
> <https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=d08d668f-01ce-4366-aef5-19b161f4764a>

> "Please add the ability to connect to Google Drive. The rest is very cool!"
> — Material Files, 4★, 2023-03-24
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=c0f6ae16-f2f5-4675-8d09-c0517acf7c19>

> "Please add yandex disk cloud" — X-plore, 5★, 2023-10-14
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=decad64d-85f4-4fe6-afa5-aa1f57d77051>

> "Add cloud storage support" — Material Files issue #95 (21 comments) and #1632
> <https://github.com/zhanghai/MaterialFiles/issues/95> · <https://github.com/zhanghai/MaterialFiles/issues/1632>

**NFile today: does not answer it.** NFile's remote clients are FTP, SFTP, WebDAV and SAF
(`lib/services/remote/`). There is no provider account anywhere in the codebase: no Google
Drive, Dropbox, OneDrive, Mega or pCloud client, and no OAuth flow. This is the single largest
gap between the bench and NFile on the store side.

### C3 — LAN / SMB to the PC or the NAS is flaky, or absent

**The pain:** *the phone cannot see the computer's shared folders — or sees them and then drops
them.*

Heard 799 times in the store reviews (Solid Explorer 235, X-plore 213, Total Commander 116,
MiXplorer 83, Material Files 56, ZArchiver 54, Files by Google 42) — the most-repeated cluster
in the corpus — and 62 times on the Material Files tracker.

> "Ich habe die App seit 'Ewigkeiten' schon auf verschiedenen Android-Geräten installiert.
> Funktionierte immer alles bestens (5 Sterne). Seit Kurzem kann ich jedoch nicht mehr über
> LAN/SMB auf meine zwei Synology-NAS zugreifen. Fehlermeldung: Unbekannter Fehler."
> *— "I have had the app installed on various Android devices 'for ages'. Everything always
> worked perfectly (5 stars). Lately, however, I can no longer reach my two Synology NASes over
> LAN/SMB. Error message: Unknown error."*
> — Solid Explorer, 3★, 2024-06-23
> <https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=be82cca8-8999-42c1-8088-dffefb47ff22>

> "Программа отличная, но, после очередного обновления появилась проблема. […] Не копирует
> папки из памяти смартфона в компьютер по SMB (сама папка в компьютере создаётся) — сообщение
> 'Доступ запрещён'."
> *— "The program is excellent, but after another update there is a problem. […] It does not
> copy folders from the phone's memory to the computer over SMB (the folder itself is created on
> the computer) — message 'Access denied'."*
> — Solid Explorer, 5★, 2026-07-18
> <https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=0ccce1d3-ebbd-4806-8e65-e3663dcd23f9>

> "One UI 9 often breaks LAN/SMB for file managers after the update — Local Network permission +
> private DNS are the usual culprits."
> — r/androidapps, 2026-10-08
> <https://www.reddit.com/r/androidapps/comments/1x02c8e/_/pelpwg0/>

> "Smb is very slow" (8 comments) — Material Files issue #1588
> <https://github.com/zhanghai/MaterialFiles/issues/1588>

**NFile today: does not answer it.** NFile offers a "Local Area Network & SMB NAS Share"
connection in the UI, but `lib/services/remote/lan_client.dart` is a mock: it keeps a list of
virtual items under an `smb_virtual_fs_` key and never speaks SMB. The bench's real SMB (X-plore,
Total Commander's LAN plugin, Material Files) is not there.

### C4 — FTP / SFTP / WebDAV transfers fail, time out, or crawl

**The pain:** *the remote connection is where the file manager dies.*

Heard 689 times in the store reviews (Solid Explorer 230, X-plore 161, Total Commander 104,
Material Files 103, MiXplorer 78) across 31 locales, and 143 times on the Material Files tracker
— the most-requested topic in that tracker.

> "the new resumable file stuff sucks. I'm on the verge of uninstalling. […] most of the
> operations in the new operations list just hang or are incredibly slow."
> — Solid Explorer, 2★, 2026-07-10
> <https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=00d678a8-85d4-4b22-9139-919e6d88700d>

> "FTP server intermittently times out before welcome message and during directory listings on
> GrapheneOS" — Material Files issue #1653
> <https://github.com/zhanghai/MaterialFiles/issues/1653>

> "SFTP connection failure" — Material Files issue #1639
> <https://github.com/zhanghai/MaterialFiles/issues/1639>

> "好像WEBDAV不支持IPV6" — *"(It seems WebDAV does not support IPv6.)"* — Material Files issue #1651
> <https://github.com/zhanghai/MaterialFiles/issues/1651>

**NFile today: answers it, with one hole.** NFile has working FTP, SFTP, WebDAV and SAF clients
(`lib/services/remote/`), a real FTP **server** (`lib/services/ftp_server_service.dart`) and a web
sharing server with an SSH tunnel and a QR code (`lib/services/web_sharing_service.dart`,
`lib/core/ssh/ephemeral_ssh_key.dart`). The hole: no IPv6 handling was found in the remote
clients, and no "remember the remote password" (Material Files #1563 asks for exactly that).

### C5 — The restricted folders: `Android/data`, `Android/obb`, scoped storage

**The pain:** *the folders where the apps keep their data are the ones the file manager cannot
open.*

Heard 256 times in the store reviews (ZArchiver 134, X-plore 31, Solid Explorer 29, Material
Files 24), 29 locales, and 81 times on the Material Files tracker (the single most-commented
issue there, #611, has 58 comments).

> "used to be great, not anymore with the 'access denied' basically you're forced to root your
> device to be able to access 'most' some can't still be accessed. Rooting your device is
> generally not ideal."
> — ZArchiver, 1★, 2026-04-28
> <https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=23accd2d-4bfc-444b-98fa-3d54ebdc82e8>

> "This app can't access the root folder (android Data). when I go to Data folder under the
> android folder it sees me that 'root is not available'."
> — Material Files, 1★, 2026-09-02
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=e1e87a84-27e4-42cc-b5b5-d65aa8676ca9>

> "Olá, eu consegui resolver. O problema era que mesmo colocando a pasta no arquivo do OBB o
> sistema ainda não conseguia acessar, a solução foi instalar um aplicativo chamado 'shizuku' e
> o 'Solid Explorer' […] somente o Zarchiver sozinho não esta funcionando."
> *— "Hello, I managed to solve it. The problem was that even after putting the folder in the
> OBB folder the system still could not access it; the solution was to install an app called
> 'Shizuku' and 'Solid Explorer' […] ZArchiver alone does not work."*
> — r/teenytitans, 2026-10-08
> <https://www.reddit.com/r/teenytitans/comments/1x08jf1/_/pema4yf/>

> "X-Plore didn't allow me to access the obb folder and I tested 5 or 6 managers. It seemed like
> a root was required." — r/Addons4Kodi, 2026-08-19
> <https://www.reddit.com/r/Addons4Kodi/comments/1voz9u5/_/p4mjtyw/>

**NFile today: answers it, partly.** NFile has both root mode and Shizuku mode
(`lib/services/root_shizuku_service.dart`), and Shizuku reaches the restricted folders without
rooting. The gap the users name is narrower than "root or nothing": the complaint is that
`Android/data` access is brittle per-app and per-profile, and the tracker keeps it open
(#611, #519 ShizukuProvider, #487 "Root doesn't work on non-main profile").

### C6 — Archive formats: RAR and 7z, and extractions that fail

**The pain:** *the archive the user actually has cannot be opened — or opening it stops halfway.*

Heard 324 times in the store reviews (ZArchiver 191, X-plore 34, Solid Explorer 34, Total
Commander 30) and 72 times on the Material Files tracker.

> "Almost perfect, the drawbacks are: 1. Can't extract encrypted archives, 2. Doesn't support the
> rar format, please improve again, thank you."
> — Material Files, 3★, 2022-10-27
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=7aa4296a-320b-4443-a430-83006041951d>

> "Gagal extract file besar terus! Selalu muncul 'Operasi dengan kesalahan...' atau 'Arsip
> error'. Akses folder /Android/data di Android 13 bermasalah, padahal sudah pakai Shizuku."
> *— "Failed to extract the large file, over and over! 'Operation with error…' or 'Archive
> error' always appears. Access to the /Android/data folder on Android 13 is problematic even
> though I already use Shizuku."*
> — ZArchiver, 2★, 2025-10-22
> <https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver&reviewId=f957ac7b-3c0d-406c-a6ed-712a0c89b4c4>

> "Good Application but need to add many more things like :- 1. There should be app manager.
> 2. More Settings. 3. Compressed files opener. Ex : zip,7z etc... 4. Compress files into
> zip,7z,arj etc... 5. Application UI or Appearance." — Material Files, 3★, 2020-12-01
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=ace442ee-95d1-489d-84e3-ff16302f44f8>

> "App crashes when unpacking files (tried with: zip, 7z, tar, xz, rar)" (25 comments) —
> Material Files issue #1065 <https://github.com/zhanghai/MaterialFiles/issues/1065>

**NFile today: answers it, partly.** `lib/services/archive_service.dart` reads and writes
`zip`, `tar`, `tar.gz`, `tar.bz2`, `tar.lz4`, `tar.zst`, with a password and with split volumes.
There is **no RAR and no 7z** — which is exactly the format users name most often, and 7z with
AES-256 is asked for by name (Material Files #1628, #1565).

### C7 — Encrypted and password-protected archives

**The pain:** *the archive is locked and the file manager cannot open it.*

Heard 14 times in the store reviews (ZArchiver 8, Material Files 3, MiXplorer 2, Solid Explorer 1)
and 28 times on the Material Files tracker — thin on the store, thick on the tracker.

> "can we have a 7z support with encryption & decryption" — Material Files issue #1628
> <https://github.com/zhanghai/MaterialFiles/issues/1628>

> "7-zip archives with AES256 encryption can't be opened" — Material Files issue #1565
> <https://github.com/zhanghai/MaterialFiles/issues/1565>

> "Add a trash feature, so when the user wants to return a thrown file, they can go to the trash
> folder." — Material Files, 1★, 2024-01-16 (Indonesian)
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=b689a3fd-fc33-4be4-a1df-ebcf8e40df49>

**NFile today: answers it, partly.** NFile's archive service takes a password, and the vault is
encrypted with Argon2id — but that is the vault, not the archive reader; there is no AES-256 7z
reader because there is no 7z reader.

### C8 — No trash, no undo: a delete is final

**The pain:** *one tap on the wrong file, and it is gone.*

Heard 57 times in the store reviews (Solid Explorer 19, Material Files 10, X-plore 10, Total
Commander 8) and 11 times on the Material Files tracker, in English, Spanish and Indonesian.

> "Too risky without a Trash bin. The app lacks a Trash/Recycle bin feature, and there is no
> option to hide the default Delete button. Accidental clicks will permanently wipe out files
> with no way to recover them. I had to manually create a custom button to move files to my own
> trash folder just to avoid it."
> — Total Commander, 1★, 2026-09-18
> <https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=505b77ae-939e-4784-989b-efda24d3b96a>

> "Excellent lightweight app that doesn't rely on virtual categories […] The only thing missing is
> a recycle bin and cloud access." — Material Files, 4★, 2026-06-28
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=d64d4902-85d9-45ac-a8a0-76a62469e432>

> "SE NECESITA UNA PAPELERA YA" — *"A RECYCLE BIN IS NEEDED, NOW"* — Material Files issue #1662
> <https://github.com/zhanghai/MaterialFiles/issues/1662>

> "Add Recycle Bin" (17 comments) — Material Files issue #276
> <https://github.com/zhanghai/MaterialFiles/issues/276>

**NFile today: answers it.** NFile has a recycle bin (`lib/services/recycle_bin_service.dart`) and
an undo path.

### C9 — Storage analysis, duplicate finder, junk cleanup

**The pain:** *"where did my storage go?" — and nothing in the file manager answers it.*

Heard 136 times in the store reviews, 107 of them on Files by Google (where the cleanup
feature is the product), and 11 times on the Material Files tracker.

> "I love this app and wish it came as the default file manager. […] One thing I haven't seen in
> the app is a cleanup tool for unwanted storage junk. Is there one and I missed it? Add that
> feature and it would make this great program even better."
> — Total Commander, 5★, 2022-01-30
> <https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=d540e666-27b1-413b-aad3-0c3dd17dde12>

> "it would be nice if there was a way during the 'cleanup storage' prompt for you to view the
> media it prompts to delete. some of the videos/images I knew were old and not needed, but I
> wish I could've looked [before it deleted them]" — Files by Google, 4★, 2026-08-19
> <https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=344ec68d-3ce0-4014-943c-a514b2f582e7>

> "I am user of MiXplorer. […] 2. In storage analyzer there is no option to click view the
> files. (Example if image occupies 1GB I want to see what images and have the delete option)"
> — r/HowToMen, 2026-09-16
> <https://www.reddit.com/r/HowToMen/comments/1wgtzqs/_/pa4tc2s/>

**NFile today: answers it, partly.** NFile has a storage analyser and an app manager
(`lib/ui/screens/storage_analyzer/`), but the analyser stops at numbers: it does not drill from a
folder to the files inside it, and there is **no duplicate finder** anywhere in the codebase.

### C10 — App manager, APK details, app lock

**The pain:** *the apps on the phone are files too, and the file manager should manage them.*

Heard 611 times in the store reviews (Total Commander 211, ZArchiver 127, X-plore 75, Files by
Google 66) and 18 times on the Material Files tracker.

> "it's so good it's only missing a dedicated apk section the sidebar for a 5 star please add
> this" — Material Files, 4★, 2026-05-02
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=8d6c4c17-e3ef-42e7-b915-65b58929502a>

> "Add the App Lock and Storage Analysis features that way only the owner can use the app plus
> with the Storage Analysis feature the user can find out which files in which folder taking up
> the space like the CX File Explorer App it has that feature."
> — Total Commander, 5★, 2026-10-03
> <https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=978bfcb2-36ff-42e5-b91a-b57ae8aca7d0>

> "List APK signing certificate fingerprint so users can verify releases" — Material Files issue #1638
> <https://github.com/zhanghai/MaterialFiles/issues/1638>

**NFile today: answers it, partly.** NFile has an app manager with app backup and batch actions
(`lib/services/app_manager_service.dart`, `lib/ui/screens/storage_analyzer/app_manager_screen.dart`)
and an APK installer. What it does not have: an **app lock** (no PIN on the app itself), and no
APK signature / certificate fingerprint inspection.

### C11 — Bulk rename and multi-select gestures

**The pain:** *renaming 40 files one by one, and selecting them one by one.*

Heard 29 times in the store reviews (Total Commander 11, ZArchiver 7, MiXplorer 4, Solid Explorer
3) and 18 times on the Material Files tracker.

> "nice. cons/recent items option missing/unable to select multiple files to move, via 2 panel"
> — X-plore, 4★, 2023-08-06 (Danish)
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=e01c5939-79dd-406b-93ad-63eccadc81f9>

> "Batch renaming" — Material Files issue #1570 <https://github.com/zhanghai/MaterialFiles/issues/1570>

> "Request: add Hold & Swipe for fast multi-selection" — Material Files issue #1618
> <https://github.com/zhanghai/MaterialFiles/issues/1618>

> "Select multiple items with long-press" (14 comments) — Material Files issue #369
> <https://github.com/zhanghai/MaterialFiles/issues/369>

**NFile today: answers it.** Batch rename with pattern/replace, prefix/suffix and case rules
(`lib/ui/widgets/batch_rename_dialog.dart`); long-press selection is wired in
(`lib/ui/widgets/file_item.dart`).

### C12 — Properties: checksum, permissions, owner, hex view

**The pain:** *"what exactly is this file?" — the answer the user wants is the hash, the
permissions, the owner, the bytes.*

Heard 18 times in the store reviews (Total Commander 7, Material Files 4, X-plore 3, MiXplorer 2)
and 78 times on the Material Files tracker, whose issue titles name properties, checksums,
permissions, ownership or a hex view.

> "It can even modify the modified time of files!At one time! suggestions: 4. it's nice if we can
> both share files and clips; 3. add the md5 and SHA1verify support; 2. add themes option"
> — Total Commander, 4★, 2020-02-21
> <https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=d20f4cb6-97c2-44ac-9138-117f3482d0b4>

> "Ο καλύτερος file explorer και όχι μόνο που κυκλοφορεί εδώ και χρόνια. Με έχει σώσει με
> μεταφορές αρχείων σε lan, με bt, για md5 και ότι θες."
> *"(The best file explorer, and not only the one circulating here for years. It has saved me
> with file transfers over LAN, over Bluetooth, for MD5 and whatever you want.)"* — Solid Explorer, 5★, 2019-12-23 (Greek)
> <https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=30fdd075-7290-4473-9e3a-60fa85414b2b>

> "Saya suka tombol pintas yg dulu berada di atas … dan fitur hex editor … Bisa full tulisannya"
> *"(I liked the shortcuts that used to be at the top … and the hex editor feature … It can
> write the full text.)"* — X-plore, 5★, 2020-07-15 (Indonesian)
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=7ee9574e-244a-4732-839e-66d4c3ec7999>

> "Can we get created on, activated on, installed on, installed by, and maybe even by permissions
> and/or owner?" — Total Commander, 5★, 2021-03-19
> <https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=9af13fd5-fea5-4ca2-83e6-e1fe0d5a29a8>

**NFile today: answers it, partly.** NFile's properties dialog
(`lib/ui/widgets/selection_action_bar.dart`, `PropertiesModalDialog`) shows size, counts, last
modified, mime type and read/write permission. It does **not** show or compute a checksum, does
not change permissions, does not show the owner, and there is **no hex view** (the only "hex" in
the codebase is hex colour in the media provider).

### C13 — Media playback: cast, subtitles, album art, player controls

**The pain:** *the file manager plays the media badly, or not at all.*

Heard 137 times in the store reviews (X-plore 41, Total Commander 34, Solid Explorer 26,
MiXplorer 25) and 35 times on the Material Files tracker.

> "Hi, nice app... Wht abt to add chromecast streaming support to? Thnk u." — X-plore, 4★,
> 2025-07-07 (Brazilian Portuguese)
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=e3014011-4b9f-4b5b-abd3-e55d36c5d7c6>

> "The best! please add repeat 1 button in music player." — X-plore, 5★, 2024-03-22 (Romanian)
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=e26e1712-8412-4171-be3b-1e8606be1278>

> "the music player does not function correctly when trying to play LAN music files."
> — X-plore, 3★, 2023-10-04
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=aed850ca-b29b-4865-b3d6-43dad8f7a468>

> "Almost perfect except few things such as i can't choose 'always open' for files containing
> text (like .srt files) to open in my text editor." — Material Files, 5★, 2023-08-18
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=dda0e611-1526-42b6-871a-52ab8f3ff67a>

**NFile today: answers it, partly.** NFile has a native media index with image, video, audio and
document viewers and players, lyrics and a waveform (`lib/services/media_provider.dart`,
`lib/ui/screens/video_player/`, `lib/ui/screens/audio_player/`). It has **no cast to TV**, **no
subtitle track support** (no subtitle handling in the video player), and no repeat-one/equalizer
controls.

### C14 — Office and PDF documents inside the file manager

**The pain:** *"open this PDF/DOCX right here" — the file manager sends me to another app.*

Heard 191 times in the store reviews (X-plore 65, Files by Google 41, Solid Explorer 31,
MiXplorer 23) and 60 times on the Material Files tracker.

> "Very good, but would you like to increase the number of files in the folder? I really need
> that feature. And also menus that contain such as document files (doc, pdf, ppt, etc.) and
> music files (mp3, m4a, aac, etc.)" — Material Files, 4★, 2021-08-05
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=1472fa62-1915-4c48-8c61-204b66bd7251>

> "Good file explorer app. But it crashes hard if it tries to open a corrupted PDF. It struggles
> and moves very slowly trying to copy or move multiple files, just sits there 'collecting
> files'." — X-plore, 2★, 2023-05-11
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=f2befbbf-5ba3-4943-9d9f-d69766edc412>

**NFile today: answers it.** NFile ships a text editor, a PDF viewer (`syncfusion_flutter_pdfviewer`),
a Markdown viewer, an HTML viewer and a database reader (`lib/ui/screens/`), and reads DOCX
(`docx_to_text`), XLSX (`excel`), XML and SQLite (`sqflite`).

### C15 — A real text editor

**The pain:** *the built-in editor is a toy.*

Heard 57 times in the store reviews (Total Commander 11, Solid Explorer 11, X-plore 10,
ZArchiver 9) and 25 times on the Material Files tracker.

> "Add a text editor as complete as QuickEdit directly to the application or use it as a
> plugin. I would buy the plugin if necessary." — Solid Explorer, 4★, 2026-08-08 (Brazilian
> Portuguese)
> <https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=a971d266-0018-4fe5-a0ec-5c9f90f15a30>

> "The text editor is buggy/flaky, causing text to get deleted, and the Undo function was
> removed." — X-plore, 1★, 2026-10-17
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=563e6173-cc2a-4e76-8901-5f6a72868d86>

**NFile today: answers it.** `lib/ui/screens/text_editor_screen.dart` exists and is reachable
from the file actions.

### C16 — Look and feel: theme, dark mode, layout, tablet and TV

**The pain:** *"it works, but I do not want to live in it."*

Heard 164 times in the store reviews (X-plore 57, Solid Explorer 38, Total Commander 24,
MiXplorer 22, Material Files 16) and 90 times on the Material Files tracker — the largest
community cluster after FTP and crashes.

> "the app and features work fine, but I don't like the appearance of the app. I prefer the
> appearance and layout of 'es file explorer'. please make a theme and layout like 'es file
> explorer' :'(" — MiXplorer, 4★, 2021-05-15 (Indonesian)
> <https://play.google.com/store/apps/details?id=com.mixplorer.silver&reviewId=febe85ff-0dd6-4d6d-95f2-b86931a7da23>

> "Please add amoled dark mode" — Total Commander, 5★, 2025-07-04 (Vietnamese)
> <https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=343be22a-b0ff-4a9e-83ef-b34b58a9ee6b>

> "Light Theme Nahi hai please include light Theme" — *"(There is no light theme — please include
> a light theme.)"* — Total Commander, 4★, 2021-09-18 (Hindi)
> <https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=f6abc250-46d6-4c2f-80a2-2315d2118591>

> "Please optimise this app for Google TV. I can install it, use it but some functions don't
> work so well. And the icon doesn't appear on the launcher." — Material Files, 5★, 2022-09-12
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=f55bd920-abe3-4461-80d9-a477d9325527>

**NFile today: answers it, partly.** NFile ships a themed interface in English and Arabic, with
a dynamic-colour theme, split-screen and tablet-friendly panes. It does **not** let the user pick
the app's theme (dark/light/AMOLED) or the icon set, and there is no TV/leanback layout in the
codebase.

### C17 — Language: the app's own language, and right-to-left

**The pain:** *"the app does not speak my language, and I cannot change that."*

Thin on the store (9 reviews, 8 of them Arabic) but 16 times on the Material Files tracker — and
the tracker is where the language asks are written in the writer's own words.

> "Add per-app language preference" — Material Files issue #293
> <https://github.com/zhanghai/MaterialFiles/issues/293>

The same ask, in Arabic, is what the eight Arabic reviews in this cluster are about: the app
should speak the user's language, and the user should be able to choose it. The Arabic strand
(#46) carries this cluster too.

**NFile today: answers it, partly.** NFile speaks English and Arabic and follows the device's
language — the second half of the ask (Arabic and right-to-left) is answered ahead of every
bench. The first half — the user choosing a language other than the device's — is not answered,
and no third language exists.

### C18 — Moving files between the phone and the PC

**The pain:** *"the cable is the slowest way to move a file, and I want the phone to be the file
manager of my computer."*

Heard 32 times in the store reviews (Total Commander 8, MiXplorer 7, X-plore 5, Material Files 4).

> "I don't think I've used a USB cable to transfer files since I installed it. The dual panel
> design is really easy to use in either orientation." — X-plore, 5★, 2022-01-30
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=ed77ec58-d3c2-4424-8932-a0de5b676a74>

> "This has always been excellent, especially it's landscape view showing 2 folders at once.
> However, recently it has been unable to operate with usb drives using otg. I have previously
> used this to back up my devices, but now it won't allow me to select the usb root directory."
> — Total Commander, 3★, 2024-09-22
> <https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&reviewId=c8122de0-82b9-47ec-a45e-3c687681947d>

> "大文件（2.01G）pc传手机时，提时无权限" — *"(When transferring a large file (2.01 G) from the PC
> to the phone, it says 'no permission' from time to time.)"* — Material Files issue #840
> <https://github.com/zhanghai/MaterialFiles/issues/840>

**NFile today: does not answer it.** NFile can serve the phone over HTTP/FTP to a computer and
can be reached from a computer over those protocols — but there is no MTP/USB-transfer side in
the app, and no USB-OTG handling of the computer's side of the story.

### C19 — Speed: slow operations, slow transfers, high CPU

**The pain:** *"the app works, and it takes three minutes."*

Heard 86 times in the store reviews (Solid Explorer 21, Files by Google 18, X-plore 14,
Material Files 13) and 136 times on the Material Files tracker under crashes, freezes and CPU.

> "Very nice simple UI and great to use. […] File moving and copying is sometimes slow and
> listing folders with GIF in can cause it to crash" — Material Files, 4★, 2026-05-20
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=05446b26-8095-451f-8a8e-cd8e7e4b4a95>

> "[Enhancement] Performance optimization for smb/sftp/content streaming" (19 comments) —
> Material Files issue #634 <https://github.com/zhanghai/MaterialFiles/issues/634>

> "me.zhanghai.android.files v1.7.5 always high cpu load ON ANDROID 10 ;((" — Material Files
> issue #1647 <https://github.com/zhanghai/MaterialFiles/issues/1647>

> "复制移动大文件的时候要是能显示进度条就好了，目前没有进度条，都不知道啥时候完成了" —
> *"(It would be good to show a progress bar when copying/moving large files; right now there is
> none, so you do not even know when it has finished.)"* — Material Files issue #1591
> <https://github.com/zhanghai/MaterialFiles/issues/1591>

> "MTP・FTP・クラウド等の外部とのデータ転送機能が充実している。 […] ただしいくつかのアプリと比べたら
> コピー速度は遅めだった。 […] 4/20追記。OS14以上だとFTP接続でコピーしている時に、バックグラウンドに回すと
> 通信速度が徐々に遅くなって最終的に切断されてしまうようです。OS14以降の仕様のようで、バッテリー最適化をオフに
> しても回避出来ません。"
> *— "Transfer of data to and from the outside — MTP, FTP, cloud — is well covered. […] Still,
> compared with some other apps the copy speed is on the slow side. […] 4/20 addendum: on OS 14
> and later, when copying over an FTP connection, once the app is put in the background the
> transfer speed gradually slows down and finally the connection is cut. It seems to be an OS 14+
> behaviour and it cannot be avoided even by turning battery optimisation off."* — X-plore, 4★,
> 2025-04-19 (Japanese)
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=89e281e3-4ab9-4ef5-a822-1114411d9199>

**NFile today: answers it, partly.** NFile's copy dialog does show the transfer speed, the ETA
and the processed size (`lib/ui/widgets/file_operation_progress_dialog.dart`), which answers the
"show me the speed" request outright. Whether the operations themselves are fast is not a
question this reading can settle.

### C20 — Files that do not appear after a move or an extraction

**The pain:** *"the file is there, but the system — and the other apps — do not see it."*

Thin on the store (8 reviews) and thin on the tracker (7 items), but it is a pain with a clear
shape.

> "extracting RAR data doesn't trigger media scan / media store update" — Solid Explorer, 2★,
> 2026-10-07
> <https://play.google.com/store/apps/details?id=pl.solidexplorer2&reviewId=e961e3df-6772-45ba-95ea-7dc6e7e2ce12>

> "em Android 11 e acima, tem esse problema de arquivo não aparecer em um gerenciador de arquivos,
> porque você gerenciou esse arquivo no outro gerenciador de arquivos. Exemplo: eu usei ZArchiver
> para mover um arquivo para outra pasta, mas isso fez o arquivo não aparecer no MT MANAGER,
> Solid Explorer, etc."
> *— "On Android 11 and above there is this problem of a file not appearing in a file manager,
> because you managed that file in the other file manager. Example: I used ZArchiver to move a
> file to another folder, but that made the file not appear in MT MANAGER, Solid Explorer, etc."*
> — r/MorpheApp, 2026-09-30
> <https://www.reddit.com/r/MorpheApp/comments/1wtsgbg/_/pd2en38/>

> "File not deleted from MediaStore on Android 10" — Material Files issue #740
> <https://github.com/zhanghai/MaterialFiles/issues/740>

**NFile today: answers it, partly.** NFile keeps a native media index
(`lib/services/media_provider.dart`, `photo_manager`, `on_audio_query`), so it can see and play
media without the store's help — but nothing in the codebase re-scans the media store after a file
is written or extracted.

### C21 — Opening a terminal in the current folder

**The pain:** *"let me drop into a shell right here."*

Heard 25 times in the store reviews (Material Files 14, MiXplorer 5, Total Commander 3) and 23
times on the Material Files tracker.

> "Use Termux for 'Open in Terminal'" (12 comments) — Material Files issue #901
> <https://github.com/zhanghai/MaterialFiles/issues/901>

> "Request: Recognize Termux for Open in Terminal" — Material Files issue #1620
> <https://github.com/zhanghai/MaterialFiles/issues/1620>

> "You must install Acode, Total Commander. and the fundamental one is install Termux from
> Fdroid. Termux is linux but not a whole linux OS, but it is enough to do things that dont need
> root." — r/learnprogramming, 2026-10-08
> <https://www.reddit.com/r/learnprogramming/comments/1x01g1e/_/pekh16w/>

**NFile today: does not answer it.** There is no terminal integration anywhere in `lib/`.

### C22 — Home-screen shortcut, widget, recent files

**The pain:** *"the app is one tap away — I want it on the home screen, with a widget, and I want
it to remember where I was."*

Heard 32 times in the store reviews (Material Files 10, MiXplorer 7, Solid Explorer 6,
Files by Google 3) and 36 times on the Material Files tracker.

> "Please make a widget for playing Audio." — MiXplorer, 1★, 2026-04-24
> <https://play.google.com/store/apps/details?id=com.mixplorer.silver&reviewId=27fec2cb-2f53-42d1-8c05-6f71f8bccde0>

> "Dedicated Home Screen" — Material Files issue #1635
> <https://github.com/zhanghai/MaterialFiles/issues/1635>

> "Add a Recent Files section" — Material Files issue #1637
> <https://github.com/zhanghai/MaterialFiles/issues/1637>

> "功能请求：增加"最近 / Recent"文件聚合视图" — *"(Feature request: add a 'Recent' aggregate
> file view.)"* — Material Files issue #1607
> <https://github.com/zhanghai/MaterialFiles/issues/1607>

**NFile today: answers it, partly.** NFile has a recent-files screen
(`lib/ui/screens/all_recent_files_screen.dart`) and pinned paths (`lib/services/pin_service.dart`).
It has **no home-screen widget** and no shortcut to a folder on the home screen.

### C23 — An HTTP server on the phone

**The pain:** *"let me reach the phone's files from a browser, with no app on the computer."*

Heard 15 times in the store reviews (MiXplorer 11, X-plore 4) and 6 times on the Material Files
tracker — the bench has it, the open-source app does not.

> "功能请求 Http 服务器" — *"(Feature request: HTTP server)"* — Material Files issue #1644
> <https://github.com/zhanghai/MaterialFiles/issues/1644>

**NFile today: answers it.** NFile has a real HTTP server: `lib/services/web_sharing_service.dart`
binds an `HttpServer`, serves the phone over `http://<ip>:<port>`, and adds an SSH tunnel and a
QR code on top.

### C24 — Open-with defaults and the share sheet

**The pain:** *"every time I tap a PDF it opens in the wrong app, and I am asked again."*

Heard 29 times in the store reviews (Material Files 10, Total Commander 8, X-plore 4,
Files by Google 3) and 49 times on the Material Files tracker.

> "1. why your files have no any such options for opening any files in a specific application.
> like I always wanted to open pdf files in the drive every time and MP3 songs in my default
> music player but whenever I click the file it starts playing in the files app. Every time I
> have to manually open my [other app]" — Files by Google, 1★, 2025-07-11
> <https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&reviewId=b2462e70-e869-4308-94cd-80af9c470f5f>

> "it looks fantastic, but has bugs and inconveniences. for example you the app doesn't remember
> program I want to open files with. I chose external video player for videos and after 3 clips
> while trying to watch next I'm getting 'open as' again." — Material Files, 2★, 2026-09-01
> (Ukrainian)
> <https://play.google.com/store/apps/details?id=me.zhanghai.android.files&reviewId=2059c069-2fc0-4553-a7e9-87fe2318f7da>

> "Inconsistent results: Share Single File, Share Multiple Files, Share Folder." — Material Files
> issue #1606 <https://github.com/zhanghai/MaterialFiles/issues/1606>

> "Chooser intent missing ClipData and flags from wrapped ACTION_SEND intent" — Material Files
> issue #423 <https://github.com/zhanghai/MaterialFiles/issues/423>

**NFile today: answers it.** NFile has per-extension open-with defaults
(`lib/ui/widgets/open_with_sheet.dart`, `lib/providers/file_manager_provider.dart`), share-intent
handling (`lib/services/intent_handler_service.dart`) and a documents provider
(`android/app/src/main/kotlin/com/rubex/nfile/NFileDocumentsProvider.kt`).

### C25 — Crashes, broken functions, regressions after an update

**The pain:** *"it worked last week."*

Heard 344 times in the store reviews (Solid Explorer 99, X-plore 71, Files by Google 56,
ZArchiver 49) across 30 locales, and 136 times on the Material Files tracker.

> "I have been using this app for several years, paying for it too, & up until now, I would say
> it's great. Today, I saw there was an update, so I went to update. When completed, I went to my
> 'downloads' folder, clicked on it, and everything I had was deleted in about 5 seconds."
> — X-plore, 1★, 2026-02-16
> <https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&reviewId=1f4ee29d-c4cf-4de0-82e9-734f802009da>

> "App annoyingly asks for notification permissions" — Material Files issue #1643
> <https://github.com/zhanghai/MaterialFiles/issues/1643>

> "Frustrating permission ask" — Material Files issue #1650
> <https://github.com/zhanghai/MaterialFiles/issues/1650>

> "特权进程累积" — *"(Privileged-process accumulation.)"* — Material Files issue #1612
> <https://github.com/zhanghai/MaterialFiles/issues/1612>

**NFile today: open.** This is the cluster no reading can settle from outside; the repository
itself carries the evidence (the 53 `use_build_context_synchronously` suppressions and the dead
widgets are the in-repo shape of this cluster).

---

## 4. Pains that were looked for and are **not** clusters

A cluster nobody could find evidence for is not a cluster. These were looked for in the same
32,607 reviews and 1,543 issues and did not survive:

| Candidate pain | Store reviews | Tracker issues | Verdict |
|---|---|---|---|
| A built-in image editor / photo editing | 0 | 0 | **No evidence found** |
| Merging or splitting files | 0 | 1 | **No evidence found** |
| A torrent / magnet downloader | 1 | 1 | **No evidence found** (one mention, no cluster) |
| Automatic cloud sync of the phone's folders | 1 | 0 | **No evidence found** |
| File tagging / rating / colouring | 2 | 0 | **No evidence found** |
| A kids / family mode | 0 (the 18 keyword hits were Turkish *eskiden*, "in the old days") | 0 | **No evidence found** |
| Virus / malware scanning | 0 (the 40 keyword hits were Indonesian *memory* and Romanian *Malwarebytes*) | 0 | **No evidence found** |
| Audio editing / ringtone maker | 3 | 0 | **No evidence found** |
| Editing video (trim, crop) | 1 | 0 | **No evidence found** |
| Changing file timestamps / attributes | 5 | 1 | Thin — one ask, repeated a few times |

Two false clusters are worth naming because the words are tempting: *virus scanning* and *kids
mode* both look real in a keyword count and are not. The corpus is mostly praise — 62% of the
32,607 reviews read are 5-star, and 20% are 1-2 star — and praise is counted in a cluster only
when the review also names the pain ("I love the disk usage map, checksums, root access,
everything").

---

## 5. The Arabic strand

Issue #46 (*"What Arabic-speaking users ask for"*) is open and has published nothing yet, so the
overlap is computed here from the Arabic-language reviews in this corpus (`hl=ar-EG` and
`hl=ar-SA`, 2,192 reviews in total).

**10 of the 25 clusters also carry Arabic-language evidence in the same corpus** (C2, C4, C5, C6,
C8, C10, C14, C17, C19, C25). Every Arabic hit was read by hand, because the keyword counts
overstate them — one cluster's two "Arabic" hits turned out to be a false positive (a review
containing the string "AHMAD istration" matches "AD is"):

| Cluster | Arabic reviews in this corpus | What the Arabic reviews actually say |
|---|---|---|
| C2 cloud accounts | 6 | "تطبيق رائع ولكن سحابة onedrive لا تعمل لدي" — *("Great app, but the OneDrive cloud does not work for me: when I open OneDrive in the app it gives me nothing.")* (X-plore, 2022-04-05) |
| C4 FTP / SFTP | 6 | "انه برنامج رائع ساعدني كثير في خدمة FTP بس اخر تحديث دمر برنامج" — *("It is a great app that helped me a lot with FTP, but the last update wrecked it.")* (X-plore, 2024-09-24) |
| C5 restricted folders | 6 | "No Access to Android/data on Android 13" (Solid Explorer, 2023-01-15); ZArchiver: "no funciona el acceso a android/data" |
| C6 archive formats | 4 | ZArchiver: "0.7z 1 errno=13 : Permission denied: Android/data/ … لا توجد مساحة كافية على القرص" — *("…not enough space on the disk")* (2026-09-18) |
| C8 trash / undo | 2 | Solid Explorer: "In Arabic: Automatically delete files from trash after… Not show options 😕" (2021-02-18) |
| C10 app manager | 4 | X-plore: copying or sending an installed app produces a ZIP instead of an APK (2020-10-15); Total Commander: after the last update it no longer installs external APK files because of Google's policy (2022-10-27) |
| C14 documents | 6 | X-plore reviewers name PDF and Word sharing and viewing as the feature they praise |
| C17 language | 8 | "You're doing well, but you must add Arabic language. I paid for the app at least it should have more languages." (Solid Explorer, 2022-07-30); "Add arabic language and i will put 5 starz 😠" (2023-02-24) |
| C19 speed | 2 | MiXplorer: "Really nice, except that it's really slow in terms of moving files and what not, at least let me see a progress bar, and the indexing just takes far too long for an explorer" (2022-11-05) |
| C25 stability | 2 | Material Files: the Android/data access complaint with a root-explorer comparison (2024-08-20) |

**15 clusters carry no Arabic-language evidence in this corpus** and are, on this reading, pains
of the rest of the world: C1 (ads and the paywall), C3 (SMB/LAN), C7 (encrypted archives),
C9 (storage analysis and duplicates), C11 (bulk rename and multi-select), C12 (checksums and
permissions), C13 (cast, subtitles, album art), C15 (text editor), C16 (theme and layout),
C18 (phone-to-PC transfer), C20 (media store visibility), C21 (terminal), C22 (home-screen
shortcut and widget), C23 (HTTP server), C24 (open-with and share).

Caveat, stated plainly: these 15 are the clusters where an Arabic-language review did **not**
surface in the Arabic store locales. The Arabic strand also reads Arabic communities and Arabic
forums, which this reading could not reach; where a cluster is a general Android-platform pain
(the restricted folders, the trash bin, the cloud accounts) it is very likely to be carried by
the Arabic strand too, even if the store reviews in Arabic are thin.

---

## 6. Limits of this reading

1. **Counts are keyword counts.** A cluster's count is the number of reviews whose text matches
   the cluster's pattern; complaints phrased without the keyword are missed, and praise that
   names the pain is counted. Read the counts as a floor.
2. **The store's ranking was not read.** Only the "newest" and "most relevant" review feeds the
   RPC returns were read, per locale. The reviews behind the store's badge counts are not in
   this corpus.
3. **Forums are thinly represented.** Reddit was read through an archive (the permalinks are
   reconstructed), and the Total Commander board, XDA search, 4pda, Tieba and Zhihu were not
   readable at all. The community half of this document is mostly the Material Files tracker.
4. **One tracker, not seven.** The Material Files issue tracker is the community evidence of
   record here; the other six apps have no public tracker of the same kind.
5. **Apple's store was not read.** The iOS ports of Total Commander, Solid Explorer, ZArchiver
   and MiXplorer carry their own review populations; none of them is in this corpus.
6. **The NFile answers were read from the source**, in this repository at commit state of
   2026-10-22 — not from the marketing, and not from the sibling tickets #44 and #45, which
   cover the same ground from the other side.

---

## 7. Where this leaves the next ticket

Read against the bench and against NFile, the seven clusters where NFile is silent are, in order
of how loud the users are:

1. **C2 cloud accounts** — 520 store reviews; NFile has no provider account at all.
2. **C3 LAN / SMB** — 799 store reviews, the loudest cluster in the corpus; NFile's LAN client
   is a mock.
3. **C6/C7 RAR, 7z and AES-256** — 324 + 14 store reviews and 100 tracker items; NFile's
   archive service stops at the tar family.
4. **C12 checksums, permissions, hex** — 78 tracker items and 18 store reviews; NFile's
   properties dialog stops at size and date.
5. **C9 duplicate finder** — the analyser shows numbers but cannot drill into them.
6. **C21 terminal** — 48 items across store and tracker; nothing in `lib/`.
7. **C18 phone-to-PC transfer** — 32 store reviews; no MTP or USB side in the app.

The four clusters the bench answers and NFile answers as well — C4 remote protocols, C8 the
recycle bin, C11 bulk rename, C14 documents — are not where the next slice of work should go.
