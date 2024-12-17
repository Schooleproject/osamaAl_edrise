// lib/helpers/Localization/localization.dart

import 'MyLang/myLocal.dart'; // تأكد من أن المسار صحيح

class Localization {
  static Map<String, Map<String, String>> _localizedValues = {
    'ar': ar,
    'en': en,
  };

  static String translate(String key, String languageCode) {
    return _localizedValues[languageCode]?[key] ?? key;
  }
}