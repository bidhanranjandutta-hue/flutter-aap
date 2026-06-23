## YYYY-MM-DD - Root Navigation Optimization in Flutter
**Learning:** In Flutter applications utilizing `Navigator.pushNamed` for recurring navigation actions (like BottomNavigationBar tabs returning to the root dashboard), the route stack can grow unbounded, causing memory leaks and degraded performance over long sessions.
**Action:** When navigating to the root application screen from deeper levels or other root-level tabs, always use `Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false)` to clear the stack and prevent infinite route accumulation.
