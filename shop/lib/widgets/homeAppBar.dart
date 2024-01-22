import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size(double.infinity, 44);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 3,
        bottom: 3,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 118,
              height: 38,
              child: Image.asset('assets/logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
