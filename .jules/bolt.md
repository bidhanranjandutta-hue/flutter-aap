
## 2024-05-24 - TextEditingController instantiation
**Learning:** Found a common Flutter performance anti-pattern where a `TextEditingController` was being instantiated directly inside the `build` method. This allocates a new controller on every UI rebuild, causing potential memory leaks and losing cursor/selection state.
**Action:** Extract disposable object instantiations from the `build` method to `initState` and clean them up properly in `dispose` to save memory.
