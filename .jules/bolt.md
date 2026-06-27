## YYYY-MM-DD - [Flutter Route Stack Optimization]
**Learning:** [Using Navigator.pushNamed repeatedly for root-level navigation creates an unbounded route stack and memory leaks.]
**Action:** [Navigate away from the root tab using pushNamed, and return to the root tab using Navigator.pushNamedAndRemoveUntil(..., (route) => false) to prevent unbounded stacks.]