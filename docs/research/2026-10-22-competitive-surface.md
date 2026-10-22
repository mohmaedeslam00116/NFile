# Competitive surface: what the benchmark file managers actually offer

Research ticket #45 — "What the benchmark apps offer".
Date: 2026-10-22.

## Scope and method

The question this document answers: **feature by feature, what does each benchmark app
offer, and what would a person in the Arabic market notice as missing from NFile?**

Bench (per the ticket):

| Short name | App | Vendor |
| --- | --- | --- |
| **MF** | Material Files | Hai Zhang (open source, GPL-3.0) |
| **XP** | X-plore File Manager | Lonely Cat Games, s.r.o. (Banská Bystrica, Slovakia) |
| **FBG** | Files by Google | Google LLC |
| **MIX** | MiXplorer (Silver) | ADEL-DUBAI (Dubai, UAE) |
| **TC** | Total Commander for Android | Christian Ghisler (Switzerland) |
| **SE** | Solid Explorer | NeatBytes (Warsaw, Poland) |

ZArchiver is treated as a reference only and is deliberately **not** a column here.

Rules followed:

- Every claim is taken from a source that owns it: the app's own site, its own store
  listing, its own manual/help centre, its own changelog, or its own source repository.
  No blog round-ups, no forum claims, no review-site summaries.
- The `NFile` column states what NFile has **today**, taken from the feature list given
  with this ticket plus a read-only inspection of this repository. It is there so the
  matrix answers the question by itself.
- Where a source could not be reached or does not speak to a feature, the cell says
  **not established** and the reason is recorded in §5.
- User reviews are quoted only where a first-party page does not exist, and they are
  labelled as reviews, not as vendor claims.

Source codes are resolved in §6. Every cell in every table carries one.

---

## 1. The matrix

Legend: **✓** = the app's own material says so. **—** = the app's own material says it does
not do this. **?** = not established. **n/a** = does not apply to this app's shape.

### 1.1 Browsing and listing

| Feature | MF | XP | FBG | MIX | TC | SE | NFile today |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Two panes side by side | — single pane; "New window" instead [MF-STR] | ✓ dual-pane tree view; copy from one pane to the other [XP-SITE][XP-PLAY] | — one pane at a time [FBG-PLAY] | ✓ dual panel in landscape, drag & drop between panels [MIX-PLAY][MIX-SITE] | ✓ two panels side by side, or virtual two-panel mode [TC-SITE] | ✓ dual-pane layout, drag & drop between panels [SE-PLAY] | ✓ split screen |
| Tree view of hierarchy | — [MF-README] | ✓ [XP-SITE][XP-PLAY] | — | — | — | — | ? |
| Tabs | — new windows instead [MF-STR] | ? | ✓ a "Browse" tab is named in the help centre [FBG-HELP-BROWSE]; the file set is organised into categories [FBG-SITE] | ✓ unlimited tabbed browsing [MIX-PLAY] | ? | ? | ✓ tabs |
| Breadcrumbs | ✓ [MF-README][MF-STR] | ? | — | ? | — directory history dropdown [TC-SITE] | ? | ? |
| List and grid views | ✓ list + grid [MF-STR] | ? | ? | ✓ various view modes per folder [MIX-PLAY] | ? | ✓ change file-list appearance [SE-SITE] | ? |
| Sort rules | ✓ name / type / size / last modified, ascending, folders first [MF-STR] | ✓ [XP-SITE][XP-DOCS-SORT] | ✓ sort by size [FBG-PLAY] | ✓ sorting per folder [MIX-PLAY] | ? | ? | ✓ sort rules |
| Per-folder sort override | ✓ "Only for this folder" [MF-STR] | ? | ? | ✓ [MIX-PLAY] | ? | ? | ✓ folder sort override |
| Hide entries | ✓ show/hide hidden files [MF-STR] | ✓ hide folders you don't want to see [XP-SITE][XP-DOCS-HIDE] | ? | ? | ? | ? | ✓ filters |
| Bookmarks / favourites | ✓ bookmark folders [MF-STR] | ✓ favourites displayed in root [XP-SITE][XP-DOCS-BOOKMARKS] | ✓ Starred files [FBG-HELP-STARRED] | ✓ customizable bookmarks drawer, file types pre-categorised [MIX-PLAY] | ✓ bookmarks [TC-SITE] | ? | ✓ pinned paths |
| Standard-folder shortcuts | ✓ Alarms, DCIM, Documents, Downloads, Movies, Music, Notifications, Pictures, Podcasts, Ringtones, **WeChat, QQ, TIM** — no WhatsApp/Telegram [MF-STR] | ? | ✓ browses by category (images, videos, files), with a Recents area and a Downloads directory [FBG-SITE][FBG-PLAY][FBG-HELP-SCAN] | ? | ? | ✓ Collections: Downloads, Recent, Photos, Videos, Music, Documents, Apps [SE-PLAY] | ? |
| Search | ✓ name search in the listing [MF-STR] | ✓ incl. inside archives and inside search results [XP-SITE] | ✓ search + "smart filters" for images/videos/files [FBG-SITE][FBG-HELP-SEARCH] | ✓ advanced search [MIX-PLAY] | ✓ file names **by regular expression**, plus text search in files [TC-SITE][TC-HIST-3.30][TC-HIST-3.60] | ✓ indexed search with filters [SE-PLAY] | ✓ search + global search |
| Home-screen shortcuts | ✓ "Create shortcut" [MF-STR] | ✓ [XP-DOCS-SHORTCUTS] | ✓ [FBG-HELP-SHORTCUT] | ? | ? | ? | ? |
| Configurable buttons / menus | ? | ✓ configurable buttons and key shortcuts [XP-SITE][XP-PLAY] | ? | ✓ enable/disable every menu option and action button [MIX-PLAY] | ✓ configurable button bar: change dir, internal commands, launch apps, send shell commands [TC-SITE] | ? | ? |
| Manage "open with" defaults | ✓ "Open as…" (Text/Image/Audio/Video/Folder/Other), default action for APKs [MF-STR] | ✓ clear default-application handlers [XP-SITE][XP-DOCS-ASSOC] | ? | ? | ✓ remembers last "Open with"/"Send to"; bookmarks apps in the chooser [TC-HIST-3.50][TC-HIST-3.30] | ? | ✓ per-extension open-with defaults |
| Global search across the device | ? — a search action exists in the listing [MF-STR]; its scope is not established from the strings alone | ? | ✓ search for a file across the device [FBG-HELP-SEARCH] | ? | ✓ search can be started from the home folder [TC-HIST-3.42] | ? | ✓ global search |

