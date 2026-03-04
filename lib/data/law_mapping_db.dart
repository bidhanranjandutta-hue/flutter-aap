/// Represents a legacy law (IPC, CrPC, IEA).
class OldLaw {
  final String act; // e.g., "IPC", "CrPC"
  final String sectionNumber;
  final String sectionTitle;
  final String sectionDescription;
  final String? punishment;

  const OldLaw({
    required this.act,
    required this.sectionNumber,
    required this.sectionTitle,
    required this.sectionDescription,
    this.punishment,
  });
}

/// Represents a new law (BNS, BNSS, BSA).
class NewLaw {
  final String act; // e.g., "BNS", "BNSS"
  final String sectionNumber;
  final String sectionTitle;
  final String sectionDescription;
  final String? punishment;

  const NewLaw({
    required this.act,
    required this.sectionNumber,
    required this.sectionTitle,
    required this.sectionDescription,
    this.punishment,
  });
}

/// Defines the mapping types.
enum MappingType { exact, partial, merged, split, newType, abolished }

/// Represents the relationship between an old law and a new law.
class LawMappingRelation {
  final OldLaw? oldLaw;
  final NewLaw? newLaw;
  final MappingType mappingType;
  final String mappingNotes;
  final String effectiveDate;

  const LawMappingRelation({
    this.oldLaw,
    this.newLaw,
    required this.mappingType,
    required this.mappingNotes,
    this.effectiveDate = '2024-07-01',
  });
}

/// Offline database implementing the required relational schema for Law Mapping.
class LawMappingDb {
  // --- OLD LAWS ---
  static const _oldIpc302 = OldLaw(
    act: "IPC",
    sectionNumber: "302",
    sectionTitle: "Murder",
    sectionDescription:
        "Whoever commits murder shall be punished with death, or imprisonment for life, and shall also be liable to fine.",
    punishment: "Death / Life Imprisonment",
  );
  static const _oldIpc376 = OldLaw(
    act: "IPC",
    sectionNumber: "376",
    sectionTitle: "Rape",
    sectionDescription: "Punishment for rape.",
    punishment: "Various terms",
  );
  static const _oldIpc420 = OldLaw(
    act: "IPC",
    sectionNumber: "420",
    sectionTitle: "Cheating",
    sectionDescription:
        "Cheating and dishonestly inducing delivery of property.",
    punishment: "7 Years",
  );
  static const _oldIpc304A = OldLaw(
    act: "IPC",
    sectionNumber: "304A",
    sectionTitle: "Death by negligence",
    sectionDescription: "Causing death by negligence.",
    punishment: "2 Years",
  );
  static const _oldIpc498A = OldLaw(
    act: "IPC",
    sectionNumber: "498A",
    sectionTitle: "Cruelty by husband",
    sectionDescription:
        "Husband or relative of husband of a woman subjecting her to cruelty.",
    punishment: "3 Years",
  );
  static const _oldCrpc144 = OldLaw(
    act: "CrPC",
    sectionNumber: "144",
    sectionTitle: "Prohibitory orders",
    sectionDescription:
        "Power to issue order in urgent cases of nuisance of apprehended danger.",
    punishment: null,
  );
  static const _oldCrpc41 = OldLaw(
    act: "CrPC",
    sectionNumber: "41",
    sectionTitle: "Arrest without warrant",
    sectionDescription: "When police may arrest without warrant.",
    punishment: null,
  );
  static const _oldCrpc154 = OldLaw(
    act: "CrPC",
    sectionNumber: "154",
    sectionTitle: "FIR",
    sectionDescription: "Information in cognizable cases.",
    punishment: null,
  );

