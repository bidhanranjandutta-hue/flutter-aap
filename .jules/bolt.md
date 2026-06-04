## 2026-06-04 - Unbounded Route Stack in Tab Navigation
**Learning:** The app's BottomNavigationBar implementation across multiple screens uses Navigator.pushNamed instead of tab state management or route replacement. This causes every tab switch to push a new route onto the stack, resulting in an unbounded stack growth and severe memory leaks during extended use.
**Action:** Use Navigator.pushReplacementNamed for root-level navigation items to maintain a flat route stack and prevent memory bloat, without sacrificing expected back-navigation behavior where appropriate.
