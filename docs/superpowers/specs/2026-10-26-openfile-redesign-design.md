# OpenFile — Full Rebrand & Restyle Design

**Date:** 2026-10-26
**Status:** Draft (pending user review)
**Scope:** Incremental restyle + full rebrand from NFile to OpenFile

## 1. Identity

- **New name:** OpenFile
- **Package name:** `openfile` (was `nfile`)
- **Android label:** OpenFile
- **Seed color:** Monochrome — black/white/gray. Dark mode = AMOLED black + white accents; light mode = white + black text.
- **Typography:** Inter (replacing Lexend/Ndot57 mix).
- **Icon set:** Keep "Broken" icons (GPL, consistent).
- **Logo:** New monochrome "OF" mark.
- **Dark mode:** AMOLED (pitch black) + white accent.

## 2. Aesthetic direction

- Material 3 + light glassmorphism (keep current vibe, modernized).
- Comfortable density (current spacing).
- Bottom navigation (Home / Browse / Recent) — floating rounded container.
- Simple splash screen (logo + name), no onboarding.

## 3. Scope

- **Incremental restyle**, not full rewrite. Main stays green throughout.
- **Full rebrand**: package name, AndroidManifest labels, build.gradle applicationId/namespace, F-Droid metadata, About screen URLs, GitHub URLs.
- Preserve all existing features and 104 tests.

## 4. Architecture (unchanged)

- Provider-based state (FileManagerProvider, MediaProvider).
- Service layer (ArchiveService, Vault, WebSharing, etc.).
- Listing core (ListingBuilder, SortRule, FilterRule) — unchanged.
- Localization (en/ar/fr) — unchanged, keys untouched.

## 5. Rebrand checklist (implementation)

1. `pubspec.yaml`: name `openfile`, description.
2. `android/app/build.gradle.kts`: applicationId, namespace → `com.rubex.openfile` (or chosen).
3. `AndroidManifest.xml`: android:label "OpenFile" (all occurrences).
4. `lib/core/app_version.dart`: (no change needed, but About screen URLs).
5. `lib/ui/screens/about_screen.dart`: GitHub URLs → new repo (if forked) or keep.
6. `metadata/com.rubex.nfile.yml` → rename file + update package name.
7. `lib/l10n/*.arb`: app name strings (if any hardcoded "NFile").
8. `README.md`: title + description.
9. Tests: `test/app_version_test.dart` reads pubspec (auto).

## 6. Restyle checklist (implementation)

1. `lib/core/theme.dart`: seed color → monochrome (Color(0xFF000000) or neutral gray). Dynamic scheme variant. Font family → Inter.
2. `lib/core/icon_fonts`: keep Broken icons.
3. Replace Lexend/Ndot57 font references with Inter.
4. Splash screen: logo + "OpenFile".
5. About screen: new name + logo.
6. All "NFile" string literals in UI → "OpenFile" (via l10n or allow list).

## 7. Risks

- Package rename touches many files; must keep tests green.
- Hardcoded "NFile" strings in l10n allow list (guard test).
- F-Droid metadata filename change.
- Keystore alias stays `nfile` (key reuse for Play Store).

## 8. Out of scope

- No new features.
- No backend changes.
- No database migration.

## 9. Success criteria

- App builds (analyze clean, tests pass, CI green).
- App displays "OpenFile" everywhere user-facing.
- Monochrome theme applied (light + dark + AMOLED).
- Inter font applied.
- New logo on splash + About + launcher.

## 10. Next step

Invoke writing-plans to create detailed implementation plan.