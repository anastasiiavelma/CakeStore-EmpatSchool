import 'package:flutter/material.dart';
import 'package:projects/providers/cart_provider.dart';
import 'package:projects/screens/shopping_cart_screen.dart';
import 'package:projects/utlis/constants.dart';
import 'package:projects/widgets/cards/greeting_card_widget.dart';
import 'package:projects/widgets/icons/cart_icon_widget.dart';
import 'package:projects/widgets/slivers/silver_bar_widget.dart';
import 'package:projects/widgets/list/items_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CartProvider _cart;

  @override
  void initState() {
    super.initState();
    _cart = Provider.of<CartProvider>(context, listen: false);
    Provider.of<CartProvider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const CustomSliverAppBar(),
          const SliverToBoxAdapter(
            child: GreetingCard(),
          ),
          SliverPadding(
            padding: largePadding,
            sliver: ItemsList(
              onAddToCart: _cart.addToCart,
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topRight,
        children: [
          _shoppingCartIcon(context),
          const CounterItemsIcon(),
        ],
      ),
    );
  }

  Widget _shoppingCartIcon(context) {
    return FloatingActionButton(
      onPressed: () => (
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(
              items: _cart.itemsInCart,
              onRemoveItem: _cart.removeFromCart,
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const CircleBorder(),
      child: SizedBox(
        width: 60.0,
        height: 60.0,
        child: Icon(
          Icons.shopping_cart,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
