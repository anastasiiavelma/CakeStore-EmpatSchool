import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';

class Cart extends ChangeNotifier {
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

  void addToCart(Item item) {
    _itemsInCart.add(item);
    notifyListeners();
  }

  void removeFromCart(Item item) {
    _itemsInCart.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _itemsInCart.clear();
    notifyListeners();
  }
}
