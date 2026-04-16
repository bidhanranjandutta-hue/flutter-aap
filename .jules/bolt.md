## 2024-04-16 - [const StatelessWidget optimization]
**Learning:** In Flutter, helper methods that return widgets (like `_buildFeatureItem`) are re-executed during every parent rebuild. Refactoring them into dedicated `const StatelessWidget` classes allows the framework to skip their build phase entirely, improving performance.
**Action:** Identify static UI helper methods and extract them into `const StatelessWidget` components, ensuring all call sites use the `const` keyword.
