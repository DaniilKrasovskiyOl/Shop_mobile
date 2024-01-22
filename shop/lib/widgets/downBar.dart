import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DownBar extends StatelessWidget {
  final int indxPage;
  final BuildContext parentContext;

  const DownBar({Key? key, this.indxPage = -1, required this.parentContext}) : super(key: key);

  void _navigateToPage(String route) {
    Navigator.pushNamed(parentContext, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(
            icon: indxPage == 1 ? 'assets/vitrina_active.svg' : 'assets/vitrina.svg',
            text: 'Витрина',
            route: '/vitrina',
          ),
          _buildNavItem(
            icon: indxPage == 2 ? 'assets/catalog_active.svg' : 'assets/catalog.svg',
            text: 'Каталог',
            route: '/catalog',
          ),
          _buildNavItem(
            icon: indxPage == 3 ? 'assets/korzina_active.svg' : 'assets/korzina.svg',
            text: 'Корзина',
            route: '/korzina',
          ),
          _buildNavItem(
            icon: indxPage == 4 ? 'assets/heart_active.svg' : 'assets/heart.svg',
            text: 'Избранное',
            route: '/favorites',
          ),
          _buildNavItem(
            icon: indxPage == 5 ? 'assets/profile_active.svg' : 'assets/profile.svg',
            text: 'Профиль',
            route: '/profile',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({required String icon, required String text, required String route}) {

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
