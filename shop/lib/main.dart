import 'package:flutter/material.dart';
import 'package:the_shop/screens/profile.dart';
import 'package:the_shop/screens/shopingBag.dart';
import 'package:the_shop/screens/catalog.dart';
import 'package:the_shop/screens/favorite.dart';
import 'package:the_shop/screens/splashScreen.dart';
import 'package:the_shop/screens/vitrina.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/vitrina': (context) => const HomePage(),
        '/catalog': (context) => const CatalogPage(),
        '/korzina': (context) => const ShopingBagPage(),
        '/favorites': (context) => const FavoritePage(),
        '/profile': (context) => const ProfilePage(),
      },
      color: Colors.white,
      // ignore: prefer_const_constructors
      home: SplashScreen(),
    );
  }
}
