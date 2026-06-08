## 2025-02-19 - Unbounded Route Stacks in BottomNavigationBar
**Learning:** Using `Navigator.pushNamed` inside a Flutter `BottomNavigationBar` creates a severe memory leak by endlessly pushing new screens onto the route stack as the user switches tabs. Pressing the hardware back button forces the user to pop through every single tab switch historically.
**Action:** Always use `Navigator.pushReplacementNamed` for root-level tab switching to maintain a flat route stack of depth 1, preventing memory growth and preserving expected back-button behavior.
