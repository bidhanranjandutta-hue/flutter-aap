## 2024-05-23 - Android R8 Optimization Requirements
**Learning:** This codebase requires `-dontwarn com.google.android.play.core.**` in `proguard-rules.pro` when enabling R8 minification, likely due to a transitive dependency or Flutter plugin usage that triggers warnings.
**Action:** Always verify `proguard-rules.pro` existence and content when enabling minification in Android builds for this project.
