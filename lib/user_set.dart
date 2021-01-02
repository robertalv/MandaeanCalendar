import 'package:shared_preferences/shared_preferences.dart';

class UserSetting {
  // // ######################
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // static final String _kLanguageCode = "language";

  // /// ------------------------------------------------------------
  // /// Method that returns the user language code, 'en' if not set
  // /// ------------------------------------------------------------
  // // Future<void> getLanguage(setState, long) async {
  // static Future<void> getLanguage(long) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   long.name = prefs.getString(_kLanguageCode) ?? 'en_US';
  //   print(long.name);
  //   return long.name;
  //   // setState(() {
  //   //   long.name = prefs.getString(_kLanguageCode) ?? 'en_US';
  //   //   // print(_localLang);
  //   // });
  // }

  // /// ----------------------------------------------------------
  // /// Method that saves the user language code
  // /// ----------------------------------------------------------
  // static Future<bool> setLanguage(String value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   return prefs.setString(_kLanguageCode, value);
  // }

  // ######################
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static final String _kLanguageCode = "language";

  /// ------------------------------------------------------------
  /// Method that returns the user language code, 'en' if not set
  /// ------------------------------------------------------------
  static Future<void> getLanguage(setState, lang) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lang.name = prefs.getString(_kLanguageCode) ?? 'en_US';
      // print(_localLang);
    });
    // _localLang = prefs.getString(_kLanguageCode) ?? 'en_US';
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
    calenderKind.display = prefs.getStringList(_kCalendarChoose) ?? ["greg"];
  }

  static Future<bool> setCalendar(List value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List newValue = value;
    return prefs.setStringList(_kCalendarChoose, newValue);
  }
}
