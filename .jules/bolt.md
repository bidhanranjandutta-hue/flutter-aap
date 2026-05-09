## 2024-05-09 - [Prevent Memory Leaks with Controllers]
**Learning:** Instantiating disposable controllers like `TextEditingController` directly inside a `StatefulWidget`'s `build` method causes memory leaks and loses state on every UI rebuild.
**Action:** Always extract controllers to instance variables, initialize them in `initState`, and clean them up in `dispose`.
