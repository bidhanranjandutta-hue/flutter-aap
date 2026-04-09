## 2024-05-24 - Initial Setup
**Learning:** Initializing Bolt journal.
**Action:** Always maintain the journal.

## 2024-05-24 - Flutter Const Constructors
**Learning:** Refactoring UI-building helper methods into `const StatelessWidget` classes allows the framework to skip their sub-tree during parent rebuilds, providing a significant performance optimization for static content mixed with local state updates.
**Action:** Always identify UI helper methods in `StatefulWidget` classes and extract them to `StatelessWidget` with `const` constructors where possible.
