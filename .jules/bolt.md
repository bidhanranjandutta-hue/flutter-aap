## YYYY-MM-DD - Fix Memory Leak from Unbounded Route Stacks
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation creates an unbounded route stack and memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil when returning to root tabs to clear the stack while preserving one-way flows.