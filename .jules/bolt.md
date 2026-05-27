## 2024-05-27 - Unbounded Navigation Stack Memory Leak
**Learning:** In Flutter, repeatedly using `Navigator.pushNamed` for root-level navigation (like returning to Home/Dashboard from bottom tabs) creates an unbounded route stack and memory leaks.
**Action:** Use `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false)` instead to keep the stack flat without breaking reverse navigation expectations.
