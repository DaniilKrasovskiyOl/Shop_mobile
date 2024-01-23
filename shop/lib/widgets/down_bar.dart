import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DownBarWidget extends StatelessWidget {
  final int indxPage;
  final BuildContext parentContext;

  const DownBarWidget(
      {Key? key, this.indxPage = -1, required this.parentContext})
      : super(key: key);

  void _navigateToPage(String route) {
    Navigator.pushNamed(parentContext, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 253, 139, 1),
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavigationItem(
            icon: indxPage == 1
                ? 'assets/product_showcase.svg'
                : 'assets/product_showcase_active.svg',
            text: 'Витрина',
            route: '/product_showcase',
          ),
          _buildNavigationItem(
            icon: indxPage == 2
                ? 'assets/product_catalog.svg'
                : 'assets/product_catalog_active.svg',
            text: 'Каталог',
            route: '/product_catalog',
          ),
          _buildNavigationItem(
            icon: indxPage == 3
                ? 'assets/shopping_cart.svg'
                : 'assets/shopping_cart_active.svg',
            text: 'Корзина',
            route: '/shopping_cart',
          ),
          _buildNavigationItem(
            icon:
                indxPage == 4 ? 'assets/heart.svg' : 'assets/heart_active.svg',
            text: 'Избранное',
            route: '/favorite_products',
          ),
          _buildNavigationItem(
            icon: indxPage == 5
                ? 'assets/profile.svg'
                : 'assets/profile_active.svg',
            text: 'Профиль',
            route: '/profile',
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(
      {required String icon, required String text, required String route}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _navigateToPage(route),
          child: SizedBox(
            width: 34,
            height: 28,
            child: SvgPicture.asset(icon),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFB8B8B8),
            fontSize: 10,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
