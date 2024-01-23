import 'package:flutter/material.dart';
import 'package:the_shop/repositories/products_repos.dart';
import 'package:the_shop/widgets/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_shop/widgets/product_card.dart';
import 'package:the_shop/widgets/down_bar.dart';
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
            appBar: const AppBarWidget(textBar: 'Каталог'),
            body: Column(
              children: [
                SizedBox(
                  width: 230,
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
                            padding: const EdgeInsets.only(right: 25),
                            child: SizedBox(
                              width: 205,
                              height: 12,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8, left: 10),
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
                            return ProductCardWidget(product: products[index]);
                          },
                        );
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 4),
                  child: DownBarWidget(indxPage: 2, parentContext: context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
