
## 2024-05-18 - [Flutter Widget Tree Optimization]
**Learning:** Extracting static UI-building helper methods (e.g. `_buildLawCard()`) from `State` classes into standalone `const StatelessWidget` classes safely optimizes rebuilds. This is particularly valuable for heavily static UI components (like law text mockups), because it allows the Flutter framework to completely short-circuit and skip their rebuild phase when the parent rebuilds (such as when toggling a segmented control).
**Action:** When isolating state to `ValueNotifier` is complex or involves deeply nested conditional UI, prioritize extracting large static block helper methods into `const StatelessWidget` to reduce the widget tree build depth and CPU overhead safely.