### 1.2 Everyday file operations

| Feature | MF | XP | FBG | MIX | TC | SE | NFile today |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Copy / move / rename / delete | ✓ [MF-README][MF-STR] | ✓ [XP-SITE] | ✓ copy, move, rename, delete [FBG-HELP][FBG-HELP-RENAME] | ✓ [MIX-SITE] | ✓ including whole subfolders [TC-SITE] | ✓ [SE-PLAY] | ✓ |
| Recycle bin | — no bin in the feature set or strings [MF-STR] | ✓ [XP-DOCS-TRASH] | ✓ Trash with restore [FBG-HELP-TRASH] | ? | **— explicitly "Delete (no recycle bin)"** [TC-SITE][TC-PLAY] | ? | ✓ |
| Merge on conflict | ✓ merge folder with per-file confirmation [MF-STR] | ? | ? | ? | ? | ? | ? |
| Batch rename with patterns | — no batch-rename strings in the app [MF-STR] | ✓ [XP-SITE][XP-PLAY][XP-DOCS-BATCH] | ? | ? | ✓ multi-rename tool, incl. an `[T4]` EXIF-time field [TC-SITE][TC-HIST-3.30] | ✓ batch rename with patterns [SE-PLAY] | ✓ |
| Drag and drop | ? | ✓ (dual-pane copy) [XP-SITE] | ✓ drag & drop files [FBG-HELP-DND] | ✓ between panels [MIX-PLAY] | ✓ press & drag icon; accepts drag & drop from other apps [TC-SITE][TC-HIST-3.60] | ✓ between panels [SE-PLAY] | ✓ |
| Compare two files by content | ? | ? | ? | ? | ✓ "Compare by content" [TC-SITE] | ? | — |
| Create desktop-style URL/shortcut files | ? | ? | ? | ? | ✓ copy dialog can create URL files that act as links to a directory or file, "similar to .lnk files on Windows" [TC-HIST-3.60] | ? | — |
| Calculate folder size on demand | ? | ✓ (Disk Map) [XP-DISKMAP] | ✓ storage analyser [FBG-SITE] | ? | ✓ "Calculate occupied space" command, also works inside archives [TC-SITE][TC-HIST-3.20] | ✓ storage analyser [SE-PLAY] | ✓ storage analyzer |
| Select a range / groups | ? | ✓ multi-selection, select all, clear [XP-SITE][XP-DOCS-MULTI] | ? | ? | ✓ tap to select, long tap+release selects a range, select/unselect groups [TC-SITE] | ? | ? |
| "Open in terminal" | ✓ hands off to an external Termux/TermHere app — it is not a built-in shell [MF-TERMINAL] | ✓ SSH Shell terminal emulator [XP-SITE][XP-PLAY] | ? | ✓ built-in code editor [MIX-PLAY] | ✓ button bar can send shell commands (sh / su) [TC-SITE][TC-HIST-3.30] | ? | — |

### 1.3 Archives and compression

| Feature | MF | XP | FBG | MIX | TC | SE | NFile today |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Create archives | ✓ .zip, .tar.xz, .7z [MF-STR] | ✓ Zip [XP-SITE][XP-DOCS-ZIP] | ✓ compress files [FBG-HELP-COMPRESS] | ✓ 7z, Zip/Zip64, TAR, TAR.GZ, TAR.BZ2, GZIP, BZIP2, XZ, WIM, Lizard, LZ4, LZ5, Zstandard [MIX-PLAY][MIX-SITE] | ✓ Zip packer with encryption [TC-SITE] | ✓ ZIP, 7ZIP, RAR, TAR [SE-PLAY] | ✓ zip, tar, tar.gz, tar.bz2, tar.lz4, tar.zst |
| Extract archives | ✓ [MF-README] | ✓ Zip, Rar, 7zip [XP-PLAY] | ✓ unzip [FBG-HELP-UNZIP] | ✓ unpack list includes RAR/RAR5, AR, ARJ, CAB, CHM, CPIO, CramFS, DMG, EXT, FAT, GPT, HFS, IHEX, ISO, LZH, LZMA, MBR, MSI, NSIS, NTFS, QCOW2, RPM, SquashFS, UDF, UEFI, VDI, VHD, VMDK, XAR, Z [MIX-PLAY] | ✓ zip, rar, 7z, tar, gz, z, bz2, arj, lzh, iso, img, cab [TC-SITE] | ✓ ZIP, 7ZIP, RAR, TAR [SE-PLAY] | ✓ |
| Password / encryption on archives | ✓ password prompt; ZIP encryption changed from ZipCrypto to **AES-256** in v1.7.5 [MF-STR][MF-REL-1.7.5] | ✓ Zip with password [XP-DOCS-ZIP] | ? | ✓ split + encrypted Zip/Zip64, 7z [MIX-PLAY] | ✓ Zip packer with encryption [TC-SITE] | ✓ create and extract **encrypted** Zip and 7Zip [SE-SITE] | ✓ password + split volumes |
| Browse inside an archive as a folder | ✓ archive viewer [MF-STR][MF-TREE-VIEWER] | ✓ "seamless work with Zip (as if it was normal folder)" [XP-SITE][XP-PLAY] | ? | ? | ✓ unpack only in the listing, but modify ZIPs >4 GB [TC-HIST-3.60] | ? | ✓ |
| Modify an existing archive | ? | ? | ? | ✓ "modifying zip files" [MIX-SITE] | ✓ modify ZIP archives larger than 4 GB; pack files >4 GB [TC-HIST-3.60] | ? | ? |

### 1.4 Media, documents and viewers

