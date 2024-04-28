import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';
import 'package:projects/widgets/cards/cart_item_card_widget.dart';

class CartItemsList extends StatefulWidget {
  final List<Item> items;
  final Function(Item p1) onRemoveItem;
  const CartItemsList({
    super.key,
    required this.items,
    required this.onRemoveItem,
  });

  @override
  State<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Animation<double>> _animations = [];
  late Animation _colorTween;

  double generatePosition(int i) {
    return Random().nextInt(300) - 100;
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _colorTween = ColorTween(begin: kAccentColorDark, end: kAccentColorLight)
        .animate(_controller);

    // random begin animation for each widgets
    for (int i = 0; i < widget.items.length; i++) {
      _animations.add(
        Tween<double>(
          begin: generatePosition(i),
          end: 0.0,
        ).animate(_controller),
      );
    }

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        final animation = _animations[index];
        // final double begin = index * 50.0;
        // final double end = (index + 1) * 200.0;
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            widget.onRemoveItem(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                content: Text('You successfully ${item.name} delete from cart!',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary)),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          background: Padding(
            padding: smallPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.centerRight,
              child: Icon(Icons.delete,
                  color: Theme.of(context).colorScheme.background),
            ),
          ),
          child: AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(animation.value, 0.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: AnimatedBuilder(
                        animation: _colorTween,
                        builder: (BuildContext context, Widget? child) {
                          return CartItemCard(
                            color: _colorTween.value,
                            item: item,
                            onRemoveItem: widget.onRemoveItem,
                          );
                        }),
                  ),
                );
              }),
        );
      },
    );
  }
}