  // --- NEW LAWS ---
  static const _newBns103 = NewLaw(
    act: "BNS",
    sectionNumber: "103",
    sectionTitle: "Murder",
    sectionDescription:
        "(1) Whoever commits murder shall be punished...\n(2) Mob lynching clause...",
    punishment: "Death / Life Imprisonment",
  );
  static const _newBns65 = NewLaw(
    act: "BNS",
    sectionNumber: "65",
    sectionTitle: "Rape",
    sectionDescription: "Punishment for rape (updated definitions).",
    punishment: "Rigorous Imprisonment",
  );
  static const _newBns318 = NewLaw(
    act: "BNS",
    sectionNumber: "318",
    sectionTitle: "Cheating",
    sectionDescription: "Cheating definition and punishment.",
    punishment: "7 Years",
  );
  static const _newBns106 = NewLaw(
    act: "BNS",
    sectionNumber: "106",
    sectionTitle: "Death by negligence",
    sectionDescription:
        "Causing death by negligence (includes medical negligence distinctions).",
    punishment: "5 Years",
  );
  static const _newBns85 = NewLaw(
    act: "BNS",
    sectionNumber: "85",
    sectionTitle: "Cruelty by husband",
    sectionDescription: "Husband or relative subjecting woman to cruelty.",
    punishment: "3 Years",
  );
  static const _newBnss163 = NewLaw(
    act: "BNSS",
    sectionNumber: "163",
    sectionTitle: "Prohibitory orders",
    sectionDescription: "Power to issue order in urgent cases.",
    punishment: null,
  );
  static const _newBnss35 = NewLaw(
    act: "BNSS",
    sectionNumber: "35",
    sectionTitle: "Arrest without warrant",
    sectionDescription:
        "When police may arrest without warrant (stricter compliance).",
    punishment: null,
  );
  static const _newBnss173 = NewLaw(
    act: "BNSS",
    sectionNumber: "173",
    sectionTitle: "FIR",
    sectionDescription: "Information in cognizable cases (e-FIR allowed).",
    punishment: null,
  );

  // --- MAPPINGS ---
  static const List<LawMappingRelation> _relations = [
    LawMappingRelation(
      oldLaw: _oldIpc302,
      newLaw: _newBns103,
      mappingType: MappingType.exact,
      mappingNotes: "Added distinct category for mob lynching.",
    ),
    LawMappingRelation(
      oldLaw: _oldIpc376,
      newLaw: _newBns65,
      mappingType: MappingType.exact,
      mappingNotes: "Consolidated definitions.",
    ),
    LawMappingRelation(
      oldLaw: _oldIpc420,
      newLaw: _newBns318,
      mappingType: MappingType.exact,
      mappingNotes: "Maintains similar scope.",
    ),
    LawMappingRelation(
      oldLaw: _oldIpc304A,
      newLaw: _newBns106,
      mappingType: MappingType.exact,
      mappingNotes:
          "Punishment increased to 5 years; specific clause for registered medical practitioners (2 years).",
    ),
    LawMappingRelation(
      oldLaw: _oldIpc498A,
      newLaw: _newBns85,
      mappingType: MappingType.exact,
      mappingNotes: "Wordings updated.",
    ),
    LawMappingRelation(
      oldLaw: _oldCrpc144,
      newLaw: _newBnss163,
      mappingType: MappingType.exact,
      mappingNotes: "Functionally identical.",
    ),
    LawMappingRelation(
      oldLaw: _oldCrpc41,
      newLaw: _newBnss35,
      mappingType: MappingType.partial,
      mappingNotes:
          "Restructured with stricter compliance requirements for arbitrary arrests.",
    ),
    LawMappingRelation(
      oldLaw: _oldCrpc154,
      newLaw: _newBnss173,
      mappingType: MappingType.exact,
      mappingNotes: "Formalized electronic FIR (e-FIR) process.",
    ),
  ];

  /// Searches for a mapping based on a query.
  /// Rule 5: Always show BOTH old and new when user searches either.
  static LawMappingRelation? search(String query) {
    if (query.isEmpty) return null;

    final q = query.toLowerCase().replaceAll(' ', '');

    for (var relation in _relations) {
      // Check Old Law
      if (relation.oldLaw != null) {
        final oldRef =
            '${relation.oldLaw!.act.toLowerCase()}${relation.oldLaw!.sectionNumber.toLowerCase()}';
        if (oldRef.contains(q) ||
            relation.oldLaw!.sectionNumber.toLowerCase() == q) {
          return relation;
        }
      }

      // Check New Law
      if (relation.newLaw != null) {
        final newRef =
            '${relation.newLaw!.act.toLowerCase()}${relation.newLaw!.sectionNumber.toLowerCase()}';
        if (newRef.contains(q) ||
            relation.newLaw!.sectionNumber.toLowerCase() == q) {
          return relation;
        }
      }
    }
    return null;
  }
}
