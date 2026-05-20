## 2024-05-18 - Prevent Unbounded Route Stack in Bottom Navigation
**Learning:** Repeatedly pushing root tabs using Navigator.pushNamed inside BottomNavigationBar components creates an unbounded route stack memory leak. As the stack grows with every tab switch, the application experiences increased memory pressure and possible OOM crashes.
**Action:** Use Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false) for primary dashboard/home routes to periodically clear the navigation history and keep the stack bounded.
