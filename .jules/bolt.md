## 2024-05-18 - Isolate Rebuilds with ValueNotifier
**Learning:** Using `setState` for simple toggles at the root of a large screen widget causes the entire screen to rebuild unnecessarily.
**Action:** Use `ValueNotifier` and `ValueListenableBuilder` to scope rebuilds only to the toggle UI itself.
