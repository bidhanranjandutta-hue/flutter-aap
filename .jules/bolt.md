## 2024-05-24 - TextEditingController inside build method
**Learning:** Instantiating disposable controllers like `TextEditingController` directly inside a `StatefulWidget`'s `build` method is an anti-pattern. Because the widget rebuilds on state changes (e.g., `setState` triggered by UI interactions), the controller gets re-instantiated, leading to memory leaks and immediate loss of any typed text.
**Action:** Always initialize such controllers in `initState` and clean them up by calling `dispose()` in the `dispose` lifecycle method.
