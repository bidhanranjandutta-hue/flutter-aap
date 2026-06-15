## YYYY-MM-DD - Route Typo & Unbounded Stack
**Learning:** Found an unbounded navigation stack issue causing memory leaks when returning to the root dashboard via `BottomNavigationBar` and `welcome_screen.dart`. Also, the codebase uses the typo `'/dashbord'` for the dashboard route.
**Action:** Replaced `Navigator.pushNamed` with `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` to clear the stack when navigating to the root dashboard, ensuring memory efficiency. Always use exact route spellings found in `main.dart`.
