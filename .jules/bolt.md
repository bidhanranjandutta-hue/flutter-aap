## 2024-05-24 - Unbounded Route Stacks in Flutter

**Learning:** When navigating repeatedly between root-level tabs or back to a dashboard using `Navigator.pushNamed`, it creates an unbounded route stack leading to memory leaks and a degraded back-button experience.

**Action:** Always use `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false);` when navigating back to a root tab or initial screen to clear the stack and prevent unbounded growth.
