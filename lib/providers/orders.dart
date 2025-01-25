import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';

class OrderItem {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  OrderItem({
    required this.id,
    required this.total,
    required this.products,
    required this.date,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(Cart cart) {
    _orders.insert(
      0,
      OrderItem(
        id: Random().nextDouble().toString(),
        products: cart.items.values.toList(),
        total: cart.totalAmount,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
