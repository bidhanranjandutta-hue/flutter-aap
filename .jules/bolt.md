## 2024-05-24 - Extracting Ephemeral State from Large Screens
**Learning:** In Flutter, using `setState` to update localized ephemeral state (like a segment control index or view toggle mode) at the root of a large, complex screen widget (e.g., `LawMapScreen`, `OCRScannerScreen`) triggers a rebuild of the entire widget tree. This is highly inefficient and causes unnecessary element diffing.
**Action:** Always extract the localized interactive component (e.g., `_SegmentControl`, `_ViewToggle`) into its own isolated `const StatefulWidget`. This confines the `setState` rebuilds strictly to the component that actually changes, avoiding expensive re-renders of the surrounding static UI.

## 2024-05-24 - Modernizing Color Opacity in Flutter 3.27+
**Learning:** `Color.withOpacity()` is deprecated in newer Flutter versions due to precision loss in non-sRGB color spaces. Leaving these in the codebase generates numerous analyzer warnings.
**Action:** Use `.withValues(alpha: ...)` instead to ensure accurate color rendering and a clean, warning-free codebase.
