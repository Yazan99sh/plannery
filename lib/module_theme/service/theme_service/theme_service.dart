import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';
import 'package:plannery/module_theme/pressistance/theme_preferences_helper.dart';

@provide
class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
      PublishSubject<ThemeData>();
  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

  final ThemePreferencesHelper _preferencesHelper;

  AppThemeDataService(this._preferencesHelper);

  static Color get PrimaryColor {
    return Colors.blue;
  }

  static Color get PrimaryDarker {
    return Colors.blue;
  }

  static Color get AccentColor {
    return Colors.blueAccent;
  }
  static Color get SecondaryColor {
    return Colors.white;
  }

  Future<ThemeData> getActiveTheme() async {
    var dark = await _preferencesHelper.isDarkMode();
    if (dark == true) {
      return ThemeData(
        brightness: Brightness.dark,
        primaryColor: PrimaryColor,
        primaryColorDark: PrimaryDarker,
        accentColor: AccentColor,
        primarySwatch: PrimaryColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.black,
        ),
      );
    }
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryDarker,
      accentColor: AccentColor,
      primarySwatch:PrimaryColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color:SecondaryColor,
      ),
    );
  }

  Future<void> switchDarkMode(bool darkMode) async {
    if (darkMode) {
      await _preferencesHelper.setDarkMode();
    } else {
      await _preferencesHelper.setDayMode();
    }
    var activeTheme = await getActiveTheme();
    _darkModeSubject.add(activeTheme);
  }
}
