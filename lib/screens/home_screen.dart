import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';
import 'package:projects/widgets/cart_widget.dart';
import 'package:projects/widgets/items_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final List<Item> items = [];

  void addToCart(Item item) {
    setState(() {
      items.add(item);
    });
  }

  void removeFromCart(Item item) {
    setState(() {
      items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              'Cake-store',
              style: TextStyle(color: kBackgroundColor, fontSize: 30.0),
            ),
            centerTitle: true,
            backgroundColor: kButtonsColor,
          ),
          SliverPadding(
            padding: largePadding,
            sliver: ItemsList(
              onAddToCart: addToCart,
            ),
          ),
        ],
      ),
      floatingActionButton: _shoppingCart(context),
    );
  }

  Widget _shoppingCart(context) {
    return FloatingActionButton(
      onPressed: () => (
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartWidget(
              items: items,
              onRemoveItem: removeFromCart,
            ),
          ),
        ),
      ),
      backgroundColor: kButtonsColor,
      shape: const CircleBorder(),
      child: SizedBox(
        width: 60.0,
        height: 60.0,
        child: Icon(
          Icons.shopping_cart,
          color: kBackgroundColor,
        ),
      ),
    );
  }
}
