
## 2024-05-28 - [Performance] Extract _buildLegalCard to const StatelessWidget
**Learning:** In Flutter, using helper methods like `_buildLegalCard` inside a `State` or `StatelessWidget` causes the returned widgets to be rebuilt every time the parent builds, regardless of whether their inputs changed. Extracting these methods into `const StatelessWidget` classes allows Flutter's element tree to short-circuit the rebuild process entirely if the widget's properties haven't changed, significantly reducing CPU usage and memory allocations.
**Action:** Consistently refactor UI helper methods into private `const StatelessWidget` classes within the same file to keep the project clean and optimize widget rebuilds without introducing unrequested visual changes.
