import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/providers/products_provider.dart';

import 'package:shop/utils/app_routes.dart';

import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/orders_screen.dart';
import 'package:shop/views/product_detail_screen.dart';
import 'package:shop/views/products_overview_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 190, 190, 190),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.pink,
      secondary: Colors.deepOrangeAccent,
      tertiary: Colors.purple,
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.pink,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
      labelMedium: TextStyle(color: Colors.white, fontSize: 16),
      headlineLarge: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: const Color.fromARGB(255, 189, 14, 72),
      secondary: Colors.deepOrangeAccent,
      tertiary: Colors.purple,
      surface: Colors.grey[850]!,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 189, 14, 72),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
      labelMedium: TextStyle(color: Colors.white, fontSize: 16),
      headlineLarge: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        initialRoute: AppRoutes.HOME,
        routes: {
          AppRoutes.HOME: (ctx) => const ProductsOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailScreen(),
          AppRoutes.CART: (ctx) => const CartScreen(),
          AppRoutes.ORDERS: (ctx) => const OrdersScreen(),
        },
      ),
    );
  }
}
