import 'package:flutter/material.dart';

class ColorThemeData with ChangeNotifier {
  final ThemeData greenTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)),
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      accentColor: Colors.green,
      appBarTheme: AppBarTheme(color: Colors.green));

  final ThemeData redTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)),
      primarySwatch: Colors.red,
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.red,
      accentColor: Colors.red,
      appBarTheme: AppBarTheme(color: Colors.red));

  ThemeData _selectedThemeData = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)),
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      accentColor: Colors.green,
      appBarTheme: AppBarTheme(color: Colors.green));

  void switchTheme(bool selected) {
    _selectedThemeData = selected ? greenTheme : redTheme;
    notifyListeners();
  }

  ThemeData get selectedThemeData => _selectedThemeData;
}
