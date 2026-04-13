## 2024-05-18 - [Flutter Stateless Widget Optimization]
**Learning:** In Flutter, UI-building helper methods (e.g., `_buildWidget()`) execute during every parent rebuild. To optimize performance, refactor these methods into dedicated private `StatelessWidget` classes and instantiate them with the `const` keyword. This allows the Flutter framework to completely skip the build phase for these sub-trees when the parent rebuilds.
**Action:** When working on Flutter applications with large static components, extract `_build` helper methods into `const StatelessWidget` classes.
