# Where NFile goes next: the development ideas of the next release

The decision of [the map "The way NFile grows next" (#43)](https://github.com/mohmaedeslam00116/NFile/issues/43), after the five reading tickets were resolved.

## The question

Which eight ideas enter the shortlist, in what order, which of them is free and which is a candidate for payment — and which one opens v1.0.45.

## The measure

Three signals are mandatory; an idea missing any of them is dropped:

- **a gap** — a benchmark has it, NFile does not;
- **a documented pain** — a review or a request that repeats, with a link to the text;
- **a cost** — what it takes inside this codebase.

The impact on the user at large and the differentiation are the tie-breakers, not the gate. No idea is cut for a business reason; each carries a note of whether it is free or a candidate for payment.

The bench is Material Files (the open-source twin), X-plore (a bench that speaks Arabic), Files by Google (the mass market) and MiXplorer / Total Commander / Solid Explorer (the power user). ZArchiver is a reference, not a bench. The app is for the world: it speaks the language of the device, English and Arabic are the two it knows, and anything else falls back to English.

## The evidence

- [What NFile offers today](https://github.com/mohmaedeslam00116/NFile/issues/44) — the features, area by area, and every hole the source shows. Branch: `research/nfile-feature-inventory`.
- [What the benchmark apps offer](https://github.com/mohmaedeslam00116/NFile/issues/45) — the matrix, with a source per cell. Branch: `research/competitive-surface`.
- [What Arabic-speaking users ask for](https://github.com/mohmaedeslam00116/NFile/issues/46) — 21 pains from 4,104 Arabic reviews. Branch: `research/arabic-user-pains`.
- [What file-manager users ask for, everywhere](https://github.com/mohmaedeslam00116/NFile/issues/51) — 25 pains from 32,607 reviews across 38 locales. Branch: `research/worldwide-user-pains`.
- [What blocks the fork from shipping on Google Play](https://github.com/mohmaedeslam00116/NFile/issues/47) — kept for the day the app reaches the store; the store is not on the road now. Branch: `research/play-store-readiness`.

## The eight, in the order the work follows

### 1. Honest operation reporting — #53
**Report a partial file-operation failure as a failure, instead of "completed".**

- Gap: none today — no partial-failure reporting exists anywhere.
- Pain: the most-upvoted review in the Arabic corpus (+4,152 votes, "it says completed and then fails"), plus 344 crash and post-update-regression reviews worldwide.
- Cost: low–medium.
- Free or paid: free.
- First slice: in `FileManagerProvider`'s copy/move/delete paths, when some items fail, return and display the count of failures instead of "completed"; add a test that a partial failure is reported as a failure. This is the foundation the later ideas rest on.

### 2. Duplicate finder by content — #54
**Find duplicate files by content.**

- Gap: only name-collision detection exists today (the conflict dialog); no content-based finder.
- Pain: 17 Arabic reviews asking for it, plus the worldwide strand.
- Cost: low–medium.
- Free or paid: free.
- First slice: a scan that hashes files (SHA-256) within a scope and groups equal hashes; surface it from the search/global-search entry point. Start with a single folder's subtree before expanding.

### 3. More languages — #55
**Add a third language to the app.**

- Gap: only English and Arabic are supported (`AppLocale.supported = [en, ar]`); anything else falls back to English.
- Pain: 12 Arabic reviews "أين اللغة العربية" plus the world strand.
- Cost: low per language — the pipeline is proven: ARB + `flutter gen-l10n` + the two guards.
- Free or paid: free.
- Open question to settle first: which language, and whether the user may choose a language other than the device's (today there is no in-app switch).
- First slice: settle the open question, add the ARB, run `flutter gen-l10n`, commit the generated files, and let the whole-source guard confirm the ledger stays clean.

### 4. RAR / 7z / AES-256 archives — #56
**Read and extract RAR and 7z archives, including AES-256.**

- Gap: no RAR or 7z support, no AES-256 encrypted archives — though `AndroidManifest.xml` lists `zip/rar/7z/tar/gz/bz2` among the types the app opens.
- Pain: 324 reviews of failed extractions.
- Cost: medium — a native library.
- Free or paid: free; password-protected archives as a paid candidate (as ZArchiver does).
- First slice: choose the native library (libarchive / p7zip) and add read + extract for 7z and RAR, including AES-256, behind the existing archive service interface.

### 5. Checksums, permissions and the hex viewer — #57
**Checksums, permissions and a hex viewer.**

- Gap: none today.
- Pain: 78 tracker issues.
- Cost: medium (`chmod`/`chown` need root; the hex viewer and checksums do not).
- Free or paid: free.
- First slice: a checksum tool (SHA-256/MD5) on selected files; a hex-viewer entry point; chmod/chown behind the existing root/Shizuku modes.

### 6. Phone-to-PC transfer — #58
**Phone-to-PC transfer.**

- Gap: the web sharing server covers part of it.
- Pain: a bench feature, present in the competitors.
- Cost: medium–high.
- Free or paid: free.
- First slice: extend the existing web sharing server with a one-click "send to this PC" flow: QR code on the phone, upload from the browser, progress on both sides.

### 7. Cloud storage accounts — #59
**Cloud storage accounts.**

- Gap: no provider client exists in `lib/services/remote/` today.
- Pain: 520 reviews.
- Cost: high (OAuth and a provider API each).
- Free or paid: free; sync as a paid candidate.
- First slice: one provider end-to-end — Google Drive: OAuth, list, download, upload — behind a single `RemoteClient` interface, so the others follow the same shape.

### 8. Real SMB/LAN support — #60
**Real SMB/LAN support.**

- Gap: the current client is a mock (`lan_client.dart` seeds a fake tree and writes a placeholder string on download).
- Pain: 799 reviews — the loudest cluster in the whole corpus.
- Cost: high (a native SMB library).
- Free or paid: free.
- First slice: replace the mock with a real SMB client and verify list, download and upload against a real share, keeping the same `RemoteClient` interface.

## The pick: what opens v1.0.45

**Honest operation reporting (#53)** opens v1.0.45.

It is the cheapest of the four low-cost candidates, it carries the loudest pain, it has no prerequisite, and it is the foundation everything later rests on: an app that reports "completed" when it has not is not trustworthy, and no later feature should be built on top of that.

## The five that did not enter

- **Terminal integration** (23 reviews) — too few, and a power-user feature, not a documented pain.
- **App lock** (bench feature, low cost) — a real bench feature, but the vault already carries the security story and the evidence is thin.
- **Cast / DLNA** (3 reviews) — too thin.
- **Scheduled sync** (X-plore) — high cost; better as a later slice.
- **Treemap of storage** (bench-only) — nice to have, not a documented pain.
- **Quick Share offline** (high cost, niche) — the web sharing server already covers the "send to a friend" case.

## The accepted ideas

The eight accepted ideas became issues labelled `ready-for-agent`: #53, #54, #55, #56, #57, #58, #59, #60. Each carries its three signals and its first slice.

## What is not on this road

- The Google Play publication — the app is not published to the store at present; the store's gates are kept for the day it reaches the store. See #48 (closed, out of scope) and #52.
- The architecture of the listing and its parallel vocabularies — that is issue #1, a different map.
- The internal quality of the code — the hygiene of whichever idea is chosen, not an idea of its own.
- Anything that is not a file manager.
