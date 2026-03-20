## 2024-05-24 - [Flutter Render Performance]
**Learning:** Refactoring local UI helper methods (like `_buildToolCard` or `_buildFileItem`) that return Widgets into explicit `const StatelessWidget` classes is a recommended Flutter performance practice. It allows the Flutter engine to short-circuit the widget building process and avoid unnecessary rebuilds.
**Action:** Always prefer creating explicit `StatelessWidget` classes for reusable UI components instead of local helper methods in the `build` method.