| Feature | MF | XP | FBG | MIX | TC | SE | NFile today |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Image viewer | ✓ [MF-STR][MF-TREE-VIEWER] | ✓ fast viewer, zoom, slide to previous/next in folder [XP-SITE][XP-DOCS-IMAGE] | ✓ images are one of the categories the app filters for [FBG-SITE] | ✓ supports GIF, SVG, TGA, ICO [MIX-PLAY] | ✓ thumbnails incl. RAW (pef, raw, rw2, raf, dng, crw, cr2, cr3, orf, arw, nef) [TC-HIST-3.30] | ✓ [SE-PLAY] | ✓ |
| Audio player | **—** no audio viewer in the source tree; the viewer package holds only image, saveas, text [MF-TREE-VIEWER] | ✓ built-in music player, plays whole folders from any location [XP-SITE][XP-DOCS-MUSIC] | ✓ offline playback, speed, shuffle [FBG-PLAY] | ✓ media player + extra video codecs add-on [MIX-PLAY] | ✓ media player: speed, .cue support, streaming from LAN/WebDAV/cloud plugins [TC-SITE][TC-HIST-3.30][TC-HIST-3.10] | ✓ music player [SE-PLAY] | ✓ player + waveform + lyrics |
| Video player | **—** [MF-TREE-VIEWER] | ✓ video player with subtitles [XP-SITE][XP-PLAY] | ✓ [FBG-PLAY] | ✓ media player + VLC/extra codecs add-on [MIX-PLAY] | ✓ media player [TC-SITE] | ✓ video player [SE-PLAY] | ✓ player |
| Extra codecs (VLC/ffmpeg packs) | ? | ? | ? | ✓ codecs add-on (VLC) [MIX-PLAY][MIX-ADDONS] | ? | ? | — |
| Subtitles | ? | ✓ [XP-PLAY] | ? | ? | ? | ? | — |
| PDF | — no PDF viewer in the source tree [MF-TREE-VIEWER] | ✓ PDF viewer [XP-SITE][XP-DOCS-PDF] | ✓ **open, manage and edit PDFs**; ask questions about a PDF with Gemini [FBG-HELP-PDF][FBG-HELP-GEMINI] | ✓ EPub, MobiPacket and PDF reader add-on [MIX-PLAY] | ? | ? | ✓ viewer only |
| Scan a document to a searchable PDF | — | — | ✓ camera scan → searchable PDF, with crop, filter, clean, multi-page [FBG-HELP-SCAN] | — | — | — | — |
| Text editor | ✓ with encoding selection [MF-STR] | ✓ [XP-SITE] | ✓ editing is one of the app's file actions (documented for PDFs) [FBG-HELP-PDF] | ✓ text editor and code editor [MIX-PLAY] | ✓ built-in; regex search in editor; search history [TC-HIST-3.60] | ✓ text editor [SE-PLAY] | ✓ |
| Hex viewer | ? | ✓ [XP-SITE][XP-PLAY] | ? | ? | ? | ? | — |
| SQLite / database reader | ? | ✓ .db files as expandable tables of rows and columns [XP-SITE][XP-PLAY] | ? | ? | ? | ? | ✓ |
| Markdown / HTML viewers | ? | ? | ? | ✓ HTML viewer (MHT, Markdown, AXml, CHM, MAFF); font viewer [MIX-PLAY][MIX-SITE] | ? | ? | ✓ Markdown + HTML viewers |
| Image metadata (EXIF) | ✓ dimensions, taken-on, GPS coordinates + altitude, aperture, shutter, ISO, focal length, camera, software, artist, copyright [MF-STR] | ? | ? | ✓ RAW, TIFF and many other decoders [MIX-PLAY] | ? | ? | ? |
| Media metadata (audio) | ✓ title, artist, album, composer, disc/track, year, genre, duration, bit rate, sample rate [MF-STR] | ? | ? | ? | ✓ album covers as thumbnails [TC-HIST-3.50] | ? | ? |
| APK inspection | ✓ label, package, version, min/target SDK, requested permissions, signature digests; install or view contents [MF-STR] | ✓ view APK files as ZIP [XP-SITE][XP-PLAY] | ? | ✓ **APK signer with v1, v2 and v3 schemes** [MIX-PLAY] | ✓ list of installed apps; backup apps; shows the target SDK version in the APK information dialog [TC-SITE][TC-PLAY][TC-HIST-3.60] | ✓ Collections include Apps [SE-PLAY] | ✓ app manager + app backup |
| Checksums | ✓ CRC32, MD5, SHA-1, SHA-256, SHA-512, with compare-by-checksum [MF-STR] | ? | ? | ? | ? | ? | — |
| File permissions editor | ✓ change owner, group, mode (incl. setuid/setgid/sticky), SELinux context, recursive, remount read-write [MF-STR] | ✓ root mode; change read-only files [XP-SITE][XP-DOCS-ROOT] | ? | ✓ root access for all advanced operations [MIX-PLAY] | ✓ properties dialog, change attributes [TC-SITE][TC-PLAY] | ✓ root explorer: change permissions, edit config files [SE-SITE] | ✓ root mode |
| Symlinks / SELinux awareness | ✓ knows symlinks, permissions, SELinux context; handles invalid UTF-8 names [MF-README] | ? | ? | ? | ? | ? | ? |

### 1.5 Remote access, servers and the cloud

