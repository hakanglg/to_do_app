import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  late final String title;
  final bool isDone;
  final Function(bool?) toggleStatus;
  final Function(DismissDirection)? deleteItem;

  ItemCard(
      {this.title = "",
      this.isDone = false,
      required this.toggleStatus,
      this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      onDismissed: deleteItem,
      child: Card(
        color: isDone ? Colors.green.shade50 : Colors.green.shade200,
        elevation: isDone ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            onChanged: toggleStatus,
            value: isDone,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
