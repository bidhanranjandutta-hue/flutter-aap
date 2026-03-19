## 2026-03-19 - [Refactoring Widget Builders]
**Learning:** Refactoring local UI helper methods (like `_buildToolCard` or `_buildFileItem`) that return Widgets into explicit `const StatelessWidget` classes is a recommended Flutter performance practice. It allows the Flutter engine to short-circuit the widget building process and avoid unnecessary rebuilds since the widget tree only reconstructs when inputs change.
**Action:** Always refactor complex UI builder methods into `const StatelessWidget` classes to maximize rendering performance.
