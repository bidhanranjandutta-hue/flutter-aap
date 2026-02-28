
## 2025-02-28 - Flutter Widget Extraction Optimization
**Learning:** Extracting complex helper methods that return widgets (like `_buildActionButton` in `ocr_scanner_screen.dart`) into `const` `StatelessWidget` classes prevents those widgets from being unnecessarily rebuilt every time the parent widget calls `setState`. Using `const` in Flutter allows the framework to reuse the widget instance, noticeably improving rendering performance, especially in screens with frequent state updates (e.g. toggling views or text input).
**Action:** Always favor `const` `StatelessWidget` over helper methods (`Widget _buildSomething(...)`) for UI components that don't depend on local, mutable state, enabling efficient widget reuse during parent rebuilds.
