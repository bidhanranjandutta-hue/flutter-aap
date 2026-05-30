## 2024-05-24 - Navigation Stack Memory Leak
**Learning:** Flutter's Navigator.pushNamed creates unbounded route stacks when used for root-level navigation (like switching tabs in a BottomNavigationBar). Over time, this causes severe memory leaks as all previous screens are kept alive in memory unnecessarily, instead of replacing them.
**Action:** Use Navigator.pushNamedAndRemoveUntil(context, '/route', (route) => false) for tab switching or root navigation to completely clear the route stack, while keeping standard pushNamed for hierarchical (drill-down) navigation.
