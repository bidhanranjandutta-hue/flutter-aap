## 2024-05-18 - Avoid Anti-Patterns

**Learning:** Initializing `TextEditingController` inside `build()` is an anti-pattern. Every time the widget rebuilds, a new controller is created causing state loss and memory leaks.
**Action:** Always initialize such controllers in `initState()` and dispose of them in `dispose()`.
