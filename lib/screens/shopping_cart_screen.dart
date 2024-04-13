import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';
import 'package:projects/providers/cart_provider.dart';
import 'package:projects/utlis/constants.dart';
import 'package:projects/widgets/list/cart_items_list_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onRemoveItem;

  const CartScreen({required this.items, required this.onRemoveItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: [
            IconButton(
                onPressed: () {
                  cart.removeAll();
                },
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.secondary))
          ],
          title: Text('Your shopping cart',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
        ),
        body: items.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: Text('Shopping cart is empty',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary)),
              )
            : CartItemsList(items: items, onRemoveItem: onRemoveItem),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.background,
          height: 70,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: largePadding,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Total price:  ',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 17.0),
                    ),
                    TextSpan(
                      text: '${cart.totalPrice} ',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                    TextSpan(
                      text: 'UAH',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 17.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
