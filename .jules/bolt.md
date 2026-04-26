
## 2024-05-20 - [Optimizing Static UIs]
**Learning:** In Flutter, UI-building helper methods execute during every parent rebuild. To optimize performance on screens with static mockups, refactoring these methods into dedicated private `StatelessWidget` classes and instantiating them with `const` allows the framework to completely skip the build phase for those sub-trees.
**Action:** Prioritize extracting static `_buildHelper` methods into `const StatelessWidget` classes over attempting to isolate localized state with `ValueNotifier` on predominantly static screens.