| Feature | MF | XP | FBG | MIX | TC | SE | NFile today |
| --- | --- | --- | --- | --- | --- | --- | --- |
| FTP client | ✓ FTP, FTPS, FTPES; active/passive; anonymous [MF-STR] | ✓ FTP and FTPS [XP-SITE][XP-PLAY] | ? | ✓ FTP(S,ES) client [MIX-PLAY] | ✓ FTP client plugin [TC-SITE][TC-PLAY] | ✓ FTP [SE-PLAY] | ✓ |
| SFTP / SSH client | ✓ password or public key, private-key file, key password [MF-STR] | ✓ SFTP + SSH Shell [XP-SITE][XP-PLAY] | ? | ✓ SFTP client [MIX-PLAY] | ✓ SFTP plugin [TC-PLAY] | ✓ SFTP [SE-PLAY] | ✓ |
| SMB / CIFS (Samba) client | ✓ SMB server, password/guest/anonymous, domain, LAN discovery [MF-STR] | ✓ SMB1/SMB2, and **SMB 3 in the latest update** [XP-PLAY][XP-PLAY-AR] | ? | ✓ SAMBA — SMB1, SMB2.0/2.1, SMB3 [MIX-PLAY] | ✓ LAN access plugin [TC-SITE][TC-PLAY] | ✓ SMB/CIFS (Samba) [SE-PLAY] | **—** see §4.1 |
| WebDAV client | ✓ HTTP/HTTPS, password / access token / none [MF-STR] | ✓ WebDAV among cloud providers [XP-SITE] | ? | ✓ WebDAV client [MIX-PLAY] | ✓ WebDAV plugin (Web folders) [TC-SITE][TC-PLAY] | ✓ WebDAV [SE-PLAY] | ✓ |
| SAF / Document tree | ✓ add external storage by URI [MF-STR] | ✓ write to external storage [XP-DOCS-WRITE] | ✓ SD card, USB storage devices [FBG-HELP-USB][FBG-HELP-SD] | ? | ? | ? | ✓ SAF client + documents provider |
| Cloud accounts (first-party) | **—** none [MF-README][MF-STR] | ✓ Google Drive, OneDrive, Dropbox, Box, WebDAV and others; Google Drive full access mode [XP-SITE][XP-DOCS-DRIVE][XP-PLAY] | ✓ back up to Google Drive; share to other cloud storage apps on the device [FBG-PLAY][FBG-HELP-BACKUP] | ✓ Mega, Mail.ru, Dropbox, Box, Yandex, HiDrive, Mediafire, 4Sync, 4Shared, Google Drive, Meo, OneDrive, OneDrive Business, pCloud, SugarSync + WebDAV clouds [MIX-PLAY][MIX-SITE] | ✓ Drive, OneDrive and Dropbox plugins [TC-SITE][TC-PLAY] | ✓ Google Drive, OneDrive, Dropbox, Box, NextCloud, SugarSync, MediaFire, Yandex, Mega (paid add-on) [SE-PLAY][SE-PLAY-AR] | **—** see §4.1 |
| Built-in FTP server | ✓ configurable port, user/password, anonymous, root folder, allow writing, Quick Settings tile, copy URL [MF-STR] | ✓ FTP sharing server [XP-DOCS-FTPSERVER] | ? | ✓ FTP(S,ES)/HTTP(S)/WebDAV/DLNA servers [MIX-PLAY][MIX-SITE] | ? (WiFi/WLAN plugin) [TC-PLAY] | ✓ FTP server (user/pwd required by default since v3.6.1) [SE-PLAY][SE-PLAY-AR] | ✓ |
| Web file sharing server | — no HTTP server in the source tree [MF-TREE] | ✓ manage the phone from a PC web browser [XP-SITE][XP-DOCS-INWEB] | ? | ✓ HTTP(S) server + "Advanced HTTP Server interface" [MIX-PLAY][MIX-WHATSNEW] | ✓ WiFi direct file transfer plugin [TC-SITE] | ✓ built-in web server, any browser [SE-PLAY][SE-SITE] | ✓ web sharing server + SSH tunnel + QR |
| Device-to-device offline share | — | ✓ WiFi file sharing to other Android devices [XP-SITE][XP-DOCS-WIFI] | ✓ Quick Share, up to 480 Mbps, end-to-end encrypted, works without internet, Android + Chromebook [FBG-PLAY][FBG-SITE] | ✓ TCP server to receive files from other devices via MiX send-to [MIX-SITE] | ? | ? | **—** see §4.2 |
| DLNA / UPnP | — | ✓ DLNA/UPnP explorer [XP-SITE][XP-PLAY] | ? | ✓ DLNA server [MIX-PLAY] | ? | ? | — |
| Cast to a TV | — | ? | ? | ✓ media player + codec add-on [MIX-PLAY] | ? | ✓ Chromecast streaming, from a PC or a cloud service [SE-SITE][SE-PLAY-AR] | — |
| Remote-root shell | — | ✓ SSH Shell [XP-PLAY] | ? | ? | ? | ? | — |
| Remote file indexing / search | ? | ✓ Disk Map works on FTP, LAN, SSH and cloud volumes [XP-DISKMAP] | ? | ? | ? | ✓ analyser reaches Google Drive, OneDrive and Dropbox [SE-PLAY-AR] | ? |

### 1.6 Files, sync and automation

| Feature | MF | XP | FBG | MIX | TC | SE | NFile today |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Scheduled file sync | — | ✓ one-way, full sync, move, bidirectional; periodic/daily schedule; per-task logs; home-screen shortcut [XP-SYNC] | ✓ back up photos automatically; delete backed-up photos automatically [FBG-HELP-BACKUP][FBG-HELP-AUTOBACKUP] | ✓ create Tasks to multitask copy/move operations [MIX-PLAY] | ? | ✓ resumable file operations (v3.5.X) [SE-PLAY-AR] | **—** see §4.2 |
| App manager | — | ✓ view, run, copy, share, uninstall, explore apps [XP-SITE][XP-DOCS-APPMANAGER] | ✓ delete unused apps; check the storage space of the apps [FBG-HELP-UNUSED][FBG-HELP-APPSTORAGE] | ✓ user and system app management with data backup for rooted devices [MIX-PLAY] | ✓ list of installed apps; manually back up apps [TC-SITE][TC-PLAY] | ✓ Collections include Apps [SE-PLAY] | ✓ app manager + app backup |
| Storage cleaner / junk removal | — | ? | ✓ junk, duplicates, large files, screenshots, memes, WhatsApp media, unused apps, old chat photos, low-resolution videos, cache clearing [FBG-SITE][FBG-HELP-JUNK][FBG-HELP-DUP] | ? | ✓ delete unused apps [TC-PLAY] | ✓ find duplicates, large files and junk; works on internal, SD, USB OTG and cloud [SE-PLAY][SE-PLAY-AR] | ✓ storage analyzer + batch actions |
| Encrypted vault | — | ✓ Vault, encryption with fingerprint [XP-SITE][XP-DOCS-VAULT] | ✓ Safe folder, locked behind a PIN or pattern separate from the device lock [FBG-PLAY][FBG-HELP-SAFE] | ✓ Aescrypt file encryption; Gocryptfs and EncFS containers on all storages [MIX-PLAY][MIX-SITE] | ? | ✓ AES-256 with password or fingerprint; files stay protected after uninstall [SE-PLAY][SE-PLAY-AR] | ✓ Argon2id vault |
| App-level lock | — | ✓ startup security, app password [XP-DOCS-APPASSWORD] | ✓ Safe folder lock [FBG-HELP-SAFE] | ? | ? | ? | — |
| Encrypted file system containers (EncFS/Gocryptfs) | — | ? | ? | ✓ [MIX-PLAY][MIX-SITE] | ? | ? | — |
| Shizuku | ✓ added in v1.7.5 [MF-REL-1.7.5] | ✓ [XP-DOCS-SHIZUKU] | ? | ? | ✓ enhanced access to special folders via the Play Store Shizuku app [TC-HIST-3.60] | ? | ✓ |
| Root mode | ✓ [MF-README] | ✓ [XP-DOCS-ROOT] | — | ✓ [MIX-PLAY] | ✓ optional; requests the SuperUser permission [TC-PLAY] | ✓ [SE-PLAY] | ✓ |
| USB OTG | ? | ✓ USB OTG; NTFS/HFS+ via a Paragon plugin [XP-SITE][XP-DOCS-OTG] | ✓ USB storage devices [FBG-HELP-USB] | ✓ own USB OTG driver: FAT32 R/W, exFAT R/W, NTFS R [MIX-SITE][MIX-PLAY] | ? | ✓ USB OTG plugin (paid) [SE-PLAY-AR] | ? |
| Backup of files to a cloud service | — | ✓ via File sync to a cloud destination [XP-SYNC] | ✓ back up to Google Drive / SD card [FBG-PLAY] | ? | ✓ cloud plugins + backup apps [TC-SITE] | ? | ✓ app backup (apps, not files) |

