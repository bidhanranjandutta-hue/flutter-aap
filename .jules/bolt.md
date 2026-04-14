## 2024-04-14 - Refactoring UI-building helper methods
**Learning:** In Flutter, UI-building helper methods (e.g., `_buildWidget()`) execute during every parent rebuild. The `OCRScannerScreen` file widely uses methods like `_buildActionButton` for components which causes unnecessary sub-tree rebuilds during state changes (`_viewMode`).
**Action:** Refactor these methods into dedicated private `StatelessWidget` classes and instantiate them with the `const` keyword to optimize build times and completely skip the build phase for these sub-trees when the parent rebuilds.
