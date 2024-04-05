import 'package:flutter/material.dart';
import 'package:projects/models/cart.dart';
import 'package:projects/utlis/constants.dart';
import 'package:provider/provider.dart';

class CounterItemsIcon extends StatelessWidget {
  const CounterItemsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return CircleAvatar(
            radius: 10,
            backgroundColor: kTextColor,
            foregroundColor: kBackgroundColor,
            child: Text(
              cart.itemCount.toString(),
              style: const TextStyle(fontSize: smallTextSize),
            ));
      },
    );
  }
}