### 1.7 Platform, look and packaging

| Feature | MF | XP | FBG | MIX | TC | SE | NFile today |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Open source | ✓ GPL-3.0 [MF-README][MF-LICENSE] | — | — | — | — the app is closed source; an unrestricted build is published on F-Droid [TC-SITE] | — | ? |
| Theming | ✓ theme colour, Material Design 3, night mode + true black, list animation, long-name display [MF-STR] | ? | ✓ dark theme [FBG-HELP-DARK] | ✓ any colour, skin packages, skin editor, import skins [MIX-PLAY][MIX-SITE] | ? | ✓ themes and icon sets (icon sets are paid plugins) [SE-PLAY][SE-SITE] | ? |
| No ads | ✓ "lightweight, clean and secure"; no advertising is mentioned in the README or the store description [MF-README][MF-FULLDESC] | — contains ads; paid features remove them [XP-PLAY] | ✓ "no ads", under 20 MB [FBG-PLAY] | ✓ "This app has no ads" [MIX-SITE] | ✓ "does NOT contain any ads"; the Play listing flags a plugin link as an ad [TC-PLAY] | — contains ads [SE-PLAY] | ? |
| Paid / donation model | — free, no ads [MF-README] | — ads; music player, video player, WiFi sharing, SFTP and Vault require donation [XP-PLAY] | — free | — MiX Silver bundle, EGP 409.99 in Egypt [MIX-PLAY] | — free | — ads; in-app purchases, plugins sold separately (EGP 7–8.26 for icon sets and add-ons) [SE-PLAY-AR] | ? |
| Arabic user interface | ✓ `values-ar/strings.xml` and `values-ar/mime_types.xml` in the repository [MF-AR] | **not established** — no language list on the site or the store listing [XP-SITE][XP-PLAY] | ✓ Arabic store listing, Arabic help centre (العربية) [FBG-PLAY-AR][FBG-HELP] | **not established** | ✓ the vendor's own site lists **Arabic** among the supported languages [TC-SITE]; **the Play listing omits Arabic** from its list [TC-PLAY] | **not established** — Arabic store listing but no UI language list [SE-PLAY-AR] | ✓ whole interface in Arabic |
| Arabic store listing / Arabic-market presence | — | ✓ full Arabic listing; Arabic reviews; store locale shows مصر (العربية) [XP-PLAY-AR] | ✓ full Arabic listing; Arabic reviews [FBG-PLAY-AR] | ✓ developer address in Dubai, UAE; EGP pricing [MIX-PLAY] | ✓ Egypt storefront [TC-PLAY] | ✓ full Arabic listing; Arabic reviews [SE-PLAY-AR] | ✓ |

---

## 2. What a person in the Arabic market would notice missing in NFile

The NFile column above marks what is already there. Ranked by how visible the absence would
be to an Arabic-market user, with the bench evidence behind each.

**1. Cloud accounts — the single biggest hole.** Four of the five closed benches ship
first-party cloud clients: Google Drive, OneDrive, Dropbox, Box, NextCloud/ownCloud,
pCloud, Yandex, MediaFire, Mega, SugarSync [SE-PLAY][MIX-PLAY][XP-SITE][TC-SITE]. NFile's
remote layer holds only FTP, SFTP, WebDAV, SAF and the LAN stub — there is no cloud client
in `lib/services/remote/` [NFILE-REMOTE]. Google Drive is not exotic in the region; it is
the default backup target for an Android phone, and "back up to Google Drive" is the first
thing Files by Google advertises [FBG-PLAY]. X-plore even ships a dedicated *Google Drive
full access* mode, i.e. it treats the Drive limitation as a feature worth a separate mode
[XP-DOCS-DRIVE].

**2. A working SMB/CIFS (Samba) client for the home NAS.** MF, XP, MIX, TC and SE all
browse SMB shares [MF-STR][XP-PLAY][MIX-PLAY][TC-PLAY][SE-PLAY]; X-plore's newest release
note is literally "Support for SMB 3" [XP-PLAY-AR]. NFile *offers* LAN/SMB in its
connection wizard [NFILE-WIZARD], but the client behind it writes a placeholder string and
fakes transfer progress instead of speaking SMB [NFILE-LAN]. A user with a router
exposed drive or a WD My Cloud attached to their home network would find that the option
exists and does nothing.

**3. Disk Map — a size treemap, not a number.** X-plore's Disk Map draws the storage as a
colour-coded treemap, one column per hierarchy level, with zoom, and it works over the
local disk, the app manager, FTP, LAN, SSH and cloud [XP-DISKMAP]. Solid Explorer's
analyser reaches internal storage, SD, USB OTG *and* Google Drive / OneDrive / Dropbox
[SE-PLAY-AR]. NFile has a storage analyser [ticket], but nothing in the tree draws *where*
the space went; the bench's answer to "what is eating my phone" is a picture.

**4. Scheduled file sync.** X-plore's File sync keeps two folders in step with four
modes (one-way, full sync, move, bidirectional), a periodic or daily schedule, per-task
logs and a home-screen shortcut [XP-SYNC]. Files by Google auto-backs-up photos and
auto-deletes backed-up copies [FBG-HELP-AUTOBACKUP]. Nothing in NFile's set schedules a
recurring copy — the automated half of "backup" is missing.

**5. Casting to the television.** SE casts to a TV from a PC or a cloud service [SE-SITE];
MIX ships a DLNA server and a media player with codec add-ons [MIX-PLAY]; XP browses
DLNA/UPnP devices [XP-SITE]. NFile plays media on the phone and nothing else. In a house
where the phone is the only computer, the living-room screen is the second most-wanted
destination.

**6. PDFs you can edit and documents you can scan.** Files by Google edits PDFs and asks
questions of them with Gemini [FBG-HELP-PDF][FBG-HELP-GEMINI], and turns a photographed
page into a searchable PDF with crop, filter and clean-up [FBG-HELP-SCAN]. NFile has a
PDF *viewer*. Scanning a paper invoice or a contract to a searchable PDF needs no account
and no cloud, which makes it the feature an Arabic-market user would most plausibly ask
for by name.

**7. Device-to-device offline transfer at speed.** Files by Google's Quick Share moves
files to a nearby Android or Chromebook at up to 480 Mbps with end-to-end encryption and
no internet [FBG-PLAY][FBG-SITE]. X-plore shares over WiFi to another Android device
[XP-SITE]; MiXplorer has a TCP receive server [MIX-SITE]. NFile can serve files to a
browser over the network [ticket], but sending to the phone next to it is not the same
gesture.

