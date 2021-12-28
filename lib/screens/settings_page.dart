import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/color_theme_data.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: IconTheme.of(context).color),
          title: Text(
            'Tema Seçimi Yapınız.',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SwitchCard());
  }
}

class SwitchCard extends StatefulWidget {
  @override
  _SwitchCardState createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    Text greenText = Text(
      'Light',
      style: TextStyle(color: Colors.green),
    );
    Text redText = Text(
      'Dark',
      style: TextStyle(color: Colors.green),
    );
    return Card(
      child: SwitchListTile(
        subtitle: _value ? greenText : redText,
        title: Text(
          'Change Theme Color',
          style: TextStyle(color: Colors.black),
        ),
        value: _value,
        onChanged: (bool value) {
          setState(() {
            _value = value;
          });
          Provider.of<ColorThemeData>(context, listen: false)
              .switchTheme(value);
        },
      ),
    );
  }
}
