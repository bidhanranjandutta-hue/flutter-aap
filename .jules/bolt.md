## YYYY-MM-DD - [Flutter Route Stack Leak]
**Learning:** Found that using `Navigator.pushNamed(context, '/dashbord')` inside BottomNavigationBar to go back to the root tab creates an unbounded route stack over time, which consumes memory and creates performance issues. Also found the route name is misspelled as `/dashbord` rather than `/dashboard`.
**Action:** Use `Navigator.pushNamedAndRemoveUntil(context, '/dashbord', (route) => false)` instead to replace the navigation stack to the root route, preventing memory leaks.
