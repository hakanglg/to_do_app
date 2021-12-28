import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/settings_page.dart';

import 'models/color_theme_data.dart';
import 'models/items_data.dart';
import 'screens/home_page.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<ItemData>(
          create: (BuildContext context) => ItemData()),
      ChangeNotifierProvider<ColorThemeData>(
          create: (context) => ColorThemeData())
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: Provider.of<ColorThemeData>(context).selectedThemeData,
      home: HomePage(),
    );
  }
}
