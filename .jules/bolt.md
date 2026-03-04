
## 2024-03-04 - Extract `_buildLegalCard` into `const StatelessWidget`
**Learning:** Extracting UI rendering methods into `const StatelessWidget`s reduces unnecessary parent widget rebuilds and layout re-calculations in Flutter, saving noticeable rendering time (about ~7.4% reduction in rendering time when forcing rebuilds in CaseSynopsisScreen).
**Action:** When working on Flutter performance, always seek opportunities to extract non-state-dependent widget-building methods into standalone `const StatelessWidget`s to provide the framework with a tighter bound on what needs to be rebuilt.
