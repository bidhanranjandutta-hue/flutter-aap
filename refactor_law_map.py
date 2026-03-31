import re

with open('lib/screens/law_map_screen.dart', 'r') as f:
    content = f.read()

# Replace int _selectedSegment = 0; with ValueNotifier
content = re.sub(r'int _selectedSegment = 0;', r'final ValueNotifier<int> _selectedSegment = ValueNotifier<int>(0);\n\n  @override\n  void dispose() {\n    _selectedSegment.dispose();\n    super.dispose();\n  }', content)

# Wrap Row in Segmented Control with ValueListenableBuilder
content = re.sub(
    r'(child: Row\(\s*children: \[\s*_buildSegmentButton\(0, \'Comparison\'\),\s*_buildSegmentButton\(1, \'Full Text\'\),\s*_buildSegmentButton\(2, \'Case Law\'\),\s*\],\s*\),)',
    r'''child: ValueListenableBuilder<int>(
                valueListenable: _selectedSegment,
                builder: (context, selectedSegment, child) {
                  return Row(
                    children: [
                      _buildSegmentButton(0, 'Comparison', selectedSegment),
                      _buildSegmentButton(1, 'Full Text', selectedSegment),
                      _buildSegmentButton(2, 'Case Law', selectedSegment),
                    ],
                  );
                },
              ),''',
    content
)

# Fix _buildSegmentButton definition
content = re.sub(
    r'Widget _buildSegmentButton\(int index, String text\) \{.*?bool isSelected = _selectedSegment == index;.*?onTap: \(\) \{.*?setState\(\(\) \{.*?_selectedSegment = index;.*?\}\);.*?\},',
    r'''Widget _buildSegmentButton(int index, String text, int selectedSegment) {
    bool isSelected = selectedSegment == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _selectedSegment.value = index;
        },''',
    content,
    flags=re.DOTALL
)

with open('lib/screens/law_map_screen.dart', 'w') as f:
    f.write(content)
