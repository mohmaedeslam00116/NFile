# Play Store readiness for NFile (fork of `Senzme/NFile`)

**Research ticket:** #47 — "What blocks the fork from shipping on Google Play"
**Date:** 2026-10-22
**Subject:** the fork at `mohmaedeslam00116/NFile` (package `com.rubex.nfile`, licence GPL-3.0-only)
**Method:** every requirement below is taken from Google's own documentation or from the
repository itself. Repository facts are cited by file and line; requirements are cited by URL.
Nothing in the repository was modified to produce this report.

---

## 1. The short answer

Nine things stand between this fork and a publishable app on Google Play. Five of them
**block** the release — four at the Play gate, one at the licence — three **dull** it, and
one is already **clear**.

| # | Blocker | What it is | What it takes | Verdict |
|---|---|---|---|---|
| 1 | **Package format** | The release pipeline builds APKs. Play only accepts an app bundle from new apps (since Aug 2021). | Add a `flutter build appbundle` step; produce `build/app/outputs/bundle/release/app-release.aab`; upload that, not the APKs. | **BLOCKS** |
| 2 | **Signing** | There is no Play **upload key** and no Play App Signing enrolment. The only keystore in the tree is a local dev key. | Create an RSA-2048+ upload keystore, register its certificate in Play Console, keep it secret and preserved forever, wire it into CI. | **BLOCKS** |
| 3 | **Size** | The universal release APK is 149 MB; the CI splits it into three ~55–60 MB APKs. | Nothing for Play — an AAB delivers one ABI per device, ~55–60 MB, far under Play's 500 MB base-module cap. | **DULLS** (only the fat APK / manual-APK distribution) |
| 4 | **Store listing** | The four screenshots are 720×1600. Play requires 1 080–7 680 px at 9:16. The listing icon is 24-bit (no alpha); Play requires 32-bit PNG with alpha. | Re-capture the screenshots at ≥1080 px wide, 9:16; swap in the 32-bit icon already at `android/app/src/main/ic_launcher-playstore.png`. | **BLOCKS** (Play rejects the listing as-is) |
| 5 | **Policy** | No privacy policy anywhere. No Data safety form. Seven sensitive permissions, three of them requiring a Permissions Declaration Form and a weeks-long review. | Publish a privacy policy (store listing *and* in-app), complete the Data safety form, file the Permissions Declaration Form, and document All-files-access in the store description. | **BLOCKS** |
| 6 | **Target API** | Play requires API 36 since 2026-08-31. The app targets 36. | Nothing. | **CLEAR** |
| 7 | **Licence** | GPL-3.0-only, but the shipped About screen says "All rights reserved" and points "Explore Source Code" at the *upstream* repo, not the fork. | Put the GPL notice and the correct attribution in the app, point source/release links at the fork, and publish the Corresponding Source of each release. | **BLOCKS** shipping lawfully (not a Play gate) |
| 8 | **Metadata** | `metadata/com.rubex.nfile.yml` still describes upstream `Senzme/NFile` at version 1.0.42, and its `AllowedAPKSigningKeys` fingerprint does not match the dev keystore. | Repoint `Repo`/`SourceCode`/`IssueTracker`/`AuthorName` at the fork, bump to 1.0.44+44, fix the signing-key fingerprint. | **DULLS** Play / **BLOCKS** F-Droid |
| 9 | **Releases** | Tags exist (`v1.0.44` …), but there are zero GitHub release objects: `gh release list --repo mohmaedeslam00116/NFile` is empty. | Cut a release for v1.0.44 with the artifacts and the release notes Play will show per version code. | **DULLS** (but the release notes are a Play listing field) |

Three further gates sit **before** all of the above and are not in the repository at all: a Play
Console developer account (US$25, plus identity verification), device verification of a real
Android handset, and — for any personal account created after 2023-11-13 — a closed test with
**12 testers opted in continuously for 14 days** before production access is granted. The last
of those is a two-week calendar item, not a code item.

---

## 2. Package format — the pipeline builds the wrong artifact

**Requirement.** "Starting August 2021, new apps are required to publish with the Android App
Bundle on Google Play." The App Bundle is the publishing format; Play generates and serves
optimized APKs for each device configuration from it.
— <https://support.google.com/googleplay/android-developer/answer/9844279>,
<https://developer.android.com/guide/app-bundle>
Play App Signing "is required for new apps so that they can use AABs."
— <https://developer.android.com/guide/app-bundle/faq>

**What the repository does.** `.github/workflows/build.yml:110` runs:

```
flutter build apk --release --split-per-abi --obfuscate --split-debug-info=build/app/outputs/symbols --no-tree-shake-icons
```

and lines 132–159 rename the three APKs and publish them as a GitHub release. There is no
`appbundle` step anywhere in the workflow, and no `build/app/outputs/bundle/` directory exists
in the working tree (only `outputs/apk`, `outputs/flutter-apk`, `outputs/logs`,
`outputs/mapping`, `outputs/sdk-dependencies`).

