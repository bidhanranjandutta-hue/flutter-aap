## 2025-05-18 - [Avoid full screen rebuilds on localized state changes]
**Learning:** Managing localized UI state (like `_viewMode` in `OCRScannerScreen` or `_selectedSegment` in `LawMapScreen`) at the root of a large screen widget using `setState` causes the entire screen to rebuild.
**Action:** Extract the localized UI component (e.g., the segment toggle and its immediate dependencies) into its own `StatefulWidget` to isolate rebuilds to just the affected node, or use `ValueNotifier` + `ValueListenableBuilder`.
