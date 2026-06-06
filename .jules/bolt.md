## 2026-06-06 - Unbounded Route Stack in Flutter BottomNavigationBar
**Learning:** Using Navigator.pushNamed repeatedly inside BottomNavigationBar.onTap or similar root-level navigation mechanisms creates an unbounded route stack memory leak.
**Action:** Always use Navigator.pushReplacementNamed for tab switching, and Navigator.pushNamedAndRemoveUntil for un-returnable flows like post-login transitions.
