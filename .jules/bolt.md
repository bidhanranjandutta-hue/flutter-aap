## 2024-02-09 - Extracted Local State to Prevent Full Screen Rebuilds
**Learning:** Toggling localized visual states (like segments or view modes) from a root `StatefulWidget` using `setState` causes the entire large screen widget tree to rebuild unnecessarily, leading to performance bottlenecks.
**Action:** Always extract localized stateful components into their own `StatefulWidget` leaves. Additionally, ensure parent screens are converted to `StatelessWidget` and any helper methods are correctly refactored to accept and explicitly pass `BuildContext` downstream.
