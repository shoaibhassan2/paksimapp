import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeController = ThemeController._internal();

class ThemeController extends ValueNotifier<ThemeMode> {
  static const _key = 'theme_mode';
  SharedPreferences? _prefs;
  bool _isInitialized = false;

  ThemeController._internal() : super(ThemeMode.system);

  /// Ensure theme is loaded before UI builds
  Future<void> ensureInitialized() async {
    if (_isInitialized) return;
    _prefs ??= await SharedPreferences.getInstance();
    final index = _prefs?.getInt(_key) ?? ThemeMode.system.index;
    value = ThemeMode.values[index];
    _isInitialized = true;
  }

  Future<void> setTheme(ThemeMode mode) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.setInt(_key, mode.index);
    value = mode;
  }

  Future<void> toggleTheme() async {
    final isDark = value == ThemeMode.dark;
    await setTheme(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}
