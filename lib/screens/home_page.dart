import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/items_data.dart';
import 'package:to_do_app/screens/item_adder.dart';
import 'package:to_do_app/widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          'Get It Done',
        ),
        centerTitle: true,
      ),
      body: Column(
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
                  child: ListView.builder(
                    itemCount: Provider.of<ItemData>(context).items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCard(
                          title:
                              Provider.of<ItemData>(context).items[index].title,
                          isDone: Provider.of<ItemData>(context)
                              .items[index]
                              .isDone,
                          toggleStatus: (bool) {
                            Provider.of<ItemData>(context, listen: false)
                                .toggletatus(index);
                          },
                          deleteItem: (_) {
                            Provider.of<ItemData>(context, listen: false)
                                .deleteItem(index);
                          });
                    },
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              context: context,
              builder: (context) => ItemAdder());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
