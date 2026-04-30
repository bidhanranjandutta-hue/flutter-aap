## 2024-05-24 - Initial Entry
**Learning:** Initializing Bolt journal.
**Action:** Ready to record critical learnings.

## 2024-05-24 - TextEditingController instantiation in build()
**Learning:** In Flutter, instantiating disposable controllers like `TextEditingController` directly inside a `StatefulWidget`'s `build` method is a critical anti-pattern. It causes the controller to be re-allocated on every UI rebuild, leading to state loss (e.g., losing text input or cursor position) and causing memory leaks since `dispose()` is never called on the orphaned instances.
**Action:** Always verify that stateful controllers are instantiated within `initState` (or managed via a persistent state container) and properly cleaned up in the `dispose` method.
