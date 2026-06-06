## 2026-06-06 - Prevent Route Stack Growth on Tab Navigation
**Learning:** Found an unbounded navigation stack issue where using `Navigator.pushNamed` inside `BottomNavigationBar` creates memory leaks and deep stacks by pushing the same dashboard route repeatedly instead of replacing the current tab route.
**Action:** Always use `Navigator.pushReplacementNamed` for tab switches and `Navigator.pushNamedAndRemoveUntil` for un-returnable flows like post-login.
