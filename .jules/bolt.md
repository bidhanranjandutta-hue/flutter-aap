
## 2024-05-24 - [Isolating Local State in Mock Flutter UI]
**Learning:** Trapping isolated UI state (e.g. `_viewMode`) in leaf widgets breaks data flow, but keeping it in the parent `StatefulWidget` using `setState` causes the entire mock screen (including heavy static sub-trees) to needlessly rebuild.
**Action:** Convert ephemeral parent state to `ValueNotifier`, wrap only the interactive controls and their dependent views in `ValueListenableBuilder`, and extract static `_buildHelper` methods into `const StatelessWidget` classes to allow Flutter to skip rebuilding them.
