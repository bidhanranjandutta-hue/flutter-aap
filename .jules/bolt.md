## 2024-05-15 - Optimize ThemeData Allocation

**Learning:** Static getters that return complex, newly instantiated objects like `ThemeData` create unnecessary object allocation overhead and garbage collection pressure every time the property is accessed.

**Action:** Convert static getters that return constant or static configuration objects (like app themes) to `static final` variables to ensure the objects are allocated only once.
