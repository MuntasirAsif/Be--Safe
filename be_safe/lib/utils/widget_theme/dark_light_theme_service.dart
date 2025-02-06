import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  static const _themeKey = 'theme_mode'; // Key for storing theme in SharedPreferences

  ThemeNotifier() : super(ThemeMode.system) {
    _loadTheme(); // Load the theme when the notifier is initialized
  }

  // Toggle the theme and persist the state
  Future<void> toggleTheme(bool isDarkMode) async {
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    await _saveTheme(state); // Save the theme
  }

  // Load theme from SharedPreferences
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey) ?? 0; // Default to light theme
    state = ThemeMode.values[themeIndex];
  }

  // Save theme to SharedPreferences
  Future<void> _saveTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, themeMode.index); // Store the theme index
  }
}
