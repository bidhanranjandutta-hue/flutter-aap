## 2024-04-13 - [Isolate State in Leaf Widgets]
**Learning:** When replacing `setState` with `ValueNotifier` to optimize rebuilds in Flutter, you must wrap all widgets that reference the state variable in `ValueListenableBuilder` and use `.value` for updates/reads, avoiding full screen rebuilds.
**Action:** Isolate the reactive state explicitly by converting primitive `setState` calls to `ValueNotifier` controllers, and target rebuilds precisely with `ValueListenableBuilder`.
