import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: OctoImage(
                    fit: BoxFit.cover,
                    image: AssetImage(item.imageUrl!),
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
                          style: GoogleFonts.dmSerifDisplay(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 17.0,
                          )),
                      smallSizedBoxHeight,
                      Text(
                        '${item.price} UAH',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  spacer,
                  AddToCartButton(onAddToCart: onAddToCart, item: item),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
