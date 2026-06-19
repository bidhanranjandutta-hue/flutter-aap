## 2026-06-19 - Prevent Route Stack Memory Leaks in Flutter
**Learning:** Using `Navigator.pushNamed` repeatedly when navigating between root-level tabs or starting a one-way flow builds an unbounded route history stack, leading to increased memory usage.
**Action:** Use `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` when resetting navigation to a root tab or beginning a fresh flow (like logging in) to keep the route stack flat and clean.
