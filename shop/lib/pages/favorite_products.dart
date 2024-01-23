import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/down_bar.dart';
import 'product_catalog.dart';
import 'profile.dart';
import 'package:the_shop/widgets/if_empty.dart';
import 'package:the_shop/widgets/custom_button.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var diff = 2;
    return MaterialApp(
      home: Material(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const AppBarWidget(textBar: 'Избранное'),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const IfEmptyWidget(diff: 2),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 48),
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            if (diff == 0 || diff == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CatalogPage(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfilePage(),
                                ),
                              );
                            }
                          },
                          child: CustomButtonWidget(
                            text: (diff == 0 || diff == 1)
                                ? 'перейти к покупкам'
                                : 'вход / регистрация',
                            haveIcon: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 4),
                  child: DownBarWidget(indxPage: 4, parentContext: context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
