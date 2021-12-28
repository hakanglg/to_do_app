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
      child: Icon(Icons.add),
    );
  }

  Column bodyPage(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "${Provider.of<ItemData>(context).items.length} Items",
              style: Theme.of(context).textTheme.headline3,
            ),
          )),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                  color: Colors.white,
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
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
        )
      ],
      title: Text(
        'Get It Done',
      ),
      centerTitle: true,
    );
  }
}
