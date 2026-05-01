
## 2024-05-18 - Avoid Inline Controllers in `build`
**Learning:** Instantiating disposable controllers like `TextEditingController` inside a `StatefulWidget`'s `build` method is a critical anti-pattern in Flutter. Since `StatelessWidget` and `build` methods have no lifecycle hooks for teardown, this causes memory leaks (the controller is never disposed) and silent state loss on parent rebuilds.
**Action:** Always manage disposable controllers as properties of a `StatefulWidget` using `initState` to create them and `dispose` to clean them up.
