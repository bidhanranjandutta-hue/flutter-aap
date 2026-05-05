## 2024-05-05 - Setup bolt journal
**Learning:** Initializing the journal for tracking critical learnings about architecture and performance.
**Action:** Always read this file before starting and append critical learnings.
## 2024-05-05 - Avoid Instantiating Controllers in Build Methods
**Learning:** Instantiating disposable controllers (like `TextEditingController`) directly inside a `StatefulWidget`'s `build` method causes memory leaks and state loss on UI rebuilds. The framework does not clean these up automatically.
**Action:** Always initialize controllers in `initState` and explicitly clean them up in `dispose()`.
