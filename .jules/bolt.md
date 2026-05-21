## 2026-05-21 - [Unbounded Route Stack in Flutter BottomNavigationBar]
**Learning:** In Flutter applications, using `Navigator.pushNamed` for navigation within a `BottomNavigationBar` creates an unbounded route stack memory leak because each tab switch pushes a new route onto the stack instead of replacing it.
**Action:** Use `Navigator.pushNamedAndRemoveUntil` (when returning to the root Dashboard) or `Navigator.pushReplacementNamed` (for initial transitions) to keep the navigation stack flat and prevent memory issues.
