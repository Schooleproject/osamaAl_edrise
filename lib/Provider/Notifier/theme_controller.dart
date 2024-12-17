import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '/Provider/themes/light_theme.dart'; // تأكد من أن المسار صحيح
import '/Provider/themes/dark_theme.dart';  // تأكد من أن المسار صحيح

class ThemeController extends GetxController {
  var isDarkMode = false.obs;  // استخدام Rx لتتبع الحالة

  ThemeController() {
    _loadThemeFromPreferences(); // تحميل السمة عند التهيئة
  }

  // Toggle the theme and save the state in SharedPreferences
  void toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    await _saveThemeToPreferences();
  }

  // Returns the current theme
  ThemeData get currentTheme {
    return isDarkMode.value ? darkTheme : lightTheme;
  }

  // Save the current theme mode to SharedPreferences
  Future<void> _saveThemeToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode.value);
  }

  // Load the theme mode from SharedPreferences
  Future<void> _loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false; // Default to light theme
  }
}