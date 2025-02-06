import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../provider/StateNotifierProvider.dart';

class ChangeTheme extends ConsumerWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider); // Watch the theme mode

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
      ),
      body: SwitchListTile(
        title: const Text('Dark Mode'),
        value: themeMode == ThemeMode.dark, // Check if dark mode is active
        onChanged: (isDarkMode) {
          ref.read(themeNotifierProvider.notifier).toggleTheme(isDarkMode); // Toggle the theme
        },
      ),
    );
  }
}
