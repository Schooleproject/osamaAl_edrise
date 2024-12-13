import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'MyLang/CashData.dart';

class AppLanguage extends GetxController {
  RxString appLocal = 'ar'.obs;  // Make appLocal observable

  @override
  void onInit() async {
    super.onInit();
    CashData cash = CashData();
    // Load saved language or default to 'ar'
    appLocal.value = await cash.selectedLanguage ?? 'ar';
    Get.updateLocale(Locale(appLocal.value));  // Set locale immediately
  }

  // Method to change language
  void changeLanguage(String type) async {
    CashData cash = CashData();

    if (appLocal.value == type) {
      return;
    }

    appLocal.value = type;
    await cash.saveLanguageState(type); // Save selected language
    Get.updateLocale(Locale(type)); // Update locale immediately
  }
}
