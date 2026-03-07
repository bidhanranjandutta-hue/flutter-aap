## 2024-03-07 - [Instantiating Controllers in Build Methods]
**Learning:** [Instantiating objects like `TextEditingController` directly within a `build` method in Flutter is a severe anti-pattern that leads to complete state loss on every rebuild and significant memory leaks, as these objects are never properly disposed.]
**Action:** [Always manage stateful controllers by initializing them in `initState` and cleaning them up in `dispose` within a `StatefulWidget`'s lifecycle.]
