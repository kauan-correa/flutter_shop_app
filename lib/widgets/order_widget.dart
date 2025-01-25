import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/providers/orders.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.order});
  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          NumberFormat('0.00', 'en_US').format(order.totalAmount),
        ),
      ),
    );
  }
}
