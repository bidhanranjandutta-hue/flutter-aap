## 2024-05-23 - Prevented Unbounded Route Stack Memory Leaks
**Learning:** This codebase uses a multi-scaffold architecture where each tab has its own `BottomNavigationBar`. Using `Navigator.pushNamed` to navigate between these top-level tab screens (like returning to the Dashboard) creates an unbounded route stack and a memory leak, as screens are never popped.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false)` when navigating to a root tab like Dashboard to clear the stack completely.
