import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';
import 'package:projects/widgets/buttons/add_item_button.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final Function(Item) onAddToCart;

  const ItemCard({required this.item, required this.onAddToCart, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: OctoImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  item.imageUrl!,
                ),
              ),
            ),
          ),
          Padding(
            padding: smallPadding,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name,
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)),
                    Text('${item.price} UAH'),
                  ],
                ),
                spacer,
                AddToCartButton(onAddToCart: onAddToCart, item: item),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
