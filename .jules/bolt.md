
## 2024-05-20 - [Optimize Static Helpers]
**Learning:** In Flutter, using helper methods like `_buildSummaryItem` to return widgets causes those subtrees to rebuild fully when the parent widget rebuilds.
**Action:** Always refactor these heavy static UI builder methods into `const StatelessWidget` classes. This allows the Flutter framework to short-circuit the build process, preventing unnecessary deep subtree recalculations and saving memory.
