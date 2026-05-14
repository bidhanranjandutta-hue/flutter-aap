
## 2024-05-14 - Fix TextEditingController Memory Leak
**Learning:** Instantiating disposable controllers like `TextEditingController` directly inside a `StatefulWidget`'s `build` method causes memory leaks and loses state on every UI rebuild.
**Action:** Always initialize disposable controllers in `initState` and clean them up in `dispose`.