**What it must produce instead.** `flutter build appbundle` — the Flutter CLI's `appbundle`
command has no `--split-per-abi` flag at all; it takes `--target-platform` (defaulting to all
three: `android-arm`, `android-arm64`, `android-x64`), `--release`, `--obfuscate` and
`--split-debug-info` (`flutter_tools/lib/src/commands/build_appbundle.dart:30–46`). The
equivalent CI step is:

```
flutter build appbundle --release --obfuscate --split-debug-info=build/app/outputs/symbols --no-tree-shake-icons
```

which produces a single `build/app/outputs/bundle/release/app-release.aab` — one base module
holding all three ABIs, from which Play derives the per-device, per-ABI, per-density APKs. The
per-ABI splitting Play does is automatic and better than `--split-per-abi`: the user's device
gets only its own ABI, and the Play listing shows a realistic download size.

**Two consequences of the AAB switch that the repository must absorb:**

1. The ABI version-code hack in `android/app/build.gradle.kts:75–85`
   (`versionCodeOverride = variant.versionCode * 10 + abiCode`) is an **F-Droid APK-split
   convention**, not a Play one. In a bundle build the variant output has no `ABI` filter, so
   the override does not apply and the bundle carries the plain `versionCode` 44. Play assigns
   and tracks per-device version codes itself, and the app has never been on Play, so 44 is
   fine — but the F-Droid numbering (441/442/443) and the Play numbering (44) will now
   diverge, and that is expected, not a bug.
2. The R8 mapping file must be uploaded to Play Console for crash deobfuscation. It is already
   produced — `build/app/outputs/mapping/release/mapping.txt` (32 MB) — but the CI currently
   discards it, and the `--split-debug-info` symbols directory
   (`build/app/outputs/symbols/`) is empty in the working tree.
   — <https://support.google.com/googleplay/android-developer/answer/9848633>

**Verdict: BLOCKS.** Nothing in the repository is uploadable to Play today.

---

## 3. Signing — the upload key, and the rule that it never changes

**Requirement.** Play App Signing splits signing into two keys
— <https://support.google.com/googleplay/android-developer/answer/9842756>:

| Key | Who holds it | Purpose |
|---|---|---|
| **Upload key** | You. A Java keystore (`.jks`/`.keystore`), **RSA 2048 bits or more**. | You sign the app bundle before uploading it. Google uses it to verify your identity. |
| **App signing key** | Google Play (RSA 4096-bit, Google-generated by default). | Google signs the final APKs delivered to users. |

The rule the ticket asks about is stated in Google's own signing guide
— <https://developer.android.com/studio/publish/app-signing>:

> "Your key should be valid for at least 25 years, so you can sign app updates with the same
> key through the lifespan of your app."

> "…because users can only update your app if the update is signed with the same signing key,
> it's difficult to change the signing key for an app that's already published."

