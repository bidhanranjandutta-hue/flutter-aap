## 2026-06-13 - Route Stack Optimization Memory Leak Prevention
**Learning:** Repeatedly pushing root dashboard routes via pushNamed inside a BottomNavigationBar leads to an unbounded route stack and memory leaks in Flutter applications.
**Action:** Replaced pushNamed with pushNamedAndRemoveUntil when returning to root tabs to prevent unbounded stacks, while preserving back button behavior when navigating to sub-routes.
