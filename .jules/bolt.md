## 2024-05-10 - Flutter TextEditingController Re-render Memory Leak
**Learning:** Instantiating disposable controllers like `TextEditingController` directly inside a `StatefulWidget`'s `build` method causes memory leaks and performance issues, as a new instance is created on every re-render but never disposed.
**Action:** Always instantiate disposable controllers in the `initState` method of a `StatefulWidget` and dispose of them in the `dispose` method.
