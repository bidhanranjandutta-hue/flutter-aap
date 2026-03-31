## 2024-05-18 - Isolate Segmented Control Rebuilds
**Learning:** In complex Flutter screens, using `setState` for small state changes (like segmented controls) causes massive unnecessary rebuilds of static and unrelated widgets. But isolating state inside the leaf widget breaks functional data flow preventing parent screen from updating content.
**Action:** Use `ValueNotifier` and `ValueListenableBuilder` instead of `setState`. Ensure *all* parts of the UI that depend on the state (e.g. main content views, not just toggle buttons) are wrapped in `ValueListenableBuilder` otherwise UI will fail to update.

## 2024-05-18 - Extract Static UI Helpers into Const Widgets
**Learning:** In Flutter, heavy UI helper methods (like `_buildLawCard`) that return Widgets get completely re-executed every time the parent widget calls `setState`, wasting CPU cycles calculating diffs for static content.
**Action:** Extract these methods into explicit `const StatelessWidget` classes and instantiate them with the `const` keyword. This allows Flutter's element tree diffing engine to completely short-circuit the build process for these subtrees.
