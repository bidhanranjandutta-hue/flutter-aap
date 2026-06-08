## 2026-06-08 - Unbounded Navigation Stack Leak
**Learning:** The Flutter application used `Navigator.pushNamed` for all BottomNavigationBar tab switches and post-login navigation, causing the route stack to grow indefinitely with every tap, leading to severe memory leaks and performance degradation.
**Action:** Replaced `pushNamed` with `pushReplacementNamed` for tab switches and `pushNamedAndRemoveUntil` for post-login navigation to maintain a flat navigation stack.
