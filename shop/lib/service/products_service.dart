import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:the_shop/service/shopingCart_service.dart';

class Products {
  final int id;
  final String name;
  final double price;
  final double? oldPrice;
  final String photo;
  final int? sale;

  Products({
    required this.id,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.photo,
    this.sale,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    final double? oldPrice =
        // ignore: prefer_null_aware_operators
        json['old_price'] != null ? json['old_price'].toDouble() : null;
    final int? sale = (oldPrice != null)
        ? ((1 - (json['price'] / oldPrice)) * 100).toInt()
        : null;

    return Products(
      id: json['id'],
      name: json['name'].toString(),
      price: json['price'].toDouble(),
      oldPrice: oldPrice,
      photo: json['photo'].toString(),
      sale: sale,
    );
  }
}

class ProductsService {
  final Dio dio = Dio();

  Future<List<Products>> getProducts() async {
    try {
      final response = await dio.get('http://192.168.0.104:3000/products');
      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Products.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error fetching products: $e');
      throw Exception('Failed to load products');
    }
  }

  Future<List<CartItem>> getCartWithDetails() async {
    try {
      // Получаем данные о корзине с сервера
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final List<Map<String, dynamic>>? cartData = await getCart();

      if (cartData != null) {
        debugPrint('Cart data received: $cartData');

        // Получаем список всех продуктов
        final List<Products> allProducts = await getProducts();

        // Извлекаем данные о продуктах из первого элемента списка
        final List<CartItem> shoppingCart = cartData.expand((cart) {
          final String cartItemId = cart['id'] ?? '';
          return (cart['cart'] as List).map((item) {
            final int productId = item['productId'];
            final int quantity = item['quantity'] ?? 0;

            final Products productDetails = allProducts.firstWhere(
              (product) => product.id == productId,
              orElse: () => Products(id: 0, name: "", price: 0, photo: ""),
            );

            return CartItem(
              id: cartItemId,
              product: productDetails,
              quantity: quantity,
            );
          });
        }).toList();

        return shoppingCart;
      } else {
        debugPrint('Cart data is null');
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching cart: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getCart() async {
    try {
      final response = await dio.get('http://192.168.0.104:3002/cart');
      final List<dynamic> cartList = response.data;
      return cartList.cast<Map<String, dynamic>>();
    } catch (e) {
      debugPrint('Error fetching cart: $e');
      throw Exception('Failed to load cart');
    }
  }

  Future<void> updateCart(List<CartItem> cartItems) async {
    try {
      // Преобразуем данные корзины в формат, ожидаемый на сервере
      List<Map<String, dynamic>> cartData = cartItems
          .map((item) => {
                'productId': item.product!.id,
                'quantity': item.quantity,
              })
          .toList();

      // Отправляем запрос на сервер для обновления корзины
      await dio.post('http://192.168.0.104:3002/cart', data: {
        'cart': cartData,
      });
    } catch (e) {
      debugPrint('Error updating cart on server: $e');
      throw Exception('Failed to update cart on server');
    }
  }

  Future<void> updateCartItemQuantity(
      String cartId, int productId, int newQuantity) async {
    try {
      final response = await dio.put(
        'http://192.168.0.104:3002/cart/$cartId',
        data: {
          'cart': [
            {
              'productId': productId,
              'quantity': newQuantity,
            },
          ],
        },
      );

      debugPrint('Updated cart item quantity: $response');
    } catch (e) {
      debugPrint('Error updating cart item quantity: $e');
      throw Exception('Failed to update cart item quantity');
    }
  }

  Future<void> deleteCartItem(String cartId) async {
    try {
      await dio.delete('http://192.168.0.104:3002/cart/$cartId');
    } catch (e) {
      debugPrint('Error deleting cart item: $e');
      debugPrint(cartId);
      throw Exception('Failed to delete cart item');
    }
  }
}
