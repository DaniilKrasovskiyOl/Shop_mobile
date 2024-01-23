import 'package:flutter/material.dart';
import 'package:the_shop/pages/profile.dart';
import 'package:the_shop/pages/shopping_cart.dart';
import 'package:the_shop/pages/product_catalog.dart';
import 'package:the_shop/pages/favorite_products.dart';
import 'package:the_shop/pages/splash.dart';
import 'package:the_shop/pages/product_showcase.dart';

void main() {
  runApp(FurnitureShop());
}

// ignore: use_key_in_widget_constructors
class FurnitureShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/product_showcase': (context) => const HomePage(), //Витрина товаров
        '/product_catalog': (context) => const CatalogPage(), //Каталог товаров
        '/shopping_cart': (context) => const ShopingBagPage(), //Корзина товаров
        '/favorite_products': (context) =>
            const FavoritePage(), //Избранные товары
        '/profile': (context) => const ProfilePage(), //Профиль
      },
      color: Colors.white,
      // ignore: prefer_const_constructors
      home: SplashScreen(),
    );
  }
}
