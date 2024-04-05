import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';

class AddToCartButton extends StatelessWidget {
  final Item item;
  final Function(Item) onAddToCart;

  const AddToCartButton(
      {required this.item, required this.onAddToCart, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onAddToCart(item);
      },
      icon: const Icon(Icons.card_giftcard),
      color: kButtonsColor,
    );
  }
}
