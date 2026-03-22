## 2024-03-22 - [Extracting Helper Methods into StatelessWidget]
**Learning:** Refactoring local UI helper methods (like `_buildFileItem` or `_buildToolCard`) that return Widgets into explicit `const StatelessWidget` classes is a recommended Flutter performance practice. It helps the framework's element tree diffing algorithm run more efficiently, better scopes rebuilds, and allows the engine to short-circuit the widget building process.
**Action:** Identify helper methods returning UI elements inside screen classes and extract them into independent `StatelessWidget` classes whenever feasible.

## 2024-03-22 - [Extracting Helper Methods with Maps/Dynamic Properties]
**Learning:** Extracting UI helpers like `_buildToolCard` to `StatelessWidget` might encounter `const` keyword issues when parameters involve dynamic lookups like `Colors.purple[50]!` (which evaluate at runtime). In these cases, dropping the `const` modifier from the instantiation of the widget avoids compilation errors while still giving some structural benefits over closures. Or alternatively, use fully predefined constants like `Color(0xFFF3E5F5)`.
**Action:** Always check parameter types and evaluate whether `const` is truly applicable when converting helper methods into stateless widgets to avoid build breaks.
