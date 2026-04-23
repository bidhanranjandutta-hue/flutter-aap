## 2024-04-23 - [Flutter Rebuild Optimization]
**Learning:** The NyayaAssist codebase frequently uses helper methods returning Widgets (like `_buildLawCard`) which causes unnecessary rebuilding of static UI elements during parent state changes.
**Action:** Extract static UI helper methods into `const StatelessWidget` classes to allow Flutter to skip their rebuilding phase.
