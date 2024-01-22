import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_shop/service/products_service.dart';
import 'package:the_shop/screens/productScreen.dart';
import 'package:the_shop/service/shopingCart_service.dart';

// ignore: use_key_in_widget_constructors
class ProductCardWithService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
      future: ProductsService().getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available.'));
        } else {
          List<Products> products = snapshot.data!;
          return ProductCard(product: products[0]);
        }
      },
    );
  }
}

class ProductCard extends StatefulWidget {
  final Products product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLiked = false;

  void _onCardTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductCardPage(product: widget.product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onCardTapped();
      },
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                widget.product.photo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.product.price} ₽',
                      style: const TextStyle(
                        color: Color(0xFF595959),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 2.1,
                      ),
                    ),
                    if (widget.product.oldPrice != null)
                      Text(
                        '${widget.product.oldPrice} ₽',
                        style: const TextStyle(
                          color: Color(0xFF595959),
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                          height: 1.3,
                        ),
                      ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const ShapeDecoration(
                    color: Colors.black,
                    shape: CircleBorder(),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      // ignore: unnecessary_null_comparison
                      if (widget.product != null) {
                        ShoppingCart().addItem(widget.product);
                        // ignore: avoid_print
                        print('Добавлено в корзину: ${widget.product.name}');
                        // ignore: avoid_print
                        print(widget.product.id);
                        showAddCartDialog(context);
                      } else {
                        // ignore: avoid_print
                        print(
                            'Продукт не загружен. Невозможно добавить в корзину.');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SvgPicture.asset('assets/korz.svg'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void showAddCartDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 31),
          child: const Text(
            'Товар добавлен в корзину',
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
                  Navigator.of(context).pop();
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
                      'ОК',
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
            ],
          )
        ],
      );
    },
  );
}
