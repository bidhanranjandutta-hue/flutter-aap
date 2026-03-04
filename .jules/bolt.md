## 2024-05-18 - Extract helper methods to const StatelessWidget
**Learning:** Extracting UI helper methods (like `_buildInfoBox`) into `const StatelessWidget` classes prevents unnecessary subtree rebuilds and improves rendering performance during `setState` calls.
**Action:** Always prefer creating `const StatelessWidget` classes over helper methods returning `Widget` for UI components that don't depend on volatile parent state, allowing the Flutter framework to cache and reuse the elements efficiently.
