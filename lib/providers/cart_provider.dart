import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projects/models/cart.dart';
import 'package:projects/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  final Cart _cart = Cart();

  List<Item> get itemsInCart => _cart.itemsInCart;

  int get itemCount => _cart.itemCount;

  int get totalPrice => _cart.totalPrice;

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemsJson =
        _cart.itemsInCart.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('itemsInCart', itemsJson);
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? itemsJson = prefs.getStringList('itemsInCart');
    if (itemsJson != null) {
      List<Item> loadedItems = itemsJson
          .map((itemJson) => Item.fromJson(jsonDecode(itemJson)))
          .toList();
      _cart.itemsInCart.addAll(loadedItems);
      notifyListeners();
    }
  }

  void addToCart(Item item) {
    _cart.itemsInCart.add(item);
    saveData();
    notifyListeners();
  }

  void removeFromCart(Item item) {
    _cart.itemsInCart.remove(item);
    saveData();
    notifyListeners();
  }

  void removeAll() {
    _cart.itemsInCart.clear();
    saveData();
    notifyListeners();
  }
}
