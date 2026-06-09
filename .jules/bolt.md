## 2026-06-09 - Flatten Navigation Route Stack
**Learning:** Repeatedly using `Navigator.pushNamed` inside a bottom navigation bar creates an unbounded route stack memory leak.
**Action:** Use `Navigator.pushReplacementNamed` for root-level tab switching to prevent stack growth.
