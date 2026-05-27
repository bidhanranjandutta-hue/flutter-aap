## 2025-05-27 - Unbounded Route Stack in Bottom Navigation
**Learning:** In Flutter, using `Navigator.pushNamed` inside bottom navigation tap handlers creates an unbounded route stack that leads to significant memory leaks as screens are continuously pushed on top of one another.
**Action:** Always use `pushReplacementNamed` or `pushNamedAndRemoveUntil` for root-level tabs to keep the route stack flat and bounded.
