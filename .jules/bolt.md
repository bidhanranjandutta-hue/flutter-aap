## 2024-03-17 - [Refactor UI Helpers to const StatelessWidget]
**Learning:** Refactoring local UI helper methods (like `_buildToolCard` or `_buildFileItem`) that return Widgets into explicit `const StatelessWidget` classes is a recommended Flutter performance practice, allowing the Flutter engine to short-circuit the widget building process and avoid unnecessary rebuilds. This is a structural optimization over micro-optimizations like constant radii.
**Action:** When working on Flutter performance, avoid methods returning Widgets. Instead, use pure `const StatelessWidget` implementations.
