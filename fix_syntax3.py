import re

with open('lib/screens/case_synopsis_screen.dart', 'r') as f:
    content = f.read()

content = content.replace(
    """_buildLegalCard(
                  context,
                  'BNS 2023',
                  'Section 305',
                  'Theft in a dwelling house, etc.',
                  'Mapped from IPC Section 380',
                  AppTheme.primary,
                )""",
    """const _LegalCard(
                  tag: 'BNS 2023',
                  title: 'Section 305',
                  subtitle: 'Theft in a dwelling house, etc.',
                  mapping: 'Mapped from IPC Section 380',
                  color: AppTheme.primary,
                )"""
)

content = content.replace(
    """_buildLegalCard(
                  context,
                  'BNS 2023',
                  'Section 331(4)',
                  'Lurking house-trespass or house-breaking by night.',
                  'Mapped from IPC Section 457',
                  Colors.purple,
                )""",
    """const _LegalCard(
                  tag: 'BNS 2023',
                  title: 'Section 331(4)',
                  subtitle: 'Lurking house-trespass or house-breaking by night.',
                  mapping: 'Mapped from IPC Section 457',
                  color: Colors.purple,
                )"""
)

content = content.replace(
    """_buildLegalCard(
                  context,
                  'Constitution',
                  'Article 21',
                  'Protection of life and personal liberty.',
                  null,
                  Colors.orange,
                )""",
    """const _LegalCard(
                  tag: 'Constitution',
                  title: 'Article 21',
                  subtitle: 'Protection of life and personal liberty.',
                  mapping: null,
                  color: Colors.orange,
                )"""
)

with open('lib/screens/case_synopsis_screen.dart', 'w') as f:
    f.write(content)
