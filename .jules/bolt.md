## 2024-05-24 - Unbounded Route Stacks in Navigation
**Learning:** The application uses `Navigator.pushNamed` for root-level tab navigation (like the Dashboard) from the `BottomNavigationBar`, which creates an unbounded route stack and memory leaks over time.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil` for root tab navigation to keep the stack flat and avoid memory issues without breaking reverse navigation.
