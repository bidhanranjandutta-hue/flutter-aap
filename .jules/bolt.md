## 2024-05-30 - Prevent Memory Leaks from Controllers in build()
**Learning:** Instantiating disposable controllers (like `TextEditingController`) directly inside a `StatefulWidget`'s `build` method is an anti-pattern that causes memory leaks and state loss on UI rebuilds.
**Action:** Always initialize controllers in `initState` and clean them up in `dispose`.