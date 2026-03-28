
## 2024-03-28 - [State Extraction vs Localized Rebuilds]
**Learning:** Pushing state down entirely into a new child widget is dangerous if that state is intended to control broader UI logic that technically resides in the parent (e.g., a toggle switch controlling a document preview area). Even if the UI hasn't fully implemented the dependency yet, extracting it breaks the logical relationship and leads to compilation errors.
**Action:** When a parent widget needs to hold state but you want to avoid full screen rebuilds, use `ValueNotifier` and `ValueListenableBuilder` instead of `setState`. This allows the parent to manage the state lifecycle without rebuilding itself, while only the specific widgets wrapped in the builder rebuild when the value changes.
