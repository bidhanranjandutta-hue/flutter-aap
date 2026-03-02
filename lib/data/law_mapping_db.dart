/// Represents a mapping between an old law (IPC, CrPC, IEA) and a new law (BNS, BNSS, BSA).
class LawMapping {
  final String oldTag;
  final String oldSection;
  final String oldTitle;
  final String oldText;
  final String newTag;
  final String newSection;
  final String newTitle;
  final String newText;
  final String keyChange;
  final String maxPenalty;
  final String compoundable;

  const LawMapping({
    required this.oldTag,
    required this.oldSection,
    required this.oldTitle,
    required this.oldText,
    required this.newTag,
    required this.newSection,
    required this.newTitle,
    required this.newText,
    required this.keyChange,
    required this.maxPenalty,
    required this.compoundable,
  });
}

/// Offline, hardcoded database for instant law mappings.
class LawMappingDb {
  static const List<LawMapping> _mappings = [
    LawMapping(
      oldTag: 'IPC',
      oldSection: '302',
      oldTitle: 'Punishment for Murder',
      oldText:
          'Whoever commits murder shall be punished with death, or imprisonment for life, and shall also be liable to fine.',
      newTag: 'BNS',
      newSection: '103',
      newTitle: 'Punishment for Murder',
      newText:
          '(1) Whoever commits murder shall be punished with death or imprisonment for life, and shall also be liable to fine.\n\n(2) When a group of five or more persons acting in concert commits murder on the ground of race, caste or community, sex, place of birth, language, personal belief or any other similar ground, each member of such group shall be punished with death or with imprisonment for life, and shall also be liable to fine.',
      keyChange:
          'The definition of \'mob lynching\' has been explicitly added as a distinct category under this section, carrying rigorous penalties including life imprisonment.',
      maxPenalty: 'Death / Life Imprisonment',
      compoundable: 'Non-Compoundable',
    ),
    LawMapping(
      oldTag: 'CrPC',
      oldSection: '41',
      oldTitle: 'When police may arrest without warrant',
      oldText:
          'Any police officer may without an order from a Magistrate and without a warrant, arrest any person...',
      newTag: 'BNSS',
      newSection: '35',
      newTitle: 'When police may arrest without warrant',
      newText:
          'Any police officer may without an order from a Magistrate and without a warrant, arrest any person who commits, in the presence of a police officer, a cognizable offence...',
      keyChange:
          'Restructured and consolidated arrest provisions with stricter compliance requirements for arbitrary arrests.',
      maxPenalty: 'N/A (Procedural)',
      compoundable: 'N/A',
    ),
    LawMapping(
      oldTag: 'IPC',
      oldSection: '124A',
      oldTitle: 'Sedition',
      oldText:
          'Whoever by words, either spoken or written, or by signs, or by visible representation, or otherwise, brings or attempts to bring into hatred or contempt...',
      newTag: 'BNS',
      newSection: '152',
      newTitle: 'Act endangering sovereignty, unity and integrity of India',
      newText:
          'Whoever, purposely or knowingly, by words, either spoken or written, or by signs, or by visible representation, or by electronic communication or by use of financial mean, or otherwise, excites or attempts to excite, secession or armed rebellion or subversive activities...',
      keyChange:
          'The word "Sedition" is removed. Scope expanded to include electronic communication and financial means.',
      maxPenalty: 'Life Imprisonment / 7 Years',
      compoundable: 'Non-Compoundable',
    ),
  ];

  /// Searches for a mapping based on a query (e.g., "IPC 302" or "302").
  static LawMapping? search(String query) {
    if (query.isEmpty) return null;

    final q = query.toLowerCase().replaceAll(' ', '');

    for (var mapping in _mappings) {
      final oldRef =
          '${mapping.oldTag.toLowerCase()}${mapping.oldSection.toLowerCase()}';
      final newRef =
          '${mapping.newTag.toLowerCase()}${mapping.newSection.toLowerCase()}';

      if (oldRef.contains(q) || newRef.contains(q) || mapping.oldSection == q) {
        return mapping;
      }
    }
    return null;
  }
}
