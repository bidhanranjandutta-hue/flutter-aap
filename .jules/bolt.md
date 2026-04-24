
## 2024-05-24 - [Flutter UI Builder Method Optimization]
**Learning:** Helper UI methods (e.g., `_buildLawCard()`) execute on every parent rebuild. In mostly static or simple stateful mockups like `LawMapScreen` where a toggle state changes, entire widget subtrees are needlessly re-evaluated.
**Action:** Extract these helper builder methods into dedicated `const StatelessWidget` classes. Doing so allows the Flutter framework to shortcut the build process for those subtrees entirely when the parent `StatefulWidget` rebuilds, preventing unnecessary re-renders.
