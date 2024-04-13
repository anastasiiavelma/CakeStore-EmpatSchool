import 'package:flutter/material.dart';
import 'package:projects/providers/cart_provider.dart';
import 'package:projects/utlis/constants.dart';
import 'package:provider/provider.dart';

class CounterItemsIcon extends StatelessWidget {
  const CounterItemsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return CircleAvatar(
            radius: 10,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.background,
            child: Text(
              cart.itemCount.toString(),
              style: const TextStyle(fontSize: smallTextSize),
            ));
      },
    );
  }
}
