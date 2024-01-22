import 'package:flutter/material.dart';
import 'package:the_shop/widgets/downBar.dart';
import '../widgets/carouselSale.dart';
import 'shopingBag.dart';
import 'package:the_shop/widgets/homeAppBar.dart';
import 'package:the_shop/widgets/customButton.dart';

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
            appBar: HomeAppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 15),
                    child: const Text(
                      'Заголовок',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                        letterSpacing: 1.92,
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                    child: const CustomButton(
                      text: 'в корзину',
                      haveIcon: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(color: Colors.white, child: const VitrinaList()),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 4),
                  child:  DownBar(indxPage: 1,parentContext: context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
