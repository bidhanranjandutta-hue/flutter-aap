## 2024-06-12 - Flutter Route Memory Leak Anti-Pattern
**Learning:** Found a critical anti-pattern in the bottom navigation and welcome screens. `Navigator.pushNamed` was being repeatedly used to navigate to root tabs (like `/dashbord`), which creates an unbounded route stack leading to severe memory leaks in Flutter applications, especially with heavy widgets like map integrations.
**Action:** Always verify bottom navigation items and root-level authentications map back to the root level using `pushNamedAndRemoveUntil` instead of simple `pushNamed` to prevent exponential route stacking.
