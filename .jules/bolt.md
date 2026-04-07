## 2024-10-24 - [Avoid `setState` for localized toggles on heavy static screens]
**Learning:** In Flutter, managing a simple local ephemeral state (like a selected tab index or segment index) at the root of a large screen widget using `setState` is a significant anti-pattern. However, encapsulating the state purely in the leaf toggle widget breaks the functional data flow.
**Action:** Expose the state via callbacks or a parent-managed `ValueNotifier` wrapping BOTH the toggle and its dependent content. If the screen is mostly static mockup, prioritize refactoring static `_buildHelper` methods to `const StatelessWidget` instead to optimize build times without risking state regression.

## 2024-10-24 - [Extract static helper methods to `const StatelessWidget`]
**Learning:** Returning widgets from helper methods (e.g., `_buildLawCard()`) causes them to execute entirely during every parent rebuild.
**Action:** Extract these methods into dedicated private `StatelessWidget` classes and instantiate them with `const`. This allows the Flutter framework to completely skip the build phase for these sub-trees when the parent rebuilds.
