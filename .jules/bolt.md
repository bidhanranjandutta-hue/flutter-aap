## 2025-03-09 - Caching Theme lookups and fixing controller instantiation

**Learning:** When performing string replacement across Dart files, especially for something as ubiquitous as updating deprecated `.withOpacity` to `.withValues`, applying it automatically without testing syntax could lead to compilation issues. Also, missing one variable replacement in a block of similarly named parameters inside helper methods (e.g., `theme` passed to `_buildInfoBox` but not used for `dividerColor`) causes the PR to be incomplete.

**Action:** Be more precise with Regex replacements by accurately mapping matching groups, particularly handling parentheses. Also meticulously check inside refactored methods to make sure the passed parameters are actually replacing the original function calls.
