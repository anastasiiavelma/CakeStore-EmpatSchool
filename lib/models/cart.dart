import 'package:projects/models/item.dart';

class Cart {
  final List<Item> _itemsInCart = [];

  List<Item> get itemsInCart => _itemsInCart;

  int get itemCount => _itemsInCart.length;

  int get totalPrice {
    int total = 0;
    for (var item in _itemsInCart) {
      total += item.price;
    }
    return total;
  }
}
