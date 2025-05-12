class AppTranslations {
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'welcome': 'Welcome',
      'notifications': 'Notifications',
      'profile': 'Profile',
      // Add all English translations
    },
    'ar': {
      'welcome': 'مرحباً',
      'notifications': 'الإشعارات',
      'profile': 'الملف الشخصي',
      // Add all Arabic translations
    },
  };

  static String translate(String key, Locale locale) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}