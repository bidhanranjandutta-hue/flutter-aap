
## 2024-05-18 - TextEditingController Rebuild Overhead
**Learning:** Instantiating disposable controllers like `TextEditingController` directly inside a `StatefulWidget`'s `build` method is a Flutter anti-pattern. It causes a new instance to be created on every UI rebuild, leading to potential memory leaks, state/input loss, and unnecessary garbage collection overhead.
**Action:** Always extract such controller initializations to the `initState` method and ensure proper cleanup in the `dispose` method.
