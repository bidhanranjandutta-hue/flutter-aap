## 2024-05-24 - [Flutter Widget Rebuild Performance]
**Learning:** Refactoring local UI helper methods (like `_buildToolCard` or `_buildFileItem`) that return Widgets into explicit `const StatelessWidget` classes is a crucial Flutter performance practice. It allows the Flutter engine to short-circuit the widget building process and avoid unnecessary rebuilds of large widget trees like the `DashboardScreen`.
**Action:** Consistently extract UI components into discrete, constant widgets rather than returning them from localized helper methods to ensure optimal performance.
