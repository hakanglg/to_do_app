import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/items_data.dart';
import 'package:to_do_app/screens/item_adder.dart';
import 'package:to_do_app/screens/settings_page.dart';
import 'package:to_do_app/widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: buildAppBar(context),
      body: bodyPage(context),
      floatingActionButton: buildFAB(context),
    );
  }

  FloatingActionButton buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            context: context,
            builder: (context) => ItemAdder());
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).buttonColor,
      ),
    );
  }

  Column bodyPage(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: Colors.transparent,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Consumer<ItemData>(
                    builder: (context, itemData, child) => Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: Provider.of<ItemData>(context).items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemCard(
                              title: itemData.items[index].title,
                              isDone: itemData.items[index].isDone,
                              toggleStatus: (bool) {
                                itemData.toggletatus(index);
                              },
                              deleteItem: (_) {
                                itemData.deleteItem(index);
                              });
                        },
                      ),
                    ),
                  )),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
        )
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.settings, color: Theme.of(context).buttonColor),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
        )
      ],
      title: Text(
        'TO DO',
        style: Theme.of(context).textTheme.headline6,
      ),
      centerTitle: true,
    );
  }
}