For the **app signing key** this is automatic: Play holds it, so every future upload becomes
an update of the same listing, signed by the same key, even if the upload key changes
("Because your app signing key is secured by Google, you can continue to upload new versions
of your app as updates to the original app, even if you change upload keys"). For the
**upload key**, Google offers a reset — "If you lose your upload key, or if it is compromised,
you can request an upload key reset in the Play Console" — but the reset is a *concession*
(a multi-day process, a Play support request), not a plan. The key to preserve forever is the
one Play does not hold.

**What the repository does.**

- `.github/workflows/build.yml:88–106` decodes the `KEYSTORE_BASE64` secret into
  `android/app/upload-keystore.jks` and writes `android/key.properties` pointing at it. If the
  secret is absent the step logs *"Keystore secrets not found, skipping cryptographic signing
  setup."* and the build proceeds with **no** `key.properties` at all — in which case
  `android/app/build.gradle.kts:12–16` loads an empty `Properties` object and
  `signingConfigs.getByName("release")` is built from four `null`s. The upload key therefore
  lives entirely in a GitHub Actions secret, whose fingerprint Play has never seen.
- `android/key.properties` and every `*.keystore`/`*.jks` are gitignored
  (`android/.gitignore`: `key.properties`, `**/*.keystore`, `**/*.jks`) — correct.
- The one keystore present in the working tree is `android/app/nfile-dev.keystore`, referenced
  by the local `android/key.properties` (`storeFile=nfile-dev.keystore`, `keyAlias=nfile`).
  It is a **development** key and must never become the Play key. `keytool -list -v` on it
  reports:

  ```
  Alias name: nfile
  Owner: CN=NFile Local Dev, OU=Dev, O=Local, L=NA, ST=NA, C=NA
  Valid from: Mon Oct 19 16:50:33 EEST 2026 until: Fri Mar 06 15:50:33 EET 2054
  SHA256: 79:DE:F2:B1:E7:BB:E2:A0:FC:49:43:99:EB:2C:9E:78:1E:29:C2:8B:15:03:
          7B:90:80:B6:F4:4E:20:CE:75:3C
  ```

  The name says what it is. If it were used as the app signing key, Google would have to be
  handed a key whose CN is "Local Dev" and which nobody can re-issue.

**What it takes.** Generate a dedicated upload keystore (RSA 2048+, 25-year validity), keep it
out of the repository but under a custody that outlives the CI secrets, register its
certificate fingerprint in Play Console, and enrol the app in Play App Signing *before* the
first upload. The existing `KEYSTORE_BASE64` secret is the natural home for it — but its
fingerprint has to be registered, and the key has to be backed up somewhere the project still
controls in three years.

**Verdict: BLOCKS.**

---

## 4. Size — 149 MB, and what actually ships

**Measured from the working tree.** `build/app/outputs/flutter-apk/app-release.apk` is
**148.99 MB**. Its contents (uncompressed entry sizes):

```
lib/armeabi-v7a/libapp.so            19.97 MB     (Dart AOT)
lib/x86_64/libapp.so                 18.19 MB
lib/arm64-v8a/libapp.so              17.75 MB
lib/x86_64/libmpv.so                 15.08 MB     (media_kit / libmpv)
lib/arm64-v8a/libmpv.so              11.80 MB
lib/armeabi-v7a/libmpv.so            11.20 MB
lib/x86_64/libflutter.so             11.98 MB     (Flutter engine)
lib/arm64-v8a/libflutter.so          10.79 MB
lib/armeabi-v7a/libflutter.so         7.89 MB
lib/x86_64/libflutter_avif.so         5.17 MB
lib/arm64-v8a/libflutter_avif.so      3.16 MB
lib/armeabi-v7a/libflutter_avif.so    2.29 MB
classes.dex                           3.87 MB
------------------------------------------------
native libs total 136.58 MB; non-native 16.96 MB
per ABI:  arm64-v8a 43.99 MB | armeabi-v7a 41.71 MB | x86_64 50.88 MB
```

**What ships today.** The CI's `--split-per-abi` produces three APKs, each carrying one ABI:
roughly **55–60 MB** apiece (≈44 MB of native code for arm64-v8a plus ≈17 MB of common
assets, `classes.dex` and resources). The 149 MB figure is the *fat* APK — a single archive
holding all three ABIs, which no real device should ever download.

**Play's limits.** <https://support.google.com/googleplay/android-developer/answer/9859372>:

| App component | App download size limit (compressed) |
|---|---|
| Base module | 500 MB |
| Individual feature modules | 500 MB |
| Individual asset packs | 1.5 GB |
| Cumulative total, all modules + install-time asset packs | 4 GB |
| Cumulative total, on-demand / fast-follow asset packs | 30 GB |

> "All Google Play size limits are based on the **compressed download size**, as calculated by
> Play Console upon uploading your app bundle."

Two further facts from the same page:

> "If your app is above 200MB in size, users on a mobile data connection will see a
> non-blocking dialog when installing the app from Google Play informing them of the app's
> large size."

> "Apps still publishing with APKs instead of app bundles are subject to legacy APK size limits
> (that is, a maximum APK size of 100MB)."

**The arithmetic.** An AAB delivers one ABI per device, so a real user's download is the
common payload plus their own ABI — about **55–60 MB**, roughly a third of the 500 MB
base-module cap and well under the 200 MB line that triggers the mobile-data warning. Size is
therefore *not* a Play blocker. It is a dulling factor on the other two channels: the 149 MB
fat APK on GitHub is a 149 MB download for a user who only needs one ABI, and the CI's
three-APK scheme asks users to know their own ABI.

**Verdict: DULLS (the fat APK and the manual ABI choice), does not block Play.**

---

## 5. Store listing — what exists, and what Play will reject

**Requirement.** The main store listing needs an app name (30 characters), a short description
(80), a full description (4000), an app icon, and screenshots
— <https://support.google.com/googleplay/android-developer/answer/9859152>,
<https://support.google.com/googleplay/android-developer/answer/9866151>.

**What exists.** `fastlane/metadata/android/en-US/` is the only language directory in the
repository, and it holds `title.txt`, `short_description.txt`, `full_description.txt`,
`images/icon.png` and four `images/phoneScreenshots/N.png`. The text is within limits:
title "NFile" (5 chars), short description 60 chars, full description 1 079 chars.

**Two hard rejections:**

1. **The screenshots do not meet Play's spec.** Play requires "screenshots between 1,080 and
   7,680px" using "a 16:9 aspect ratio for landscape and a 9:16 aspect ratio for portrait".
   All four repository screenshots are **720×1600** — 720 is below the 1 080 minimum, and
   720:1600 is a 9:20 ratio, not 9:16. They are F-Droid-shaped assets (F-Droid accepts them;
   Play will not). They must be recaptured on a device or emulator at ≥1080 px wide in 9:16.
2. **The listing icon is 24-bit.** Play requires "32-bit PNG (with alpha), Dimensions: 512px by
   512px, Maximum file size: 1024KB". `fastlane/.../images/icon.png` is 512×512 and 195 KB
   but its pixel format is `Format24bppRgb` — **no alpha channel**. The repository already
   contains a compliant asset: `android/app/src/main/ic_launcher-playstore.png`, 512×512,
   `Format32bppArgb`, 222 KB. It only has to be copied over.

**The Arabic listing.** The application ships a complete Arabic UI — `lib/l10n/app_ar.arb`
with a translation for every key, checked by CI (`.github/workflows/checks.yml`, "Check that
the translation is up to date"). The *store listing* has no `ar` directory, so an Arabic
user sees an English listing or Google Translate's automated rendering
(<https://support.google.com/googleplay/android-developer/answer/9859152>, "Languages and
translations" / "Automated translations"). Adding `fastlane/metadata/android/ar/` with
`title.txt`, `short_description.txt`, `full_description.txt` and the same images is a copy of
the English text into Arabic. It is not a gate, and for a fork whose upstream audience is
Arabic-speaking it is the single highest-leverage dulling item in this report.

**The listing is not wired to anything.** There is **no `Fastfile`** in the repository —
`fastlane/` contains only `metadata/`. `fastlane supply` (the `upload_to_play_store` action)
"uploads app metadata, screenshots, binaries, and app bundles to Google Play" and needs a
Google Play service-account JSON and an app that already exists in Play Console
— <https://docs.fastlane.tools/actions/supply/>. So the metadata is a well-formed file that
no pipeline reads.

**Verdict: BLOCKS** (the screenshots and the icon are upload-time rejections), **with the
Arabic listing and the missing `Fastfile` as dulling items.**

---

## 6. Policy — the privacy policy, the data-safety form, and seven permissions

### 6.1 The privacy policy does not exist

A search of the whole repository for a file matching `privacy` or `policy` returns nothing,
and `lib/` contains no occurrence of "privacy" at all. The About screen
(`lib/ui/screens/about_screen.dart`) has four action buttons — Star on Repository, Join
Telegram Channel, Share App with Friends, Explore GitHub Source Code — and no privacy-policy
entry.

Play's requirement is explicit, and this app is squarely in scope because it requests
sensitive permissions — <https://support.google.com/googleplay/android-developer/answer/9859455>:

> "For apps that request access to sensitive permissions or data … You must link to a privacy
> policy on your app's store listing page **and within your app**. Make sure your privacy
> policy is available on an active URL, applies to your app, and specifically covers user
> privacy."

And the User Data policy requires the policy to describe what the app actually does
— <https://support.google.com/googleplay/android-developer/answer/10144311>:

> "Have a valid privacy policy in both the app's store listing and within the app itself."

### 6.2 The Data safety form is mandatory, even for an app that collects nothing

> "All developers must declare how they collect and handle user data for the apps they publish
> on Google Play, and provide details about how they protect this data through security
> practices like encryption. This includes data collected and handled through any third-party
> libraries or SDKs used in their apps."
> "Even developers with apps that do not collect any user data must complete this form and
> provide a link to their privacy policy."

— <https://support.google.com/googleplay/android-developer/answer/10787469>

This app is not a "collects nothing" app. Its merged release manifest (verified from
`build/app/intermediates/merged_manifests/release/processReleaseManifest/AndroidManifest.xml`)
requests `QUERY_ALL_PACKAGES`, and the app's App Manager feature
(`lib/services/app_manager_service.dart` → `getInstalledApps` over a method channel) lists the
device's installed applications. Play treats that inventory as personal and sensitive user
data, so the Data safety form must declare *Installed apps* (and *Files and docs*, *Audio*,
*App activity*), and the third-party SDKs — `media_kit`/libmpv, `photo_manager`,
`on_audio_query`, `open_filex`, `permission_handler`, Shizuku — must be reflected too.

### 6.3 The seven permissions, and what each obliges

Read from `android/app/src/main/AndroidManifest.xml` and confirmed against the merged
release manifest.

| Permission | Declared at | What Play requires | Blocking? |
|---|---|---|---|
| `MANAGE_EXTERNAL_STORAGE` | `AndroidManifest.xml:9` | Permitted use **includes file managers**, so the app qualifies. But: "the developer must complete the Permissions Declaration Form", the use "must be directly tied to the core functionality", and "the core functionality … must all be prominently documented and promoted in the app's description." — <https://support.google.com/googleplay/android-developer/answer/10467955> | **BLOCKS** (declaration + the listing text must name it) |
| `QUERY_ALL_PACKAGES` | `:23` | Permitted uses "include device search, antivirus apps, **file managers**, and browsers". Requires the Permissions Declaration Form. "Play regards the inventory of installed apps … as personal and sensitive information." — <https://support.google.com/googleplay/android-developer/answer/10158779> | **BLOCKS** (declaration + Data safety + in-app disclosure) |
| `PACKAGE_USAGE_STATS` | `:24` | Special app access; the app calls `checkUsageStatsPermission` / `requestUsageStatsPermission` (`lib/services/app_manager_service.dart:86,95`). The inventory it unlocks is the same installed-apps list, and the same "core functionality must be documented" rule applies. | **BLOCKS** (folded into the same declaration) |
| `REQUEST_INSTALL_PACKAGES` | `:21` | "may not be used to perform self updates, modifications, or the bundling of other APKs … unless for device management purposes. All updates or installing of packages must abide by Google Play's Device and Network Abuse policy and must be initiated and driven by the user." — <https://support.google.com/googleplay/android-developer/answer/9888170> | **DULLS** — the app's use is legitimate: `lib/services/apk_installer_service.dart` opens a user-picked `.apk`/`.xapk` via `OpenFilex`, i.e. the system installer, user-driven. A grep for `selfUpdate`/`checkForUpdate`/`downloadUpdate` finds **no self-update code**, so the prohibition is not violated. It must still be named in the listing as a core feature. |
| `READ_MEDIA_AUDIO` | `:18` | A dangerous permission: request it at runtime, in context, with a prominent disclosure immediately before the request. The audio it indexes is a "user data" type for the Data safety form. | **BLOCKS** (in-app disclosure + Data safety) |
| `ACCESS_MEDIA_LOCATION` | `:20` | A dangerous permission for EXIF geolocation. | **BLOCKS**, and see the defect below |
| `POST_NOTIFICATIONS` | `:28` | A runtime permission on Android 13+, not in Play's restricted-permission list. Request it in context; do not make the app unusable if it is denied. | **DULLS** |

**A defect found while checking `ACCESS_MEDIA_LOCATION`.** The manifest's own comment (lines
19–20) justifies the permission as *"Required for image/video metadata (EXIF) on Android 10+"* —
but lines 15–16 remove `READ_MEDIA_IMAGES` and `READ_MEDIA_VIDEO` from the merged manifest
with `tools:node="remove"`, and the merged manifest confirms both are gone. On Android,
`ACCESS_MEDIA_LOCATION` is only meaningful when the app also holds
`READ_MEDIA_IMAGES` or `READ_MEDIA_VIDEO`; with both removed the grant is inert and the EXIF
geolocation feature the permission was added for cannot work. Either the two `READ_MEDIA_*`
permissions are restored (and then the Photos-and-Videos declaration applies too —
<https://support.google.com/googleplay/android-developer/answer/9888170>) or
`ACCESS_MEDIA_LOCATION` is dropped. Shipping a permission that cannot be granted, for a
feature that cannot work, is exactly the kind of thing a Play reviewer asks about.

**Also in the merged manifest but not in the question's list:** `REQUEST_DELETE_PACKAGES`
(`:22`), `FOREGROUND_SERVICE` + `FOREGROUND_SERVICE_DATA_SYNC` +
`FOREGROUND_SERVICE_MEDIA_PLAYBACK` (`:25–27`, used by the FTP and web-sharing services),
`WAKE_LOCK` and `moe.shizuku.manager.permission.API_V23` (pulled in by the Shizuku provider).
All of these must be consistent with the listing and the Data safety form.

**The Permissions Declaration Form is a calendar blocker, not a checkbox.** From
<https://support.google.com/googleplay/android-developer/answer/9214102>:

> "Once you've completed all required steps to the Permissions Declaration Form, complete the
> remaining steps to … When you complete the Permissions Declaration Form and roll out your
> release, your app will be subject to an **extended review** by the Google Play team. Your
> request may require **up to several weeks** to process."

> "You cannot publish any changes to your app, including changes to your Store Presence (for
> example, Store Listing, Pricing, and Distribution) until you address this alert."

**Verdict: BLOCKS.**

---

## 7. Target API level — already compliant

**Requirement.** From 2026-08-31, "New apps and app updates must target **Android 16 (API
level 36)** or higher to be submitted to Google Play", with an extension available to
2026-11-01 for apps that are not compliant.

— <https://support.google.com/googleplay/android-developer/answer/11926878>

**What the app declares.** `android/app/build.gradle.kts:46` sets
`targetSdk = flutter.targetSdkVersion`. The pinned toolchain is Flutter **3.41.7**
(`.github/workflows/checks.yml`; `bin/cache/flutter.version.json` says
`frameworkVersion: 3.41.7`), whose `FlutterExtension.kt` defaults are
`compileSdkVersion = 36`, `minSdkVersion = 24`, `targetSdkVersion = 36`
(`flutter_tools/gradle/src/main/kotlin/FlutterExtension.kt:23,26,34`).

The built artefact confirms it:

```xml
<!-- build/app/intermediates/merged_manifests/release/processReleaseManifest/AndroidManifest.xml -->
<uses-sdk android:minSdkVersion="24" android:targetSdkVersion="36" />
```

**Verdict: CLEAR.** The fork already meets the 2026 bar; `minSdk 24` also satisfies the
"apps larger than 1GB must target API 21 or higher" rule from the size page. No work.

---

## 8. The licence — GPL-3.0-only, and what the fork owes

**The licence.** `LICENSE` is the full GNU General Public License Version 3, 29 June 2007
(674 lines). `metadata/com.rubex.nfile.yml` declares `License: GPL-3.0-only`, and the GitHub
repository reports `license: GPL-3.0`.

**What GPL-3.0 requires of this fork.** From the licence text
(<https://www.gnu.org/licenses/gpl-3.0.txt>):

- **§4, Conveying Verbatim Copies** — on each copy, "conspicuously and appropriately publish
  … an appropriate copyright notice; keep intact all notices stating that this License and any
  non-permissive terms added in accord with section 7 apply to the code; keep intact all
  notices of the absence of any warranty; and **give all recipients a copy of this License**
  along with the Program."
- **§5, Conveying Modified Source Versions** — "The work must carry prominent notices stating
  that you modified it, and giving a relevant date", and "You must license the entire work, as
  a whole, under this License to anyone who comes into possession of a copy."
- **§6, Conveying Non-Source Forms** — "You may convey a covered work in object code form …
  provided that you also convey the machine-readable Corresponding Source under the terms of
  this License."
- **"How to Apply These Terms to Your New Programs"** — the notice that belongs in the source
  and, in practice, in the shipped app: "This program is free software: you can redistribute
  it and/or modify it under the terms of the GNU General Public License … either version 3 of
  the License, or (at your option) any later version."
- **GPL-3.0-only** (not "or later"): the `-only` designation forbids the fork from granting
  recipients the option of GPL-2.0-or-later, and the licence's own §14 forbids adding
  restrictions to the terms.

**What the fork owes upstream (`Senzme/NFile`).** The upstream author is the copyright holder
of the original work. GPL-3.0 grants the fork the right to modify and redistribute, on three
conditions: the licence travels with the work, the modification is disclosed, and the whole
work is licensed under GPL-3.0. The fork may not relicense the upstream code, may not impose
additional restrictions, and may not withhold the Corresponding Source. The upstream's own
credits and copyright notices must survive the fork.

**What the fork owes its users.** The users of the Play build receive object code. They must
be able to obtain (a) the complete Corresponding Source of the exact binary they installed,
(b) the GPL-3.0 text, and (c) the modification notices.

**Three concrete defects in the fork as it stands.**

1. **The About screen asserts the opposite of the licence.**
   `lib/l10n/app_en.arb:26` — `"copyrightNotice": "Copyright c 2026 NFile. All rights
   reserved."` — and the About screen renders it
   (`lib/ui/screens/about_screen.dart:325`). "All rights reserved" is a proprietary
   copyright posture; the GPL requires the opposite ("This program is free software …"). The
   notice also names no author, so neither the fork's nor the upstream's copyright is stated.
2. **The app points users at the wrong source.** `about_screen.dart:280` ("Star on
   Repository"), `:308` ("Explore GitHub Source Code") and `:296` (the share text) all link to
   `https://github.com/Senzme/NFile` and `https://github.com/Senzme/NFile/releases` — the
   **upstream** repository. The Corresponding Source of this fork's binary is the fork's tree
   at the exact commit, not upstream's. A user tapping "Explore Source Code" in the Play build
   is sent to a repository that does not contain the code they are running. Under §6 that
   link is the mechanism by which the fork would be conveying the object code; it currently
   conveys the wrong source.
3. **The shipped binary carries no licence text.** `LICENSE` is in the repository, but nothing
   in `lib/` or `assets/` puts the GPL notice in front of the user, and there is no
   "Licenses" screen in the About flow.

**Verdict: BLOCKS shipping lawfully.** This is not a Play approval gate — Google does not
police GPL — but the same About screen is the natural home for the privacy policy Play *does*
require, and the two fixes belong in the same edit. The Play listing's "App access" and
privacy-policy declarations must point at the fork, not at upstream.

---

## 9. The metadata file — `metadata/com.rubex.nfile.yml`

This is F-Droid build metadata, not Play metadata. It is stale in four separate ways:

| Field | Current value | Problem |
|---|---|---|
| `AuthorName` | `Senzme` | The fork's author is not named. |
| `WebSite`, `SourceCode`, `IssueTracker` | all `https://github.com/Senzme/NFile…` | They point at upstream, not the fork. |
| `Repo` | `https://github.com/Senzme/NFile.git` | F-Droid would build **upstream's** code, not the fork's. |
| `CurrentVersion` / `CurrentVersionCode` | `1.0.42` / `423` | The fork is at `1.0.44+44` (`pubspec.yaml:22`). F-Droid would publish 1.0.42. |
| `Builds` | three entries, all `versionName: 1.0.42`, `commit: 3afa5995b4b23f62d34c5c3cb1a505723c13ed92` | Two versions behind. |
| `AllowedAPKSigningKeys` | `f6e86eca9b0d00c51a7758611b26c3c075d1e9e788265c5b115640114994c2ca` | **Does not match the dev keystore**, whose SHA-256 is `79:DE:F2:B1:E7:BB:E2:A0:FC:49:43:99:EB:2C:9E:78:1E:29:C2:8B:15:03:7B:90:80:B6:F4:4E:20:CE:75:3C`. F-Droid's rule: "`AllowedAPKSigningKeys` lets the repo operator set the expected signing keys, then `fdroid update` will check that the APKs are signed by one of those keys. If not, the mismatched APKs will not be included in the repo." — <https://f-droid.org/en/docs/Build_Metadata_Reference/> |

So either the CI's `KEYSTORE_BASE64` secret holds a *different* key from
`nfile-dev.keystore` — in which case that secret's fingerprint is the one that must land in
`AllowedAPKSigningKeys` **and** be registered in Play Console — or the CI's artifacts would
be silently dropped from the F-Droid repo. This is a cheap, high-signal check: read the
fingerprint of the key behind `KEYSTORE_BASE64` and write it down in two places.

**Verdict: DULLS Play; BLOCKS the F-Droid path** (and, because `Repo` points upstream,
it currently makes F-Droid publish a build of someone else's code under this fork's name).

---

## 10. The releases — tags without release objects

**Verified from the GitHub API** (read-only, no git commands run):

```
gh release list --repo mohmaedeslam00116/NFile     → (empty)
gh api repos/mohmaedeslam00116/NFile/releases --jq 'length'  → 0
gh api repos/mohmaedeslam00116/NFile/tags --jq '.[].name'    → v1.0.44, v1.0.43, v1.0.42,
                                                                v1.0.41, v1.0.40, v1.0.39, …,
                                                                v1.0.25
```

So `v1.0.44` exists as a tag, and there are **zero** release objects. The consequence is
direct on the CI: `.github/workflows/build.yml:51` gates the whole build on
`gh release view $APP_VERSION` — because no release object exists for v1.0.44, the check
passes and the build proceeds, but the *release* step (`:146–159`) only runs on a push to
`main`, and it would create the release object only then. Until that happens, there is no
published artifact and no release note for v1.0.44.

On Play this matters more than it looks. Play shows per-version release notes, and the
version code is what ties them together — `1.0.44` maps to `versionCode 44`, which is the
code the AAB will carry (the ABI override in `build.gradle.kts:75–85` does not apply to a
bundle). "No release object" also means "no tag with notes the Play listing can point at" and
no citable artifact for the GPL Corresponding-Source obligation.

**Verdict: DULLS** — and it is a prerequisite for the Play release notes, which is a listing
field, not a nicety.

---

## 11. The gates that are not in the repository at all

Before any of the above can be exercised, two account-level gates apply. They are listed here
because they set the critical path, and neither is visible from the code.

1. **A Play Console developer account.** US$25 one-time registration fee, personal or
   organization account type, identity verification, and possibly a government ID and credit
   card in the account owner's legal name
   — <https://support.google.com/googleplay/android-developer/answer/6112435>.
2. **Device verification.** "Starting in early 2024, developers with new personal accounts
   will be required to verify that they have access to a real Android mobile device using the
   Play Console mobile app before they can make their app available to Google Play."
   — <https://support.google.com/googleplay/android-developer/answer/14316361>
3. **The 12-tester rule.** "Developers with personal accounts created after November 13, 2023,
   must run a closed test for their app with a minimum of **12 testers who have been opted in
   continuously for at least 14 days**. When you meet these criteria, you can apply for
   production access … When you apply, you answer questions to help clarify your app design,
   testing process, and production readiness."
   — <https://support.google.com/googleplay/android-developer/answer/14151465>

That is a minimum of two weeks *after* the first AAB is uploaded, and it runs in parallel with
the Permissions Declaration Form's "up to several weeks" review. **The critical path for this
release is dominated by review queues and the tester clock, not by code.**

Two operational notes that follow from the same pages: "Package names for app files are unique
and permanent" — `com.rubex.nfile` is claimed the moment the app is created in Play Console
(<https://support.google.com/googleplay/android-developer/answer/9859152>); and `fastlane
supply` "needs to set up your app manually first by uploading at least one build to Google
Play Store" before it can connect (<https://docs.fastlane.tools/actions/supply/>), so the first
upload is a manual, browser-side step.

---

## 12. A suggested order of work

Ordered by what unblocks what, not by effort.

1. **Get the AAB building** (blocker 1). One new CI step. Nothing else can be tested until
   there is an uploadable artifact. While there: keep the R8 `mapping.txt` and the
   `--split-debug-info` symbols, and add them to the release upload.
2. **Get a real upload key** (blocker 2) and enrol the app in Play App Signing. Register the
   fingerprint in Play Console the moment the app exists. Note the fingerprint down in
   `metadata/com.rubex.nfile.yml` too.
3. **Create the Play Console app and the developer account** if they do not exist
   (§11). Do this early: the package name is permanent, and the 14-day tester clock cannot
   start until a bundle is in a closed test track.
4. **Fix the About screen and the licence notices** (blocker 7) and put the privacy policy
   in the app at the same time (blocker 5). One screen, one edit, three requirements.
5. **Re-cut the screenshots and swap the icon** (blocker 4). Mechanical.
6. **Write the privacy policy and complete the Data safety form and the Permissions
   Declaration Form** (blocker 5). The form is slow; start it as soon as the bundle exists.
7. **Write the Arabic listing** (dulling item) and add the `Fastfile` that reads
   `fastlane/metadata/android/`.
8. **Fix `metadata/com.rubex.nfile.yml`** (blocker 8) and **cut the v1.0.44 GitHub release**
   (blocker 9) with the release notes that Play will show.

---

## 13. Sources

Google Play Console Help

- Create and set up your app — <https://support.google.com/googleplay/android-developer/answer/9859152>
- Inspect app versions on the Latest releases and bundles page (AAB required since Aug 2021) — <https://support.google.com/googleplay/android-developer/answer/9844279>
- Use Play App Signing (upload key vs. app signing key) — <https://support.google.com/googleplay/android-developer/answer/9842756>
- Optimize your app's size and stay within Google Play app size limits — <https://support.google.com/googleplay/android-developer/answer/9859372>
- Manage preview assets (icon, screenshots, aspect ratios) — <https://support.google.com/googleplay/android-developer/answer/9866151>
- Prepare your app for review (App content, privacy policy) — <https://support.google.com/googleplay/android-developer/answer/9859455>
- Provide information for Google Play's Data safety section — <https://support.google.com/googleplay/android-developer/answer/10787469>
- User Data policy — <https://support.google.com/googleplay/android-developer/answer/10144311>
- Permissions and APIs that Access Sensitive Information — <https://support.google.com/googleplay/android-developer/answer/9888170>
- Use of All files access (MANAGE_EXTERNAL_STORAGE) permission — <https://support.google.com/googleplay/android-developer/answer/10467955>
- Use of the broad package (App) visibility (QUERY_ALL_PACKAGES) permission — <https://support.google.com/googleplay/android-developer/answer/10158779>
- Declare permissions for your app (Permissions Declaration Form) — <https://support.google.com/googleplay/android-developer/answer/9214102>
- Target API level requirements for Google Play apps — <https://support.google.com/googleplay/android-developer/answer/11926878>
- App testing requirements for new personal developer accounts — <https://support.google.com/googleplay/android-developer/answer/14151465>
- Device verification requirements for new developer accounts — <https://support.google.com/googleplay/android-developer/answer/14316361>
- Set up a Play Console developer account — <https://support.google.com/googleplay/android-developer/answer/6112435>

Android Developers

- About Android App Bundles — <https://developer.android.com/guide/app-bundle>
- Android App Bundle FAQ (Play App Signing required for AABs) — <https://developer.android.com/guide/app-bundle/faq>
- Sign your app and publish on Google Play (upload key, 25-year validity, same key for updates) — <https://developer.android.com/studio/publish/app-signing>
- `Manifest.permission` reference — <https://developer.android.com/reference/android/Manifest.permission>

Other

- GNU General Public License v3 — <https://www.gnu.org/licenses/gpl-3.0.txt>
- fastlane `supply` / `upload_to_play_store` — <https://docs.fastlane.tools/actions/supply/>
- Flutter: Build and release an Android app — <https://docs.flutter.dev/deployment/android>
- F-Droid Build Metadata Reference (`AllowedAPKSigningKeys`) — <https://f-droid.org/en/docs/Build_Metadata_Reference/>

Repository files cited

- `.github/workflows/build.yml` (lines 51, 88–106, 110, 132–159)
- `.github/workflows/checks.yml` (Flutter 3.41.7 pin, l10n check)
- `android/app/build.gradle.kts` (lines 12–16, 34–41, 43–52, 54–64, 75–85)
- `android/app/src/main/AndroidManifest.xml` (lines 3–28, and the `tools:node="remove"` block at 15–16)
- `android/.gitignore` (`key.properties`, `**/*.keystore`, `**/*.jks`)
- `android/key.properties` (local, gitignored: `storeFile=nfile-dev.keystore`, `keyAlias=nfile`)
- `android/app/nfile-dev.keystore` (local, gitignored; `CN=NFile Local Dev`, SHA-256 `79:DE:…:75:3C`)
- `android/app/src/main/ic_launcher-playstore.png` (512×512, 32-bit ARGB)
- `build/app/intermediates/merged_manifests/release/processReleaseManifest/AndroidManifest.xml` (minSdk 24, targetSdk 36, versionCode 44, versionName 1.0.44, final permission set)
- `build/app/outputs/flutter-apk/app-release.apk` (148.99 MB, contents measured)
- `build/app/outputs/mapping/release/mapping.txt` (R8 mapping, 32 MB)
- `fastlane/metadata/android/en-US/` (title, short description, full description, icon, 4 screenshots at 720×1600)
- `lib/l10n/app_en.arb:26` (`copyrightNotice`), `lib/l10n/app_ar.arb` (full Arabic translation)
- `lib/ui/screens/about_screen.dart:280,296,308,325` (upstream links, "All rights reserved")
- `lib/services/app_manager_service.dart:86,95` (usage-stats permission), `lib/services/apk_installer_service.dart` (user-driven APK install)
- `metadata/com.rubex.nfile.yml` (upstream pointers, 1.0.42, `AllowedAPKSigningKeys`)
- `pubspec.yaml:19` (`version: 1.0.44+44`)
