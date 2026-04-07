## 2025-04-07 - Localized UI state rebuild optimization failure
**Learning:** Replacing `setState` with `ValueNotifier` to isolate a toggle control's rebuild fails if the toggle's state actually dictates the main content of the screen (e.g. view modes). Wrapping only the toggle breaks the functional data flow.
**Action:** When state controls conditional views, both the toggle control AND the dependent content must be wrapped in `ValueListenableBuilder`. If this leads to wrapping massive static UI blocks and reducing code readability, avoid the optimization or extract the toggle and its content into a separate `StatefulWidget`.

## 2025-04-07 - Refactor helper methods to const StatelessWidgets
**Learning:** UI-building helper methods (e.g. `_buildToolCard()`) execute during every parent rebuild, which is inefficient for large lists or complex static UI components.
**Action:** Refactor these helper methods into dedicated private `StatelessWidget` classes and instantiate them with the `const` keyword. This allows the Flutter framework to completely skip the build phase for these sub-trees when the parent rebuilds.
