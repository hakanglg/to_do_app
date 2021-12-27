import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              subtitle1: TextStyle(color: Colors.white),
              headline3: TextStyle(color: Colors.white)),
          primarySwatch: Colors.green,
          primaryColor: Colors.green,
          scaffoldBackgroundColor: Colors.green,
          accentColor: Colors.green,
          appBarTheme: AppBarTheme(color: Colors.green)),
      home: HomePage(),
    );
  }
}
