## 2024-06-25 - Flutter Controller Lifecycle Optimization
**Learning:** Instantiating disposable controllers (like `TextEditingController` or `TabController`) directly inside a `StatefulWidget`'s `build` method is an anti-pattern. Because `build` is called on every state change, it allocates new controllers continuously without disposing the old ones, leading to memory leaks and UI state resets (e.g., losing typed text).
**Action:** Always initialize such controllers in `initState` and rigorously release their resources by calling `.dispose()` inside the widget's `dispose` lifecycle method.
