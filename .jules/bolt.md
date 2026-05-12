## 2024-05-12 - Prevent Memory Leaks in Stateful Widgets
**Learning:** Instantiating disposable controllers (like `TextEditingController`) directly inside a `StatefulWidget`'s `build` method is a critical performance anti-pattern. It causes unnecessary memory allocations on every UI rebuild, leading to memory leaks and loss of user input/focus state during hot reloads or state changes.
**Action:** Always initialize disposable controllers in `initState()`, use `late final` to ensure single initialization, and clean them up properly in the `dispose()` method.
