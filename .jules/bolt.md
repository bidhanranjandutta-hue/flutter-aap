## 2024-05-24 - Unbounded Route Stack Optimization
**Learning:** Using Navigator.pushNamed for root tab navigation (like inside BottomNavigationBar) creates an unbounded route stack and memory leaks in Flutter.
**Action:** Always use Navigator.pushNamedAndRemoveUntil or Navigator.pushReplacementNamed for root-level navigation to keep the stack flat.
