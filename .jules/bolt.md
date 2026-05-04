## 2024-05-04 - [Flutter Controller Optimization]
**Learning:** Instantiating disposable controllers directly inside a `StatefulWidget`'s `build` method creates a memory leak and forces unnecessary object allocation on every frame re-render.
**Action:** Always extract disposable controllers (like `TextEditingController`) into `initState` and clean them up in `dispose` to optimize memory allocation.