**8. The power-user file inspection that root users expect.** Material Files — the
open-source twin — edits owner, group, mode and SELinux context, handles symbolic links
and invalid UTF-8 names, and computes checksums to compare a download against its
published hash [MF-README][MF-STR]. MiXplorer signs APKs with v1/v2/v3 schemes
[MIX-PLAY]; Total Commander compares two files by content [TC-SITE] and finds files by
regular expression [TC-HIST-3.30]. X-plore has a hex viewer [XP-PLAY]. NFile has root
mode but none of this inspection layer.

**9. An app lock.** Files by Google locks a Safe folder behind a PIN or pattern that is
independent of the device lock [FBG-PLAY][FBG-HELP-SAFE]; X-plore has a startup app
password [XP-DOCS-APPASSWORD]. A file manager that a family shares around the phone is
the obvious place to want this. NFile's vault covers *files*, not the app.

**10. Where NFile is ahead of the bench.** Worth recording, because the gap list is not
one-directional: NFile ships the whole interface in Arabic *and* a real RTL layout, while
the benches' Arabic is thin. Total Commander's own site lists Arabic as a supported
language but its Play listing does not [TC-SITE][TC-PLAY]. Solid Explorer's Arabic is
LTR-shaped — an Arabic reviewer asked in 2018 for "the tab bar to be on the right side
for the Arabic user", and that request is still sitting unanswered in the listing
[SE-PLAY-AR]. MiXplorer and Solid Explorer ship no Arabic UI language at all
(not established — §5). NFile's media index with waveform and lyrics, its Argon2id vault
with an SSH tunnel and a QR code for the web share, and its documents provider are not
matched by any bench app's own description.

---

## 3. Bench-by-bench reading

### Material Files — the open-source twin

The only bench whose every claim can be checked against source. It is also the narrowest
bench: no cloud, no media player, no batch rename, no dual pane, no vault, no app
manager, no disk map. Its distinctive strengths are the Linux semantics (symlinks,
permissions, SELinux, invalid UTF-8 names), the archive viewer that treats an archive as
a folder, the four remote protocols (FTP/SFTP/SMB/WebDAV), a real FTP server with a Quick
Settings tile, rich file properties including EXIF, audio metadata, APK signatures and
checksums, and Shizuku support added in v1.7.5 (2026-09-20) [MF-README][MF-STR][MF-REL-1.7.5].
It also has an Arabic translation in-tree [MF-AR]. Its "Open in terminal" is a handoff to
an external Termux/TermHere app, not a built-in shell [MF-TERMINAL].

### X-plore — the Arabic market's reference, and the most changed

The developer has rebranded: the long-lived `longgle.com` domain did not respond, and the
current Play listing names **Lonely Cat Games, s.r.o.** with the manual at
`lonelycatgames.com/docs/xplore` [XP-PLAY]. Its old feature set was Western-focused
(dual pane, root, LAN, clouds); the current one is denser and more Arabic-market-shaped:
Disk Map, a File sync engine, an app manager, a Vault with fingerprint, USB OTG with a
Paragon NTFS/HFS+ plugin, PDF and hex viewers, a SQLite reader, Shizuku, DLNA/UPnP, and
an FTP sharing server [XP-SITE][XP-PLAY][XP-DOCS]. It has a full Arabic store listing and
Arabic reviews, and its current release note is SMB 3 support [XP-PLAY-AR]. The developer
also sells ad removal and a set of donation-gated features: music player, video player
with subtitles, WiFi sharing, SFTP/SSH Shell and Vault [XP-PLAY].

### Files by Google — a cleaner first, a file manager second

This is the mass-market app (5B+ downloads, 9.09M reviews, Arabic store listing
[FBG-PLAY][FBG-PLAY-AR]). Its centre of gravity is *space*, not *files*: junk, duplicate
files, large files, screenshots, memes, WhatsApp media, unused apps, old chat photos,
low-resolution videos, cache [FBG-SITE][FBG-HELP-JUNK][FBG-HELP-DUP]. Its distinctive
features relative to NFile: Quick Share (480 Mbps, offline, end-to-end encrypted), the
Safe folder (PIN/pattern), document scanning to searchable PDF, PDF editing, Gemini Q&A
over a PDF, Circle to search on images, automatic photo backup, Starred files, Trash with
restore, "set an audio file as your ringtone", and a collection/category browser
[FBG-PLAY][FBG-HELP-SCAN][FBG-PLAY-AR]. It has no root, no FTP/SFTP/SMB client, no app
manager, no vault, no dual pane — NFile is far past it on file handling, and it is behind
on Arabic depth (its Arabic is a translation of a Google UI, not a localised product).

### MiXplorer — the power user's ceiling

19 cloud providers and a 40-format archive list (packing: 7z, Zip/Zip64 split and
encrypted, TAR family, GZIP, BZIP2, XZ, WIM, Lizard, LZ4, LZ5, Zstandard; unpacking: 35
more formats including RAR/RAR5, ISO, VHD/VMDK/VDI, CramFS, RPM) [MIX-SITE][MIX-PLAY]. It
is also the only bench that ships an APK *signer* [MIX-PLAY], a Gocryptfs/EncFS container
layer [MIX-PLAY], and a code editor [MIX-PLAY]. It is developed from Dubai and priced
EGP 409.99 in Egypt [MIX-PLAY]. It is the bench to measure "what is the ceiling" against,
not the one to compete with on reach.

### Total Commander — the veteran, and the one with a contradiction

Two panels, a plugin architecture, a media player that streams from LAN/WebDAV/cloud, a
multi-rename tool with an EXIF-time field, "compare by content", regular-expression file
search, shell commands from the button bar, Shizuku for special folders, and ZIP
manipulation past 4 GB [TC-SITE][TC-HIST-3.30][TC-HIST-3.60]. It is the only bench with
**no recycle bin** — both its site and its listing say so explicitly [TC-SITE][TC-PLAY] —
and it is the only bench whose two first-party sources disagree about Arabic [TC-SITE]
vs [TC-PLAY]. Version 3.62 (2026-02-15) [TC-SITE].

### Solid Explorer — the modern dual-pane, polished for the store

