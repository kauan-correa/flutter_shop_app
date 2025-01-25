import 'package:flutter/material.dart';
import 'package:shop/widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("My Orders"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("No orders yet!"),
      ),
    );
  }
}
