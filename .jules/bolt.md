## YYYY-MM-DD - [Preventing Unbounded Route Stacks]
**Learning:** [Using `Navigator.pushNamed` repeatedly for root-level navigation creates an unbounded route stack and memory leaks.]
**Action:** [Navigate away from the root tab using `pushNamed`, and return to the root tab using `Navigator.pushNamedAndRemoveUntil(..., (route) => false)`. preserving the back button behavior.]