Dual pane, cloud accounts, four network protocols, a web server, an AES-256 vault with
fingerprint, a storage cleaner that reaches cloud volumes, indexed search, batch rename,
collections, an FTP server, Chromecast, resumable transfers, and Chromebook/tablet input
support [SE-PLAY][SE-SITE][SE-PLAY-AR]. Icon sets, the Mega plugin and the USB OTG plugin
are paid (EGP 7.00–8.26 in Egypt) [SE-PLAY-AR]. It is the bench whose Arabic is most
visible to the market — and whose Arabic layout is still LTR-only [SE-PLAY-AR].

---

## 4. NFile-side notes (read-only inspection of this repository)

These are not published sources; they are this repository's own files, cited by path so
the claim can be checked.

### 4.1 The remote layer has no cloud client and no real SMB

- `lib/services/remote/` contains exactly: `ftp_client.dart`, `lan_client.dart`,
  `remote_client.dart`, `saf_client.dart`, `sftp_client.dart`, `webdav_client.dart`
  [NFILE-REMOTE]. No Google Drive, Dropbox, OneDrive, Box or WebDAV-cloud client exists.
  The strings `'Google Drive'`, `'Dropbox'`, `'OneDrive'`, `'Box'` appear only as icon
  cases in a switch over saved connection types [NFILE-DIRSWITCH]; the wizard itself offers
  only LAN/SMB, FTP, SFTP, WebDAV and SAF Folder [NFILE-WIZARD].
- `lib/services/remote/lan_client.dart` is a simulation: `downloadFile` writes the literal
  string `'NFile LAN/SMB Virtual Storage Bridge\n…'` into the destination and fakes
  progress in ten steps [NFILE-LAN]. It does not speak SMB.

### 4.2 Consequence

Every item in §2 marked **—** against NFile is genuinely absent today, and the two
repository findings above are why items 1 and 2 are gaps rather than partial support.

---

## 5. Not established, and what was tried

| Question | Status | What was tried |
| --- | --- | --- |
| Does X-plore have an Arabic user interface? | **not established** | Fetched the product page `lonelycatgames.com/apps/xplore`, the full Play listing in English and in Arabic, and the manual index, the Disk Map page and the File sync page. None of them list supported UI languages. The Arabic *store listing* is proven; the Arabic *interface* is not. |
| Does Solid Explorer have an Arabic user interface? | **not established** | Fetched the Play listing in English and in Arabic and the product page `neatbytes.com/solidexplorer/`. The Arabic store listing is proven; no UI language list is published. |
| Does MiXplorer have an Arabic user interface? | **not established** | Fetched `mixplorer.com/` and the Play listing for `com.mixplorer.silver`. Neither lists supported languages. (The developer is registered in Dubai and prices in EGP, which is a market fact, not a language fact.) [MIX-PLAY] |
| Total Commander's Arabic: is the UI in Arabic? | **contradictory, both cited** | The vendor's own site lists Arabic among supported languages [TC-SITE]; the Play listing's language list does not include it [TC-PLAY]. Both are first-party. The contradiction is reported, not resolved. |
| Does Material Files play audio or video? | **established as no** | The source tree's `viewer` package contains only `image`, `saveas` and `text` [MF-TREE-VIEWER]; no audio or video viewer exists. |
| Does Material Files have a batch rename, a recycle bin, a vault or a disk map? | **established as no** | The complete `values/strings.xml` (809 lines) has no string for any of these [MF-STR]. Absence in the resource file is the source of truth for the UI. |
| MiXplorer changelog | **partly** | `mixplorer.com/changelog/` returns 404. The current release notes were taken from the Play listing's "What's new" panel, which carries v6.71.15 and the Advanced HTTP Server / Gocryptfs additions [MIX-WHATSNEW]. The full historical changelog was not reached. |
| X-plore's former site `longgle.com` | **unreachable** | Transport error on every attempt. The current manual (`lonelycatgames.com/docs/xplore`) and the current Play listing were used instead [XP-PLAY][XP-DOCS]. |
| `solidsapp.com` | **unreachable** | Transport error. The vendor site `neatbytes.com/solidexplorer/` named in the current Play listing was used instead [SE-PLAY][SE-SITE]. |
| `files.google.com/about` and `support.google.com/filesgo/answer/10769169` | **404** | Replaced by `files.google.com` and by `support.google.com/files`, which served the help-centre index and all articles cited [FBG-SITE][FBG-HELP]. |
| Total Commander's full plugin catalogue | **not established in detail** | Only the plugins named in the vendor's own site and listing were captured (FTP, SFTP, WebDAV, LAN, WiFi direct, Drive, OneDrive, Dropbox) [TC-SITE][TC-PLAY]. The plugin index itself was not read. |
| ZArchiver | **out of scope** | Reference only, per the ticket. Not researched, not in the matrix. |

---

## 6. Sources

All URLs fetched on 2026-10-22.

**Material Files**
- [MF-README] https://github.com/zhanghai/MaterialFiles/blob/master/README.md
- [MF-LICENSE] https://github.com/zhanghai/MaterialFiles/blob/master/LICENSE
- [MF-STR] https://raw.githubusercontent.com/zhanghai/MaterialFiles/master/app/src/main/res/values/strings.xml
- [MF-AR] https://github.com/zhanghai/MaterialFiles/tree/master/app/src/main/res/values-ar
- [MF-TREE] https://api.github.com/repos/zhanghai/MaterialFiles/contents/app/src/main/java/me/zhanghai/android/files
- [MF-TREE-VIEWER] https://api.github.com/repos/zhanghai/MaterialFiles/contents/app/src/main/java/me/zhanghai/android/files/viewer
- [MF-TERMINAL] https://raw.githubusercontent.com/zhanghai/MaterialFiles/master/app/src/main/java/me/zhanghai/android/files/terminal/Terminal.kt
- [MF-REL-1.7.5] https://github.com/zhanghai/MaterialFiles/releases/tag/v1.7.5
- [MF-REL-1.7.4] https://github.com/zhanghai/MaterialFiles/releases/tag/v1.7.4
- [MF-CHANGELOG-40] https://raw.githubusercontent.com/zhanghai/MaterialFiles/master/fastlane/metadata/android/en-US/changelogs/40.txt
- [MF-FULLDESC] https://raw.githubusercontent.com/zhanghai/MaterialFiles/master/fastlane/metadata/android/en-US/full_description.txt

