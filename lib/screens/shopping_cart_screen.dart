import 'package:flutter/material.dart';
import 'package:projects/models/cart.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';
import 'package:projects/widgets/list/cart_items_list_widget.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onRemoveItem;

  const CartWidget({required this.items, required this.onRemoveItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: kButtonsColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  cart.removeAll();
                },
                icon: Icon(Icons.delete, color: kButtonsColor))
          ],
          title: const Text('Your shopping cart'),
        ),
        body: items.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: Text('Shopping cart is empty',
                    style: TextStyle(fontSize: 20, color: kBackgroundColor)),
              )
            : CartItemsList(items: items, onRemoveItem: onRemoveItem),
        bottomNavigationBar: Container(
          color: kBackgroundColor,
          height: 70,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: smallPadding,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Total price:  ',
                      style: TextStyle(color: kTextColor, fontSize: 17.0),
                    ),
                    TextSpan(
                      text: '${cart.totalPrice} ',
                      style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                    TextSpan(
                      text: 'UAH',
                      style: TextStyle(color: kTextColor, fontSize: 17.0),
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
