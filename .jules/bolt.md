## 2024-05-17 - [Flutter Memory Leak Prevention]
**Learning:** Instantiating disposable controllers (like `TextEditingController`) directly inside a `StatefulWidget`'s `build` method is a performance anti-pattern that causes memory leaks and state loss on UI rebuilds, specifically observed in `LawMapScreen`.
**Action:** Always initialize such controllers in `initState` and clean them up in `dispose` to prevent memory leaks and ensure the widget tree remains performant.
