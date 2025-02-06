import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../feature/splash_screen/controller/splash_controller.dart';
import '../utils/widget_theme/dark_light_theme_service.dart';

// Provider for theme management
final themeNotifierProvider =
StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) => ThemeNotifier());


// Define a provider for SplashController
final splashControllerProvider = StateNotifierProvider<SplashController, void>((ref) {
  return SplashController();
});

