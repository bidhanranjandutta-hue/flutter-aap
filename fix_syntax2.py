import re

with open('lib/screens/case_synopsis_screen.dart', 'r') as f:
    content = f.read()

# I used a bad regex, the _buildLegalCard was not fully replaced. Let me just replace the calls manually.
content = content.replace(
    """_buildLegalCard(
                  context,
                  'Old IPC',
                  'Section 380',
                  'Theft in dwelling house, etc.',
                  '→ BNS 305',
                  Colors.red[100]!,
                )""",
    """const _LegalCard(
                  tag: 'Old IPC',
                  title: 'Section 380',
                  subtitle: 'Theft in dwelling house, etc.',
                  mapping: '→ BNS 305',
                  color: Color(0xFFFFCDD2), // Colors.red[100] is not const
                )"""
)

content = content.replace(
    """_buildLegalCard(
                  context,
                  'New BNS',
                  'Section 305',
                  'Theft in a dwelling house',
                  null,
                  Colors.green[100]!,
                )""",
    """const _LegalCard(
                  tag: 'New BNS',
                  title: 'Section 305',
                  subtitle: 'Theft in a dwelling house',
                  mapping: null,
                  color: Color(0xFFC8E6C9), // Colors.green[100] is not const
                )"""
)

content = content.replace(
    """_buildLegalCard(
                  context,
                  'Procedure',
                  'CrPC 154',
                  'Information in cognizable cases',
                  '→ BNSS 173',
                  Colors.blue[100]!,
                )""",
    """const _LegalCard(
                  tag: 'Procedure',
                  title: 'CrPC 154',
                  subtitle: 'Information in cognizable cases',
                  mapping: '→ BNSS 173',
                  color: Color(0xFFBBDEFB), // Colors.blue[100] is not const
                )"""
)

with open('lib/screens/case_synopsis_screen.dart', 'w') as f:
    f.write(content)
