import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';
import 'package:projects/widgets/cards/item_card_widget.dart';

class ItemsList extends StatelessWidget {
  final Function(Item) onAddToCart;
  const ItemsList({required this.onAddToCart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {},
            child: ItemCard(item: item, onAddToCart: onAddToCart),
          );
        },
        childCount: items.length,
      ),
    );
  }
}
