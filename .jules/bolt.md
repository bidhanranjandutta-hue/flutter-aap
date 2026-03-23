## 2024-03-20 - Fix Deprecated withOpacity
**Learning:** The Flutter codebase uses the deprecated `.withOpacity()` method on `Color` objects, which triggers warnings. This should be replaced with `.withValues(alpha: ...)`.
**Action:** Replaced `.withOpacity()` with `.withValues(alpha: ...)`.

## 2024-03-20 - Extract Local Builder Methods to Statutory Classes
**Learning:** Local widget builder methods (e.g., `_buildToolCard`, `_buildFileItem` in `DashboardScreen`, `_buildFeatureItem` in `WelcomeScreen`, `_buildLawCard` in `LawMapScreen`) are a known performance anti-pattern in Flutter. They bypass the widget framework's diffing/short-circuiting mechanisms because they aren't explicit `StatelessWidget`s with `const` constructors.
**Action:** Refactor local `_build*` methods into `const StatelessWidget` classes to improve widget rebuilding performance.
