
## 2024-05-25 - Prevent Unbounded Route Stack
**Learning:** In Flutter, using `Navigator.pushNamed` repeatedly for root-level navigation (like inside a `BottomNavigationBar` or from `WelcomeScreen` to `Dashboard`) creates an unbounded route stack and memory leaks.
**Action:** Use `Navigator.pushReplacementNamed` or `pushNamedAndRemoveUntil` instead to keep the stack flat. For navigating to root tabs (e.g., a Dashboard), using `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false)` is safer as it clears the stack completely.
