## 2024-05-24 - [Fixing TextEditingController state loss in build]
**Learning:** Instantiating `TextEditingController` directly within a widget's `build` method is a performance bottleneck. It leads to the controller being recreated every time the widget rebuilds, causing unnecessary object allocations and losing its state.
**Action:** Always initialize `TextEditingController` inside a `StatefulWidget`'s `initState` and cleanly dispose of it in `dispose` to prevent state loss and memory leaks, preserving UI state correctly.
