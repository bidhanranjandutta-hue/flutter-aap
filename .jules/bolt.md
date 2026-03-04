
## 2024-05-28 - [Performance] Extract helper methods to StatelessWidgets
**Learning:** Extracting UI helper methods (like `_buildToggleOption`) into dedicated `const StatelessWidget` classes reduces unnecessary parent widget rebuilds. By making smaller widget components, Flutter's element tree can more efficiently cache and diff elements rather than re-evaluating the entire parent widget tree inside massive `build` methods.
**Action:** Default to creating private `const StatelessWidget` classes within the same file for localized UI components instead of using private helper methods returning `Widget`.
