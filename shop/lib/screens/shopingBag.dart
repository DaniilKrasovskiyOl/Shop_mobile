import 'package:flutter/material.dart';
import 'package:the_shop/widgets/customButton.dart';
import '../widgets/downBar.dart';
import 'package:the_shop/widgets/appBar.dart';
import 'package:the_shop/widgets/ifEmpty.dart';
import 'package:the_shop/widgets/cardInKorz.dart';
import 'package:the_shop/service/shopingCart_service.dart';
import 'package:the_shop/service/products_service.dart';
import 'package:intl/intl.dart';

class ShopingBagPage extends StatefulWidget {
  const ShopingBagPage({Key? key}) : super(key: key);

  @override
  State<ShopingBagPage> createState() => _ShopingBagPageState();
}

class _ShopingBagPageState extends State<ShopingBagPage> {
  List<CartItem> shoppingCart = [];
  bool isLoading = true;

  double calculateTotalPrice() {
    double totalPrice = 0;

    for (var cartItem in shoppingCart) {
      totalPrice += cartItem.product.price * cartItem.quantity;
    }

    return totalPrice;
  }

  double calculateDiscount() {
    double discount = 0;

    for (var cartItem in shoppingCart) {
      if (cartItem.product.oldPrice != null) {
        discount += (cartItem.product.oldPrice! * cartItem.quantity) -
            (cartItem.product.price * cartItem.quantity);
      }
    }

    return discount;
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  Future<void> fetchDataFromServer() async {
    try {
      final List<CartItem> cartData =
          await ProductsService().getCartWithDetails();

      // ignore: unnecessary_null_comparison
      if (cartData != null) {
        setState(() {
          shoppingCart = cartData;
          isLoading = false;
          updateCart(); // Обновление при получении данных из сервера
        });
      } else {
        debugPrint('Cart data is null');
        isLoading = false;
      }
    } catch (e) {
      debugPrint('Error fetching cart: $e');
      isLoading = false;
    }
  }

  void updateCart() {
    setState(() {
      double totalPrice = calculateTotalPrice();
      double discount = calculateDiscount();
      double totalWithDiscount = totalPrice - discount;

      _totalPrice = totalPrice;
      _discount = discount;
      _totalWithDiscount = totalWithDiscount;
    });
  }

  double _totalPrice = 0;
  double _discount = 0;
  // ignore: unused_field
  double _totalWithDiscount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const ShopAppBar(
              textBar: 'Корзина',
              haveLink: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : shoppingCart.isEmpty
                          ? const IfEmpty(diff: 0)
                          : ListView.builder(
                              itemCount: shoppingCart.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: CardInKorz(
                                    cartItem: shoppingCart[index],
                                    onQuantityChanged: (quantity) {
                                      setState(() {
                                        shoppingCart[index].quantity = quantity;
                                        updateCart();
                                      });
                                    },
                                    onRemove: () {
                                      setState(() {
                                        shoppingCart.removeAt(index);
                                        updateCart();
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                ),
                shoppingCart.isEmpty
                    ? Container()
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 16,
                              offset: Offset(0, -4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Text(
                                'ИТОГО:  ${NumberFormat('#,###', 'ru_RU').format(_totalPrice)} ₽',
                                style: const TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  height: 1.2,
                                ),
                              ),
                              Text(
                                'Скидка:  -${NumberFormat('#,###', 'ru_RU').format(_discount)} ₽',
                                style: const TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 15, right: 15),
                                child: GestureDetector(
                                    onTap: () {
                                      showConfirmDialog(context);
                                    },
                                    child: const CustomButton(
                                        text: 'оформить заказ')),
                              )
                            ],
                          ),
                        ),
                      ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 4),
                  child: DownBar(indxPage: 3, parentContext: context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showConfirmDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 31),
          child: const Text(
            'Спасибо за покупку!\n Ваш заказ оформлен!',
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
              )
            ],
          )
        ],
      );
    },
  );
}
