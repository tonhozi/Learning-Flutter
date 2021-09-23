import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks/data/stocks.dart';

/// A model class that mirrors the options in [SettingsScreen] and stores data
/// in shared preferences.
class Preferences extends ChangeNotifier {
  // Keys to use with shared preferences.
  static const _preferredCategoriesKey = 'preferredCategories';

  // Indicates whether a call to [_loadFromSharedPrefs] is in progress;
  late Future<void> _loading;

  final Set<StockCategory> _preferredCategories = <StockCategory>{};

  Future<Set<StockCategory>> get preferredStocks async {
    await _loading;
    return Set.from(_preferredCategories);
  }

  Future<void> addPreferredStock(StockCategory category) async {
    _preferredCategories.add(category);
    await _saveToSharedPrefs();
    notifyListeners();
  }

  Future<void> removePreferredCategory(StockCategory category) async {
    _preferredCategories.remove(category);
    await _saveToSharedPrefs();
    notifyListeners();
  }

  Future<void> restoreDefaults() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    load();
  }

  void load() {
    _loading = _loadFromSharedPrefs();
  }

  Future<void> _saveToSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    // Store preferred categories as a comma-separated string containing their
    // indices.
    await prefs.setString(_preferredCategoriesKey,
        _preferredCategories.map((c) => c.index.toString()).join(','));
  }

  Future<void> _loadFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    // _desiredCalories = prefs.getInt(_caloriesKey) ?? 2000;
    _preferredCategories.clear();
    final names = prefs.getString(_preferredCategoriesKey);

    if (names != null && names.isNotEmpty) {
      for (final name in names.split(',')) {
        final index = int.tryParse(name) ?? -1;
        _preferredCategories.add(StockCategory.values[index]);
      }
    }

    notifyListeners();
  }
}
