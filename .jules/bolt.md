## 2024-05-24 - Extracted helper methods to const Widgets
**Learning:** In this Flutter codebase, UI is heavily built using private helper methods (like `_buildInfoBox`) inside `StatefulWidget`s. This forces a full subtree rebuild whenever `setState` is called. Extracting these methods into private `StatelessWidget` classes and calling them with `const` allows the framework to skip their build phase entirely.
**Action:** Always prefer `const StatelessWidget` over helper methods (`_buildWidget()`) for rendering static UI components to optimize Flutter's rebuild performance.
