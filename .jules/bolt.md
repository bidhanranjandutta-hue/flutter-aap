## 2024-04-15 - Widget Rebuild Performance

**Learning:** Extracting helper methods like `_buildLawHeader` and `_buildLawCard` into `const StatelessWidget` classes allows the Flutter framework to skip rebuilding these sub-trees when parent states (like `_selectedSegment` toggle) change, significantly optimizing UI rendering performance.

**Action:** Whenever a widget has pure UI-building helper methods, refactor them into dedicated `StatelessWidget` classes and instantiate them with `const` to avoid unnecessary rebuilds during `setState` calls.
