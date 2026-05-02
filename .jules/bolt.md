## 2026-05-02 - Extracting UI helper methods to const StatelessWidget in Flutter
**Learning:** In Flutter, UI-building helper methods execute during every parent rebuild. To optimize performance, refactoring these methods into dedicated private StatelessWidget classes and instantiating them with the const keyword allows the framework to skip the build phase for these sub-trees.
**Action:** Always refactor UI helper methods into const StatelessWidget classes and explicitly remove the BuildContext argument if they don't require non-constant parameters.
