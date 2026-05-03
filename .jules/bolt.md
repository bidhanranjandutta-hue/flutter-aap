## 2024-05-24 - [StatelessWidget Refactoring]
**Learning:** Refactoring UI helper methods like `_buildFileItem` into `const StatelessWidget` classes allows the framework to skip rebuilding these sub-trees when the parent rebuilds. This is a common and effective micro-optimization in Flutter.
**Action:** Always refactor UI helper methods into `StatelessWidget` classes and instantiate them with `const` whenever possible to optimize performance.
