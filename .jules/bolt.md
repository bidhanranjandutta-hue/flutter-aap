## 2024-05-24 - Flutter Build Method Refactoring
**Learning:** In Flutter, UI-building helper methods (e.g., `_buildFeatureItem()`) execute during every parent rebuild. Refactoring these methods into dedicated private `StatelessWidget` classes and instantiating them with the `const` keyword allows the Flutter framework to completely skip the build phase for these sub-trees when the parent rebuilds. This is a crucial performance optimization for complex UIs.
**Action:** Extract UI helper methods into `StatelessWidget` classes and use `const` constructors where possible.
