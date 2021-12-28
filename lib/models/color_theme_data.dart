import 'package:flutter/material.dart';

class ColorThemeData with ChangeNotifier {
  final ThemeData whiteTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.black),
        headline6: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.green[700]),
      ),
      buttonColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      primaryColor: Colors.blueGrey[50],
      scaffoldBackgroundColor: Colors.blueGrey[50],
      splashColor: Colors.grey,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.blueGrey[50]),
      appBarTheme: AppBarTheme(color: Colors.blueGrey[50]));

  final ThemeData blackTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
      ),
      buttonColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: Colors.white,
      primaryColor: Colors.blueGrey[900],
      scaffoldBackgroundColor: Colors.blueGrey[900],
      splashColor: Colors.blueGrey[900],
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.blueGrey[900]),
      appBarTheme: AppBarTheme(color: Colors.blueGrey[900]));

  ThemeData _selectedThemeData = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.black),
        headline6: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.green[700]),
      ),
      buttonColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      primaryColor: Colors.blueGrey[50],
      scaffoldBackgroundColor: Colors.blueGrey[50],
      splashColor: Colors.grey,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.blueGrey[50]),
      appBarTheme: AppBarTheme(color: Colors.blueGrey[50]));
  void switchTheme(bool selected) {
    _selectedThemeData = selected ? blackTheme : whiteTheme;
    notifyListeners();
  }

  ThemeData get selectedThemeData => _selectedThemeData;
}
