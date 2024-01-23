import 'package:flutter/material.dart';
import 'package:the_shop/widgets/down_bar.dart';
import '../widgets/showcase_products.dart';
import 'shopping_cart.dart';
import 'package:the_shop/widgets/app_bar.dart';
import 'package:the_shop/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const AppBarWidget(textBar: 'Витрина товаров'),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShopingBagPage(),
                        ),
                      );
                    },
                    child: const CustomButtonWidget(
                      text: 'в корзину',
                      haveIcon: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      color: Colors.white, child: const VitrinaList()),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 4),
                  child: DownBarWidget(indxPage: 1, parentContext: context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
