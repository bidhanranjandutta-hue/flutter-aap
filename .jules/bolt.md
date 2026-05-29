## 2024-05-24 - Unbounded Route Stack in Flutter Bottom Navigation
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation (like inside a BottomNavigationBar or from a Welcome screen to a root Dashboard) creates an unbounded route stack. This piles up screens in memory, leading to memory leaks and degraded performance in Flutter apps.
**Action:** Always use Navigator.pushNamedAndRemoveUntil (or pushReplacementNamed) when navigating to root tabs to keep the route stack flat and prevent memory leaks.
