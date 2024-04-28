import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/models/item.dart';
import 'package:projects/screens/detail_item_screen.dart';
import 'package:projects/widgets/cards/item_card_widget.dart';

class ItemsList extends StatefulWidget {
  final Function(Item) onAddToCart;
  const ItemsList({required this.onAddToCart, Key? key}) : super(key: key);

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList>
    with SingleTickerProviderStateMixin {
  late final Animation<Offset> _animation;
  late final AnimationController _controller;
  int selectedCategory = 2;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Item> filteredItems =
        items.where((item) => item.category == selectedCategory).toList();
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryButton(1, 'Traditional'),
              _buildCategoryButton(2, 'Korean'),
              _buildCategoryButton(3, 'Multi'),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final item = filteredItems[index];

              return SlideTransition(
                  position: _animation,
                  child: GestureDetector(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailItemScreen(
                                item: item,
                              ),
                            ),
                          ),
                      child: ItemCard(
                          item: item, onAddToCart: widget.onAddToCart)));
            },
            childCount: filteredItems.length,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButton(int category, String buttonText) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10, 10.0, 10),
        child: Text(buttonText,
            style: GoogleFonts.dmSerifDisplay(
                color: selectedCategory == category
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).colorScheme.secondary,
                fontSize: 15)),
      ),
    );
  }
}
