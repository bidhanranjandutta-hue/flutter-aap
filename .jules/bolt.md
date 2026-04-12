
## 2024-05-18 - Extracting Static UI Helpers
**Learning:** In Flutter, UI-building helper methods (e.g., `_buildWidget()`) execute during every parent rebuild. For heavily static screens with complex UI, this unnecessarily blocks the main thread.
**Action:** Always refactor complex static `_buildHelper` methods into dedicated private `StatelessWidget` classes and instantiate them with the `const` keyword so the Flutter framework can completely skip the build phase for these sub-trees when the parent rebuilds.
