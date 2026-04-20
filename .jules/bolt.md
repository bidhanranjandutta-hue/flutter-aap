## 2024-05-24 - [Optimize Flutter UI Rebuilds]
**Learning:** UI-building helper methods (e.g., `_buildLawCard`) execute during every parent rebuild.
**Action:** Refactored these methods into dedicated private `StatelessWidget` classes and instantiated them with the `const` keyword to allow the Flutter framework to completely skip the build phase for these sub-trees when the parent rebuilds.
