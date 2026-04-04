## 2024-04-04 - Optimize Local State Rebuilds with ValueNotifier
**Learning:** In Flutter, managing local ephemeral state (like a selected tab index or segmented control) at the root of a large screen widget using `setState` causes the entire screen to rebuild.
**Action:** When refactoring Flutter state from `setState` to `ValueNotifier`, always implement an `override void dispose()` method in the `StatefulWidget` to call `.dispose()` on the `ValueNotifier` instances, preventing memory leaks. Wrap only the dependent widgets in `ValueListenableBuilder`.
