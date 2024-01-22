import 'package:flutter/material.dart';
import 'package:the_shop/service/products_service.dart';

class CartItem {
  final String id;
  final Products product;
  int quantity;

  CartItem({
    required this.id,
    required this.product,
    this.quantity = 1,
  });
}

class ShoppingCart extends ChangeNotifier {
  ShoppingCart() {
    _loadCart();
  }

  Future<void> _loadCart() async {
    try {
      List<CartItem> cartItems = await _productsService.getCartWithDetails();
      items = cartItems;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading cart: $e');
    }
  }

  List<CartItem> items = [];
  final ProductsService _productsService = ProductsService();

  Future<void> addItem(Products product) async {
    try {
      // Проверяем, есть ли товар с таким productId в корзине
      bool itemExists = items.any((item) => item.product.id == product.id);

      if (itemExists) {
        // Если товар уже есть в корзине, увеличиваем количество
        CartItem existingItem =
            items.firstWhere((item) => item.product.id == product.id);
        existingItem.quantity++;
      } else {
        // Если товара с таким productId нет в корзине, добавляем новый
        items.add(CartItem(id: '', product: product));
      }

      // Переместите вызов _updateCartOnServer() за пределы блока try-catch,
      // чтобы он выполнялся после любых изменений в корзине
      await _updateCartOnServer();

      // ignore: avoid_print
      print(items.length);
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding item to cart: $e');
    }
  }

  Future<void> removeItem(CartItem cartItem) async {
    items.remove(cartItem);

    // Отправляем запрос на сервер для обновления корзины
    await _updateCartOnServer();

    notifyListeners();
  }

  double getTotalPrice() {
    return items.fold(
        0.0, (total, item) => total + (item.product.price * item.quantity));
  }

  int getTotalItems() {
    return items.fold(0, (total, item) => total + item.quantity);
  }

  Future<void> _updateCartOnServer() async {
    // Отправляем запрос на сервер для обновления содержимого корзины
    // Используйте _productsService для ваших запросов
    try {
      // Пример запроса (замените его на свой)
      await _productsService.updateCart(items);
    } catch (e) {
      debugPrint('Error updating cart on server: $e');
    }
  }
}
