## YYYY-MM-DD - Unbounded Route Stacks
**Learning:** In Flutter, repeatedly using Navigator.pushNamed for root-level navigation creates an unbounded route stack and memory leaks.
**Action:** Navigate away from the root tab using pushNamed to preserve the back button, and return to the root tab using pushNamedAndRemoveUntil with a false predicate.