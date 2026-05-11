## 2024-05-11 - [Optimize TextEditingController memory leak]
**Learning:** Instantiating disposable controllers (like `TextEditingController`) directly inside a `StatefulWidget`'s `build` method is a performance anti-pattern that causes memory leaks, unnecessary allocations, and state loss on UI rebuilds.
**Action:** Always initialize such controllers in `initState` and clean them up in `dispose` to optimize memory usage and avoid redundant object creation during frequent rebuilds.
