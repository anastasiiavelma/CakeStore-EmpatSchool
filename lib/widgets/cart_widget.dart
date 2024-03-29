import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';

class CartWidget extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onRemoveItem;

  const CartWidget({required this.items, required this.onRemoveItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kButtonsColor,
      appBar: AppBar(
        title: const Text('Your shopping cart'),
      ),
      body: ListView.builder(
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
                  content: Text(
                      'You successfully ${item.name} delete from cart!',
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
                padding: largePadding,
                child: Icon(Icons.delete, color: kButtonsColor),
              ),
            ),
            child: Padding(
              padding: smallerPadding,
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Card(
                    elevation: 6.0,
                    child: Padding(
                      padding: smallPadding,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: OctoImage(
                              image: NetworkImage(
                                item.imageUrl!,
                              ),
                            ),
                          ),
                          smallSizedBox,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name),
                              Text('${item.price} UAH'),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
