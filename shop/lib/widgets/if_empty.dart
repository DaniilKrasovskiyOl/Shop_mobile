import 'package:flutter/material.dart';

class IfEmptyWidget extends StatelessWidget {
  final int diff;

  const IfEmptyWidget({Key? key, required this.diff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          diff == 0
              ? 'В Вашей корзине пока ничего нет'
              : diff == 1
                  ? 'В Вашем избранном пока ничего нет'
                  : 'В Вашем избранном пока ничего нет.\nЧтобы добавлять в Избранное,\nавторизуйтесь.',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF3D3D3D),
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
          softWrap: true,
        ),
      ],
    );
  }
}
