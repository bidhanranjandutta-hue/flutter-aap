## 2024-05-19 - Avoid Inline Disposable Controllers in Build Method
**Learning:** Instantiating disposable controllers (like `TextEditingController`) directly inside a `StatefulWidget`'s `build` method causes memory leaks and state loss on UI rebuilds, as a new controller is created every time the widget renders.
**Action:** Always initialize disposable controllers in `initState` and clean them up in `dispose` to ensure memory safety and maintain state across rebuilds.
