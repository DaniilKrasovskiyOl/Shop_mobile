import 'package:flutter/material.dart';
import 'package:the_shop/service/products_service.dart';
import 'package:the_shop/screens/profile.dart';
import 'package:the_shop/widgets/appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_shop/widgets/productCard.dart';
import 'package:the_shop/widgets/downBar.dart';
import 'package:the_shop/widgets/search.dart';

class CatalogPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CatalogPage({Key? key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool isSheetOpen = false;
  final ProductsService _productsService = ProductsService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Material(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const ShopAppBar(textBar: 'Подкатегория товаров'),
            body: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 48.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 16,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: SizedBox(
                              width: 191,
                              height: 16,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'ПО ВОЗРАСТАНИЮ ЦЕНЫ',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF1F1F1F),
                                        fontSize: 12,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        height: 0.11,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Container(
                                      width: 10,
                                      height: 16,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          SvgPicture.asset('assets/vector.svg'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 54,
                  child: const SearchWidget(),
                ),
                Expanded(
                  child: FutureBuilder<List<Products>>(
                    future: _productsService.getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No data available.'));
                      } else {
                        List<Products> products = snapshot.data!;
                        return GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.75,
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(product: products[index]);
                          },
                        );
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 4),
                  child: DownBar(indxPage: 2, parentContext: context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 31),
          child: const Text(
            'Вы уверены, что хотите удалить аккаунт? Это действие необратимо.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Обработчик нажатия на кнопку "Да"
                  // deleteAccount();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 17),
                  width: 100,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF333333),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'ДА',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Обработчик нажатия на кнопку "Да"
                  // deleteAccount();
                  Navigator.of(context).pop(); // Закрываем диалог
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF333333),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'НЕТ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      );
    },
  );
}
