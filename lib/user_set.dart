import 'dart:io';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class UserSetting {
  static String _systemLocale = Platform.localeName.split("_")[0];

  // ######################
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static final String _kLanguageCode = "language";

  static Future<void> getLanguage(setState, lang) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lang.name = prefs.getString(_kLanguageCode) ?? 'en_US';
      // print(_localLang);
    });
    // _localLang = prefs.getString(_kLanguageCode) ?? 'en_US';
  }

  /// ------------------------------------------------------------
  /// Method that returns the user language code, 'en' if not set
  /// ------------------------------------------------------------
  static Future<void> getDefaultLanguage(lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String defaultLang;
    // final List<Locale> systemLocales = window.locales;
    // print(_systemLocale);
    if (_systemLocale == 'fa') {
      defaultLang = 'fa_IR';
    } else if (_systemLocale == 'ar') {
      defaultLang = 'ar';
    } else {
      defaultLang = 'en_US';
    }
    if (prefs.getString(_kLanguageCode) == null) {
      lang.name = defaultLang;
    } else {
      lang.name = prefs.getString(_kLanguageCode);
    }
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setLanguage(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kLanguageCode, value);
  }

  /// ----------------------------------------------------------
  /// Method that saves/ gets the user calendar choose
  /// ----------------------------------------------------------

  static final String _kCalendarChoose = "greg";

  static Future<void> getCalendar(calenderKind) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List defaultCalendar = ["manda", "greg"];
    // print(_systemLocale);
    if (_systemLocale == 'fa') {
      defaultCalendar = ["manda", "shamsi"];
    }
    var calendarChoose = prefs.getStringList(_kCalendarChoose);
    if (calendarChoose == null) {
      calenderKind.display = defaultCalendar;
    } else {
      calenderKind.display = calendarChoose;
    }

    // calenderKind.display = prefs.getStringList(_kCalendarChoose) ?? ["greg"];
  }

  static Future<bool> setCalendar(List value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List newValue = value;
    return prefs.setStringList(_kCalendarChoose, newValue);
  }
}
