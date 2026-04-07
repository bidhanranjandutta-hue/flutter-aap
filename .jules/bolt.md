## 2024-04-07 - Refactoring Stateful widgets with localized variables

**Learning:** When refactoring local variables from `setState` to `ValueNotifier` for single widgets like `LawMapScreen` and `OCRScannerScreen`, replacing the `int` local variable in `StatefulWidget` directly with a `ValueNotifier` object will optimize the rebuilding tree performance for elements subscribing to changes via `ValueListenableBuilder` because it avoids calling `setState()` which rebuilds the whole page.

**Action:** Look for instances where `setState()` sets variables, especially those limited to UI states that don't involve multiple other logic blocks, to replace with `ValueNotifier` + `ValueListenableBuilder` combination to avoid unnecessary re-renders.
