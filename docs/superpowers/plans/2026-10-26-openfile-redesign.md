# OpenFile Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rebrand NFile → OpenFile (package `openfile`) and restyle to monochrome Material 3 + Inter font, AMOLED dark, keeping all features and 104 tests green.

**Architecture:** Incremental restyle. Change identity (name, package, URLs, logo) and theme tokens (seed color, font) without touching feature logic. Each task independently testable; main stays green.

**Tech Stack:** Flutter/Dart, Material 3, Google Fonts (Inter), Android Gradle.

## Global Constraints

- Version floor: Flutter SDK per pubspec; keep `flutter analyze` clean and `flutter test` 104 pass.
- No new dependencies except `google_fonts` (already present).
- Package name becomes `openfile`; Android applicationId/namespace become `com.rubex.openfile`.
- Seed color: neutral gray `Color(0xFF6B7280)` (Material 3 tonal palette). Dark mode: AMOLED black + white accent.
- Font family: `Inter` (replace `LexendDeca`/`Ndot57` display usage in About/splash only; body uses Inter).
- Keep "Broken" icon set.
- Keep all l10n keys; only change user-facing "NFile" literals (must be in allow list or removed).
- Each task ends with a commit on a feature branch + PR + merge after CI green.

---

### Task 1: Rebrand package name and Android identity

**Files:**
- Modify: `pubspec.yaml:1-2`
- Modify: `android/app/build.gradle.kts` (applicationId, namespace)
- Modify: `android/app/src/main/AndroidManifest.xml` (all `android:label="NFile"`)
- Modify: `metadata/com.rubex.nfile.yml` → rename to `metadata/com.rubex.openfile.yml`

- [ ] **Step 1: Update pubspec.yaml**

```yaml
name: openfile
description: "OpenFile — A File Manager."
```

- [ ] **Step 2: Update build.gradle.kts**

Change `applicationId` and `namespace` from `com.rubex.nfile` to `com.rubex.openfile`.

- [ ] **Step 3: Update AndroidManifest.xml labels**

Replace all `android:label="NFile"` with `android:label="OpenFile"`.

- [ ] **Step 4: Rename F-Droid metadata file**

```bash
git mv metadata/com.rubex.nfile.yml metadata/com.rubex.openfile.yml
```
Edit inside: package name → `com.rubex.openfile`, name → `OpenFile`.

- [ ] **Step 5: Run analyze + tests**

Run: `flutter analyze && flutter test`
Expected: PASS (104 tests).

- [ ] **Step 6: Commit**

```bash
git checkout -b chore/rebrand-package
git add -A
git commit -m "chore: rebrand package name NFile -> OpenFile"
```

---

### Task 2: Rebrand About screen and URLs

**Files:**
- Modify: `lib/ui/screens/about_screen.dart` (title 'NFile' → 'OpenFile', GitHub URLs)

- [ ] **Step 1: Update title text**

Change `Text('NFile', ...)` to `Text('OpenFile', ...)`.

- [ ] **Step 2: Update GitHub URLs**

Replace `https://github.com/mohmaedeslam00116/NFile` with `https://github.com/mohmaedeslam00116/OpenFile` (or keep if repo not renamed). Replace releases URL similarly.

- [ ] **Step 3: Update app name in l10n if present**

Search `lib/l10n/*.arb` for "NFile" string values; replace with "OpenFile". Add to allow list if needed.

- [ ] **Step 4: Run analyze + tests + guard**

Run: `flutter analyze && flutter test test/no_hardcoded_strings_test.dart`
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git commit -m "chore: rebrand About screen and URLs to OpenFile"
```

---

### Task 3: Monochrome theme + Inter font

**Files:**
- Modify: `lib/core/theme.dart` (seedColor, font handling)

- [ ] **Step 1: Change seed color to neutral gray**

```dart
static const Color seedColor = Color(0xFF6B7280);
```

- [ ] **Step 2: Replace font family defaults**

Where `fontFamily = 'default'` resolves to LexendDeca, switch to `Inter`. Update the `switch (fontFamily)` default case to use Inter.

- [ ] **Step 3: Run analyze + tests**

Run: `flutter analyze && flutter test`
Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git commit -m "feat: monochrome theme + Inter font"
```

---

### Task 4: Splash screen

**Files:**
- Create or modify: `lib/ui/screens/splash_screen.dart` (if exists) or `lib/main.dart`

- [ ] **Step 1: Locate splash**

Search for splash/launch screen. If none, add a simple splash in `main.dart` showing logo + "OpenFile" for 1.5s.

- [ ] **Step 2: Implement simple splash**

```dart
// In main.dart, before runApp or in a Splash widget:
Scaffold(
  backgroundColor: Colors.black,
  body: Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/ic_launcher.webp', width: 96),
        const SizedBox(height: 16),
        const Text('OpenFile', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    ),
  ),
);
```

- [ ] **Step 3: Run analyze + tests**

Run: `flutter analyze && flutter test`
Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git commit -m "feat: add simple OpenFile splash screen"
```

---

### Task 5: Logo asset replacement

**Files:**
- Replace: `assets/ic_launcher.webp` (monochrome "OF" mark)

- [ ] **Step 1: Generate monochrome OF logo**

Use design tools to create a monochrome "OF" mark. Replace asset file. Update `pubspec.yaml` assets (no change if same filename).

- [ ] **Step 2: Verify asset loads**

Run: `flutter analyze` (asset existence checked at build).

- [ ] **Step 3: Commit**

```bash
git commit -m "chore: replace launcher icon with monochrome OF mark"
```

---

### Task 6: Hardcoded "NFile" strings in UI + guard

**Files:**
- Modify: `lib/ui/**` (any 'NFile' literals)
- Modify: `test/fixtures/hardcoded_strings.json` (allow list)

- [ ] **Step 1: Search for 'NFile' literals**

Run: `grep -rn "NFile" lib/` (or Select-String). Replace user-facing ones with "OpenFile".

- [ ] **Step 2: Update guard allow list**

Remove obsolete entries; ensure no slipped strings.

- [ ] **Step 3: Run guard test**

Run: `flutter test test/no_hardcoded_strings_test.dart`
Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git commit -m "chore: replace NFile literals with OpenFile"
```

---

### Task 7: README + docs

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Update title and description**

Title: "OpenFile", description: "A File Manager (OpenFile)."

- [ ] **Step 2: Commit**

```bash
git commit -m "docs: rebrand README to OpenFile"
```

---

### Task 8: Final verification

- [ ] **Step 1: Full analyze + tests**

Run: `flutter analyze && flutter test`
Expected: 104 tests pass, analyze clean.

- [ ] **Step 2: CI check**

Push branch, open PR, wait for CI green, merge.

- [ ] **Step 3: Rebuild release APK**

Run: `flutter build apk --release` (or use CI). Copy to `D:\ai\wizard\OpenFile-release.apk`.

---

## Execution Handoff

Plan complete and saved. Two execution options:

1. **Subagent-Driven (recommended)** — fresh subagent per task + two-stage review.
2. **Inline Execution** — execute tasks in this session with checkpoints.

Which approach?