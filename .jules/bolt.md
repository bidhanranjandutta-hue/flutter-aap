## 2024-05-18 - [Flutter Memory Leak Prevention]
**Learning:** Instantiating disposable controllers (like `TextEditingController`) directly inside a `StatefulWidget`'s `build` method or widget tree without proper initialization and disposal causes memory leaks and state loss on UI rebuilds.
**Action:** Always initialize such controllers in `initState` and clean them up using `dispose()` within the `StatefulWidget`.
