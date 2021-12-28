import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/items_data.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            minLines: 1,
            maxLines: 3,
            controller: textController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                //labelText: 'Add Item',
                hintText: 'Add Item'),
            style: TextStyle(color: Colors.black),
            autofocus: true,
            onChanged: (input) {
              textController.text;
            },
          ),
          TextButton(
            onPressed: () {
              Provider.of<ItemData>(context, listen: false)
                  .addItem(textController.text);
            },
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Theme.of(context).accentColor),
            child: Text('ADD'),
          )
        ],
      ),
    );
  }
}
