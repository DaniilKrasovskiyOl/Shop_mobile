import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String textBar;
  final bool haveVector;
  final bool haveLink;
  final Function()? onBackTap;

  const ShopAppBar({
    Key? key,
    required this.textBar,
    this.haveVector = false,
    this.haveLink = false,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 54,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            if (haveVector)
              Positioned(
                left: 16,
                top: 15,
                child: InkWell(
                  onTap: onBackTap,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: SvgPicture.asset('assets/vector.svg'),
                  ),
                ),
              ),
            Center(
              child: Text(
                textBar,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
