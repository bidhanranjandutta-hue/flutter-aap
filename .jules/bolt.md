## 2024-06-15 - Unbounded Route Stack on Root Tabs
**Learning:** In Flutter, using `Navigator.pushNamed` to navigate to root tabs (like `/dashbord` from login or other tabs) creates an unbounded route stack leading to memory leaks over time as the app gets used.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil` when transitioning to root tabs or completely replacing the authentication/app flow, to reset the route stack.
