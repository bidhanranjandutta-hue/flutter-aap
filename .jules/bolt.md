## 2024-06-17 - Flutter Unbounded Route Stack
**Learning:** Using `Navigator.pushNamed` to return to a root dashboard tab creates an unbounded route stack, leading to memory leaks and performance degradation.
**Action:** Use `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` when navigating back to the root tab or for one-way flows (like login) to clear the route stack and prevent memory leaks.
