import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';

class CartItemCard extends StatelessWidget {
  final Item item;
  final Function(Item) onRemoveItem;

  const CartItemCard({required this.item, required this.onRemoveItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onRemoveItem(item);
        snackBarRemove(context);
      },
      background: Padding(
        padding: smallPadding,
        child: Container(
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
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
                      image: AssetImage(
                        item.imageUrl!,
                      ),
                    ),
                  ),
                  smallSizedBoxWidth,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name),
                    ],
                  ),
                  const Spacer(),
                  Text('${item.price} UAH'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void snackBarRemove(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kAccentColor,
        content: Text(
          'You successfully removed ${item.name} from cart!',
          style: TextStyle(color: kTextColor),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
