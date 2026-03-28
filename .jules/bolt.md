## 2024-05-24 - [Flutter Migration] Replace deprecated Color.withOpacity with Color.withValues
**Learning:** In modern Flutter (Dart 3+), `Color.withOpacity()` is deprecated because it causes precision loss. Instead, use `.withValues(alpha: ...)`. This is heavily flagged by `flutter analyze`.
**Action:** Always replace `withOpacity(x)` with `withValues(alpha: x)` in Flutter apps to ensure compliance and avoid analyzer warnings.

## 2024-05-24 - [Performance] Extract helper widget methods to StatelessWidgets
**Learning:** Refactoring local UI helper methods (like `_buildToolCard` or `_buildLawCard` or `_buildFileItem`) that return Widgets into explicit `const StatelessWidget` classes is a recommended Flutter performance practice. It helps the framework's element tree diffing algorithm run more efficiently, better scopes rebuilds, and allows the engine to short-circuit the widget building process.
**Action:** When working on Flutter apps, extract complex `_buildX` methods returning widgets into `const StatelessWidget`s.
