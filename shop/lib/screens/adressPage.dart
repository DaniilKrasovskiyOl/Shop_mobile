import 'package:flutter/material.dart';
import 'package:the_shop/widgets/appBar.dart';
import 'package:the_shop/widgets/downBar.dart';
import 'package:the_shop/widgets/exception.dart';

class AdressPage extends StatelessWidget {
  const AdressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: ShopAppBar(
              textBar: 'Адреса магазинов',
              haveVector: true,
              onBackTap: () {
                Navigator.pop(context);
              },
            ),
            body: Column(
              children: [
                const Expanded(child: ExceptionWidget()),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 4),
                  child: DownBar(indxPage: 5, parentContext: context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
