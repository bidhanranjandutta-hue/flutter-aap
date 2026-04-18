
## 2024-05-24 - Static UI Builders Rebuild Traps
**Learning:** Extracting complex static UI builder methods (`_buildLawCard`, etc.) into `const StatelessWidget` classes is a necessary structural change, not just a micro-optimization. The previous pattern trapped deep static trees within `_LawMapScreenState`, forcing full re-evaluation of styling, containers, and rich texts every time trivial local state (e.g. segment toggles) triggered a rebuild.
**Action:** When auditing StatefulWidget rebuild performance, always search for heavily nested local helper methods starting with `_build...` that only take context and literal arguments. Refactor these into `const StatelessWidget` classes to allow the Flutter framework to short-circuit the build phase for these subtrees.
