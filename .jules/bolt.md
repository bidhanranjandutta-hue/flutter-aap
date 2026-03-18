## 2024-05-24 - [Flutter Widget Performance Optimization]
**Learning:** Refactoring local UI helper methods (like `_buildToolCard`, `_buildFileItem`) that return Widgets into explicit `const StatelessWidget` classes is a recommended Flutter performance practice. It allows the Flutter engine to short-circuit the widget building process and avoid unnecessary rebuilds, which is critical for complex screens like `DashboardScreen`.
**Action:** Convert UI helper methods to `const StatelessWidget` in `DashboardScreen` and other heavily used screens to optimize the widget tree rebuild process.
