import re

with open('lib/screens/ocr_scanner_screen.dart', 'r') as f:
    content = f.read()

# Replace int _viewMode = 0; with ValueNotifier
content = re.sub(r'int _viewMode = 0; // 0: Original, 1: Digitized', r'final ValueNotifier<int> _viewMode = ValueNotifier<int>(0); // 0: Original, 1: Digitized\n\n  @override\n  void dispose() {\n    _viewMode.dispose();\n    super.dispose();\n  }', content)

# Wrap Row in View Toggle with ValueListenableBuilder
content = re.sub(
    r'(child: Row\(\s*children: \[\s*_buildToggleOption\(0, \'Original Scan\'\),\s*_buildToggleOption\(1, \'Digitized Text\'\),\s*\],\s*\),)',
    r'''child: ValueListenableBuilder<int>(
                valueListenable: _viewMode,
                builder: (context, viewMode, child) {
                  return Row(
                    children: [
                      _buildToggleOption(0, 'Original Scan', viewMode),
                      _buildToggleOption(1, 'Digitized Text', viewMode),
                    ],
                  );
                },
              ),''',
    content
)

# Fix _buildToggleOption definition
content = re.sub(
    r'Widget _buildToggleOption\(int index, String text\) \{.*?bool isSelected = _viewMode == index;.*?onTap: \(\) => setState\(\(\) => _viewMode = index\),',
    r'''Widget _buildToggleOption(int index, String text, int viewMode) {
    bool isSelected = viewMode == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => _viewMode.value = index,''',
    content,
    flags=re.DOTALL
)

with open('lib/screens/ocr_scanner_screen.dart', 'w') as f:
    f.write(content)
