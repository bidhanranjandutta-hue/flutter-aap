## 2024-06-11 - Optimize Navigation Route Stack
**Learning:** Flutter's standard `Navigator.pushNamed` without removal stacks up multiple route layers when constantly navigating between bottom navigation bar tabs (like returning to the dashboard from sub-screens). This leads to unbounded memory growth.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil` when returning to root level tabs from other sections, clearing the old stack entries to prevent memory leak and increase rendering speed.
