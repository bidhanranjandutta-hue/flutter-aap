## 2025-02-14 - Controller Memory Leak
**Learning:** Instantiating disposable controllers (like `TextEditingController`) directly inside a `StatefulWidget`'s `build` method is an anti-pattern that causes memory leaks and state loss on UI rebuilds.
**Action:** Always initialize them in `initState` and clean them up in `dispose`.
