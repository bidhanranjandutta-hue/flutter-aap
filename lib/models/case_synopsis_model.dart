import 'dart:convert';

/// Data model representing the structured case synopsis from Gemini.
class CaseSynopsisModel {
  final Map<String, String> fiveWs;
  final Map<String, String> analysis;
  final List<LegalSuggestion> suggestedSections;

  CaseSynopsisModel({
    required this.fiveWs,
    required this.analysis,
    required this.suggestedSections,
  });

  factory CaseSynopsisModel.fromJson(String str) =>
      CaseSynopsisModel.fromMap(json.decode(str));

  factory CaseSynopsisModel.fromMap(Map<String, dynamic> json) {
    return CaseSynopsisModel(
      fiveWs: Map<String, String>.from(json['fiveWs'] ?? {}),
      analysis: Map<String, String>.from(json['analysis'] ?? {}),
      suggestedSections: List<LegalSuggestion>.from(
        (json['suggested_sections'] ?? []).map(
          (x) => LegalSuggestion.fromMap(x),
        ),
      ),
    );
  }
}

/// Represents a suggested legal section (BNS, BNSS, BSA).
class LegalSuggestion {
  final String act;
  final String section;
  final String title;
  final String mapping;

  LegalSuggestion({
    required this.act,
    required this.section,
    required this.title,
    required this.mapping,
  });

  factory LegalSuggestion.fromMap(Map<String, dynamic> json) => LegalSuggestion(
    act: json['act'] ?? '',
    section: json['section'] ?? '',
    title: json['title'] ?? '',
    mapping: json['mapping'] ?? '',
  );
}
