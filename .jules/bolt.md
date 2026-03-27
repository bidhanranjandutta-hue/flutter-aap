## 2024-03-27 - Deprecated Color.withOpacity()
**Learning:** In modern Flutter codebases (3.27+), `Color.withOpacity()` is deprecated and should be replaced with `Color.withValues(alpha: ...)`. This avoids precision loss and resolves analyzer warnings.
**Action:** Always check for `withOpacity()` usages and replace them with `withValues(alpha: ...)` when making performance or codebase improvements, particularly since clean analyzer output is required for PRs.
