## Bolt Journal
## 2024-05-20 - Flutter Widget Sub-Tree Optimization
**Learning:** In Flutter, using state-toggled UI segments with complex inline helper methods (e.g., `_buildLawCard`) forces expensive rebuilds of static sub-trees.
**Action:** Extract static UI helpers into `const StatelessWidget` classes. This allows the Flutter engine to completely skip the build phase for those sub-trees when the parent toggles state.
