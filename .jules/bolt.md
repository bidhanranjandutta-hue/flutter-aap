## 2024-05-24 - Prioritize const StatelessWidget
**Learning:** Flutter UI-building helper methods execute during every parent rebuild. Refactoring them to const StatelessWidget allows the framework to skip the build phase entirely for those sub-trees.
**Action:** Prioritize refactoring static _buildHelper methods into const StatelessWidget classes over attempting to isolate localized state with ValueNotifier for optimizing static mockups in Flutter.
