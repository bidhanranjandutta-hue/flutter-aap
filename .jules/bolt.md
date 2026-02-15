## 2026-02-17 - Environment SDK Mismatch Blocking Verification
**Learning:** The development environment uses Dart 3.10.7, but the project requires Dart ^3.11.0. This prevents running `flutter pub get` and tests without modification.
**Action:** Temporarily downgraded `pubspec.yaml` to run tests/analysis, then reverted before submit to maintain project requirements.