**X-plore**
- [XP-SITE] https://www.lonelycatgames.com/apps/xplore
- [XP-PLAY] https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&hl=en
- [XP-PLAY-AR] https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore&hl=ar
- [XP-DOCS] https://www.lonelycatgames.com/docs/xplore
- [XP-DISKMAP] https://www.lonelycatgames.com/docs/xplore/disk-map
- [XP-SYNC] https://www.lonelycatgames.com/docs/xplore/file-sync
- [XP-DOCS-VAULT] https://www.lonelycatgames.com/docs/xplore/vault
- [XP-DOCS-TRASH] https://www.lonelycatgames.com/docs/xplore/trash
- [XP-DOCS-ROOT] https://www.lonelycatgames.com/docs/xplore/root
- [XP-DOCS-APPMANAGER] https://www.lonelycatgames.com/docs/xplore/app-manager
- [XP-DOCS-DRIVE] https://www.lonelycatgames.com/docs/xplore/google-drive
- [XP-DOCS-SHIZUKU] https://www.lonelycatgames.com/docs/xplore/shizuku
- [XP-DOCS-OTG] https://www.lonelycatgames.com/docs/xplore/usb-otg
- [XP-DOCS-PDF] https://www.lonelycatgames.com/docs/xplore/pdf-viewer
- [XP-DOCS-APPASSWORD] https://www.lonelycatgames.com/docs/xplore/app-password
- [XP-DOCS-ASSOC] https://www.lonelycatgames.com/docs/xplore/file-associations
- [XP-DOCS-SHORTCUTS] https://www.lonelycatgames.com/docs/xplore/home-screen-shortcuts
- [XP-DOCS-BOOKMARKS] https://www.lonelycatgames.com/docs/xplore/bookmarks-favorites
- [XP-DOCS-SORT] https://www.lonelycatgames.com/docs/xplore/sorting
- [XP-DOCS-HIDE] https://www.lonelycatgames.com/docs/xplore/hiding
- [XP-DOCS-MULTI] https://www.lonelycatgames.com/docs/xplore/multi-selection
- [XP-DOCS-BATCH] https://www.lonelycatgames.com/docs/xplore/batch-rename
- [XP-DOCS-ZIP] https://www.lonelycatgames.com/docs/xplore/zip
- [XP-DOCS-IMAGE] https://www.lonelycatgames.com/docs/xplore/image-viewer
- [XP-DOCS-MUSIC] https://www.lonelycatgames.com/docs/xplore/music-player
- [XP-DOCS-WIFI] https://www.lonelycatgames.com/docs/xplore/wifi-share
- [XP-DOCS-INWEB] https://www.lonelycatgames.com/docs/xplore/wifi-share/in-web
- [XP-DOCS-FTPSERVER] https://www.lonelycatgames.com/docs/xplore/ftp-server
- [XP-DOCS-WRITE] https://www.lonelycatgames.com/docs/xplore/write-storage

**Files by Google**
- [FBG-PLAY] https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&hl=en
- [FBG-PLAY-AR] https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&hl=ar
- [FBG-SITE] https://files.google.com/
- [FBG-HELP] https://support.google.com/files?hl=en
- [FBG-HELP-SEARCH] https://support.google.com/files/answer/9765316
- [FBG-HELP-RENAME] https://support.google.com/files/answer/9746888
- [FBG-HELP-DND] https://support.google.com/files/answer/13530280
- [FBG-HELP-BROWSE] https://support.google.com/files/answer/9765313
- [FBG-HELP-JUNK] https://support.google.com/files/answer/9713869
- [FBG-HELP-DUP] https://support.google.com/files/answer/9764075
- [FBG-HELP-UNUSED] https://support.google.com/files/answer/9765112
- [FBG-HELP-APPSTORAGE] https://support.google.com/files/answer/11349611
- [FBG-HELP-SAFE] https://support.google.com/files/answer/9935264
- [FBG-HELP-TRASH] https://support.google.com/files/answer/10607740
- [FBG-HELP-STARRED] https://support.google.com/files/answer/10317313
- [FBG-HELP-BACKUP] https://support.google.com/files/answer/9849042
- [FBG-HELP-AUTOBACKUP] https://support.google.com/files/answer/13053986
- [FBG-HELP-COMPRESS] https://support.google.com/files/answer/15679548
- [FBG-HELP-UNZIP] https://support.google.com/files/answer/9048509
- [FBG-HELP-SCAN] https://support.google.com/files/answer/15598575
- [FBG-HELP-PDF] https://support.google.com/files/answer/15949407
- [FBG-HELP-GEMINI] https://support.google.com/files/answer/15880481
- [FBG-HELP-CIRCLE] https://support.google.com/files/answer/15683987
- [FBG-HELP-RINGTONE] https://support.google.com/files/answer/10018943
- [FBG-HELP-SHORTCUT] https://support.google.com/files/answer/12327643
- [FBG-HELP-USB] https://support.google.com/files/answer/9301516
- [FBG-HELP-SD] https://support.google.com/files/answer/9712028
- [FBG-HELP-DARK] https://support.google.com/files/answer/9296329

**MiXplorer**
- [MIX-SITE] https://mixplorer.com/
- [MIX-PLAY] https://play.google.com/store/apps/details?id=com.mixplorer.silver&hl=en
- [MIX-ADDONS] https://mixplorer.com/#addons
- [MIX-WHATSNEW] https://play.google.com/store/apps/details?id=com.mixplorer.silver&hl=en (What's new panel)

**Total Commander**
- [TC-SITE] https://www.ghisler.com/android.htm
- [TC-PLAY] https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander&hl=en
- [TC-HIST-3.62] https://www.ghisler.com/android.htm (What's new, 3.62, 2026-02-15)
- [TC-HIST-3.60] https://www.ghisler.com/android.htm (What's new, 3.60)
- [TC-HIST-3.50] https://www.ghisler.com/android.htm (What's new, 3.50)
- [TC-HIST-3.42] https://www.ghisler.com/android.htm (What's new, 3.42)
- [TC-HIST-3.30] https://www.ghisler.com/android.htm (What's new, 3.30)
- [TC-HIST-3.20] https://www.ghisler.com/android.htm (What's new, 3.20)
- [TC-HIST-3.10] https://www.ghisler.com/android.htm (What's new, 3.10)

**Solid Explorer**
- [SE-SITE] https://neatbytes.com/solidexplorer/
- [SE-PLAY] https://play.google.com/store/apps/details?id=pl.solidexplorer2&hl=en
- [SE-PLAY-AR] https://play.google.com/store/apps/details?id=pl.solidexplorer2&hl=ar

**NFile (this repository, read-only)**
- [NFILE-REMOTE] `lib/services/remote/`
- [NFILE-LAN] `lib/services/remote/lan_client.dart` (lines 211–245)
- [NFILE-WIZARD] `lib/ui/screens/network_connection_wizard_screen.dart` (lines 401–407)
- [NFILE-DIRSWITCH] `lib/ui/screens/directory_screen.dart` (lines 1210–1230)
