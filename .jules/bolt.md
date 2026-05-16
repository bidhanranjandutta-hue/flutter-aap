## 2024-05-16 - [TextEditingController inside build method]
**Learning:** Instantiating `TextEditingController` directly within a Flutter widget's `build` method is a severe anti-pattern. This causes a new controller to be allocated every time the widget rebuilds (e.g., during UI state changes), leading to memory leaks and loss of text input state.
**Action:** Always extract such disposable controllers to class members, initialize them in `initState`, and clean them up in `dispose`.
