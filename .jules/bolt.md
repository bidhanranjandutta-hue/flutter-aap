## 2024-05-06 - Avoid instantiating controllers inside build()
**Learning:** Instantiating disposable controllers like `TextEditingController` directly inside a `StatefulWidget`'s `build` method creates a new instance on every rebuild (like `setState`), leading to memory leaks and wiping user input state.
**Action:** Always initialize them in `initState` as a class variable and clean them up in `dispose`.
