import 'package:flutter/material.dart';
import 'package:the_shop/widgets/app_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_shop/widgets/product_card_open.dart';
import 'package:the_shop/widgets/product_description.dart';
import 'package:the_shop/repositories/products_repos.dart';

//ignore: must_be_immutable
class ProductCardPage extends StatefulWidget {
  Products product;

  ProductCardPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCardPage> createState() => _ProductCardPageState();
}

class _ProductCardPageState extends State<ProductCardPage> {
  bool isLiked = false;

  // ignore: unused_element
  void _onLikeChanged() {
    setState(() {
      // ignore: avoid_print
      print('Общее количество активных лайков: ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Material(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBarWidget(
              textBar: widget.product.name,
              haveVector: true,
              haveLink: true,
              onBackTap: () {
                Navigator.pop(context);
              },
            ),
            body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                  height: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.sale != null
                            ? '${widget.product.sale}%'
                            : '',
                        style: const TextStyle(
                          color: Color(0xFFB8B8B8),
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(
                        width: 34,
                        height: 28,
                        child: SvgPicture.asset('assets/red_heart.svg'),
                      ),
                    ],
                  ),
                ),
                ProductCardOpenWidget(
                    name: widget.product.name,
                    price: widget.product.price,
                    oldPrice: widget.product.oldPrice,
                    image: widget.product.photo),
                const Delimiter(),
                DescriptionProductWidget(
                  generalDescr:
                      'Стильный столик журнальный металлический с подносом в стиле лофт эффектно впишется в тематический дизайн интерьера.',
                  style: 'Лофт',
                  kind: 'Журнальный',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
