
## 2024-05-24 - TextEditingController initialized in build
**Learning:** Found `TextEditingController` initialized directly inside a `StatefulWidget`'s `build` method. This is a Flutter anti-pattern causing a memory leak and state loss on UI rebuilds, as a new controller is created every time the widget rebuilds.
**Action:** Always initialize disposable controllers (like `TextEditingController`) in `initState` and clean them up in `dispose`.
