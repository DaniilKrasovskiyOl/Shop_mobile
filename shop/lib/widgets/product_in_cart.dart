import 'package:flutter/material.dart';
import 'counter_product.dart';
import '../repositories/cart_repos.dart';
import 'package:the_shop/repositories/products_repos.dart';

class ProductInCartWidget extends StatefulWidget {
  final CartItem cartItem;
  final Function(int) onQuantityChanged;
  final Function() onRemove;

  const ProductInCartWidget({
    Key? key,
    required this.cartItem,
    required this.onQuantityChanged,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<ProductInCartWidget> createState() => _ProductInCartState();
}

class _ProductInCartState extends State<ProductInCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              color: Colors.black,
              child: Image.network(
                widget.cartItem.product.photo,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.72,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                        child: Text(
                          widget.cartItem.product.name,
                          style: const TextStyle(
                            color: Color(0xFF232323),
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 1.1,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _removeCartItem(
                              widget.cartItem.id, context, widget.onRemove);
                        },
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/7420/7420933.png'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.cartItem.product.price} ₽',
                            style: const TextStyle(
                              color: Color(0xFF232323),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                            ),
                          ),
                          Container(
                            child: widget.cartItem.product.oldPrice != null
                                ? Text(
                                    '${widget.cartItem.product.oldPrice} ₽',
                                    style: const TextStyle(
                                      color: Color(0xFF879195),
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.lineThrough,
                                      height: 1.2,
                                    ),
                                  )
                                : null,
                          ),
                        ],
                      ),
                      CounterProductWidget(
                        initialValue: widget.cartItem.quantity,
                        onIncrement: _increment,
                        onDecrement: _decrement,
                        onUpdate: (newQuantity) {
                          _updateCartItemQuantity(widget.cartItem.id,
                              widget.cartItem.product.id, newQuantity);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _increment() {
    widget.onQuantityChanged(widget.cartItem.quantity + 1);
  }

  void _decrement() {
    if (widget.cartItem.quantity > 1) {
      widget.onQuantityChanged(widget.cartItem.quantity - 1);
    }
  }

  void _updateCartItemQuantity(
      String cartItemId, int productId, int newQuantity) async {
    await ProductsService()
        .updateCartItemQuantity(cartItemId, productId, newQuantity);
  }

  void updateQuantity(int newQuantity) {
    setState(() {
      widget.onQuantityChanged(newQuantity);
    });
  }
}

void _removeCartItem(
    String cartItemId, BuildContext context, Function() onRemove) {
  showDeleteCartDialog(context, _removeCartItemConfirmed, cartItemId, onRemove);
}

void _removeCartItemConfirmed(String cartItemId, Function() onRemove) {
  ProductsService().deleteCartItem(cartItemId);
  onRemove(); // Вызываем onRemove после удаления элемента из корзины
}

void showDeleteCartDialog(
    BuildContext context,
    Function(String, Function()) onRemoveCartItem,
    String cartItemId,
    Function() onRemove) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 31),
          child: const Text(
            'Вы уверены, что хотите удалить товар из корзины?',
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
                  onRemoveCartItem(cartItemId, onRemove);
                  Navigator.of(context).pop(); // Закрываем диалог
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
