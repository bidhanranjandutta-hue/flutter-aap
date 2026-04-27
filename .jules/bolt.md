## 2024-05-18 - Extracted widget rebuilds

**Learning:** Extracted UI building helper methods (e.g. _buildWidget()) to separate classes extending StatelessWidget rather than keeping them in the main view's state object or as helper methods inside the main file.

**Action:** Whenever there are components with static properties, consider creating a stateless widget for them. Also, use constants (const) wherever possible to prevent unnecessary memory allocations, further optimizing the build cycle and overall execution. I refactored the screens in this project to follow this pattern. Also fixed the deprecated method usage of color `withOpacity()` to use `.withValues(alpha:)`.
