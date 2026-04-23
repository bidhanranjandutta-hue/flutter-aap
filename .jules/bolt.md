## 2024-05-24 - Flutter UI Helper Rebuilds
**Learning:** In the `LawMapScreen`, complex static UI subtrees (like `_buildLawCard` and `_buildLawHeader`) are implemented as helper methods. This causes them to needlessly rebuild whenever local state (like `_selectedSegment`) changes, degrading performance.
**Action:** Always refactor static UI-building helper methods into `const StatelessWidget` classes. This ensures the Flutter framework can cache the widgets and skip rebuilding them when the parent rebuilds.
