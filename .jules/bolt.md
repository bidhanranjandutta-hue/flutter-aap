## 2024-03-17 - Refactoring UI Helper Methods
**Learning:** Refactoring local UI helper methods (like `_buildToolCard` or `_buildFileItem`) that return Widgets into explicit `const StatelessWidget` classes is a key Flutter performance practice. This allows the Flutter engine to short-circuit the widget building process and avoid unnecessary rebuilds.
**Action:** Always favor creating explicit `StatelessWidget` classes over helper methods returning Widgets when building UI components in Flutter.
