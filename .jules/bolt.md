## 2023-10-27 - Stateless Controllers in Build Methods
**Learning:** Found `TextEditingController` being instantiated inside `build()` method of a `StatefulWidget`. This causes the controller to be recreated on every rebuild, resetting text state and causing memory leaks (no dispose).
**Action:** Always verify if controllers are created in `build` when auditing stateful widgets. Move them to `initState` and `dispose`.
