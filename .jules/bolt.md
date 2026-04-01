## 2024-05-24 - [Flutter Local State Optimization]
**Learning:** Managing localized UI state (like a selected tab or view mode toggle) at the root of a large screen widget using `setState` causes the entire screen to rebuild. While extracting it into a separate `StatefulWidget` works, a simpler optimization is using `ValueNotifier` and wrapping only the dependent widgets in a `ValueListenableBuilder`.
**Action:** Use `ValueNotifier` and `ValueListenableBuilder` instead of `setState` for isolated control components in large Flutter screens to avoid expensive whole-screen rebuilds.
