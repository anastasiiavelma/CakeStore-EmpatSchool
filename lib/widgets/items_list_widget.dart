import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';

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
            child: Card(
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
                        IconButton(
                            onPressed: () {
                              onAddToCart(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: kAccentColor,
                                  content: Text('${item.name} added to cart!',
                                      style: TextStyle(color: kTextColor)),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            icon: const Icon(Icons.card_giftcard),
                            color: kButtonsColor)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: items.length,
      ),
    );
  }
}
