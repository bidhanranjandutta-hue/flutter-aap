## 2024-05-14 - Isolate Stateful Controls in Flutter
**Learning:** Managing simple local ephemeral state (like tab/segment/toggle index) at the root level of a large layout screen via `setState` incorrectly forces a total rebuild of the entire complex screen, severely degrading performance.
**Action:** Always extract isolated UI controls (like `_ViewToggle` or `_SegmentedControl`) into their own tiny `StatefulWidget` or `StatelessWidget` with a `ValueNotifier` to confine rebuilds strictly to the leaf widget needing the update.
