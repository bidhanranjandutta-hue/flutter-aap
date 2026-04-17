## 2024-04-17 - [Opt] Updated .withOpacity to .withValues for Modern Flutter

**Learning:** Found multiple usages of `.withOpacity` for colors which is now deprecated in modern Flutter and loses precision.

**Action:** Replace `Color.withOpacity(alpha)` with `Color.withValues(alpha: alpha)` for performance and correctness over the codebase.
