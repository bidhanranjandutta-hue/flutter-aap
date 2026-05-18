## 2024-05-18 - Flutter TextEditingController Memory Leak
**Learning:** Instantiating disposable controllers (like `TextEditingController`) directly inside a `StatefulWidget`'s `build` method is a severe anti-pattern in Flutter. It causes memory leaks and destroys state (resets text) on every UI rebuild.
**Action:** Always initialize such controllers in `initState` as instance variables, and clean them up using `dispose()`.
