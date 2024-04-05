import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';
import 'package:projects/widgets/cards/cart_item_card_widget.dart';

class CartItemsList extends StatelessWidget {
  final List<Item> items;
  final Function(Item p1) onRemoveItem;
  const CartItemsList({
    super.key,
    required this.items,
    required this.onRemoveItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onRemoveItem(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kAccentColor,
                content: Text('You successfully ${item.name} delete from cart!',
                    style: TextStyle(color: kTextColor)),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          background: Padding(
            padding: smallPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.centerRight,
              child: Icon(Icons.delete, color: kButtonsColor),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 100,
            child: CartItemCard(
              item: item,
              onRemoveItem: onRemoveItem,
            ),
          ),
        );
      },
    );
  }
}
