## 2024-04-02 - Optimize state rebuilds for large screens
**Learning:** Managing localized ephemeral state (like simple toggles or segmented controls) at the root of massive, heterogeneous screen widgets in Flutter using `setState` causes severe performance regressions by needlessly tearing down and rebuilding complex static sub-trees.
**Action:** Isolate ephemeral state for local UI components (toggles, tabs, segments) using `ValueNotifier` and `ValueListenableBuilder` to restrict rebuilds to just the interactive elements, preventing costly full-screen renders.
