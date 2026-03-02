import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// Service to handle offline caching of recent search queries.
/// Maintains a maximum of 50 recent searches.
class SearchCacheService {
  static const String _searchKey = 'recent_searches';
  static const int _maxSearches = 50;

  /// Retrieves the list of recent searches from local storage.
  static Future<List<String>> getRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    final String? searchesJson = prefs.getString(_searchKey);
    if (searchesJson != null) {
      return List<String>.from(json.decode(searchesJson));
    }
    return [];
  }

  /// Adds a new search query to the cache.
  /// If the query already exists, it is moved to the top.
  /// Enforces a maximum limit of [_maxSearches].
  static Future<void> addSearch(String query) async {
    if (query.trim().isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    List<String> searches = await getRecentSearches();

    // Remove if already exists to push it to the top
    searches.removeWhere((s) => s.toLowerCase() == query.trim().toLowerCase());

    // Add to the beginning
    searches.insert(0, query.trim());

    // Truncate to max size
    if (searches.length > _maxSearches) {
      searches = searches.sublist(0, _maxSearches);
    }

    await prefs.setString(_searchKey, json.encode(searches));
  }

  /// Clears all recent searches.
  static Future<void> clearSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_searchKey);
  }
}
