import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            content: Text('You successfully ${item.name} added to cart!',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary)),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      icon: const Icon(Icons.card_giftcard),
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
