## 2024-05-18 - Route Stack Memory Leak in Bottom Navigation
**Learning:** In Flutter applications with BottomNavigationBar, repeatedly using `Navigator.pushNamed` for root-level navigation creates an unbounded route stack and memory leaks. Every tap pushes a new screen instance on top of the old one instead of switching.
**Action:** Always use `Navigator.pushReplacementNamed` or `pushNamedAndRemoveUntil` when navigating between root-level tabs to keep the route stack flat and prevent memory issues.
