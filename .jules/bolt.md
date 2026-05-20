## 2024-05-18 - Unbounded Route Stack Memory Leak
**Learning:** The application's `BottomNavigationBar` implements root-level navigation using `Navigator.pushNamed` instead of stack-clearing methods, creating a massive memory leak (unbounded route stack) every time users navigate between root tabs like `/dashbord`.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false)` for root-level tab navigation to keep the stack flat and prevent memory issues.
