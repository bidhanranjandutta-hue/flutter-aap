## 2024-03-19 - Widget Method Refactoring to StatelessWidget
**Learning:** In Flutter, using local UI helper methods (like `_buildToolCard` or `_buildFileItem`) that return Widgets instead of explicit `StatelessWidget` classes causes the Flutter framework to rebuild the entire screen instead of short-circuiting unchanged sub-trees, leading to unnecessary CPU cycles and dropped frames on complex screens.
**Action:** Always refactor local widget-building methods into dedicated `const StatelessWidget` classes to allow Flutter's element tree to skip redundant rebuilds.
