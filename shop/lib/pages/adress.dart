import 'package:flutter/material.dart';
import 'package:the_shop/widgets/app_bar.dart';
import 'package:the_shop/widgets/down_bar.dart';
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
            appBar: AppBarWidget(
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
                  child: DownBarWidget(indxPage: 5, parentContext: context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
