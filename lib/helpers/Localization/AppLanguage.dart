import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage with ChangeNotifier {
  String _appLocal = 'ar'; // القيمة الافتراضية

  String get appLocal => _appLocal;

  AppLanguage() {
    _loadLanguage();
  }

  // تحميل اللغة المحفوظة
  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _appLocal = prefs.getString('lang') ?? 'ar';
    notifyListeners();
  }

  // تغيير اللغة
  void changeLanguage(String type) async {
    if (_appLocal == type) {
      return;
    }

    _appLocal = type;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', type);
    notifyListeners(); // Notify listeners to update UI
  }
}