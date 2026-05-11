# Bolt's Journal


## 2025-05-11 - TextEditingController Instantiation Anti-Pattern
**Learning:** Creating disposable objects like `TextEditingController` directly within a widget's `build` method in Flutter is a severe anti-pattern. Because `build` is called repeatedly throughout the lifecycle, this causes new instances of the controller to be generated on every single UI rebuild without proper disposal of the old ones. This not only resets and loses the user's input state but also creates an unbound memory leak as the obsolete controller instances persist.
**Action:** Always instantiate disposable resources like `TextEditingController`, `AnimationController`, or `ScrollController` exclusively within `initState`, and reliably clean them up within the `dispose` lifecycle method.
