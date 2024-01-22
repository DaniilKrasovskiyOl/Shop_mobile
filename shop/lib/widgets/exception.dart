import 'package:flutter/material.dart';


class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.7,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.22,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: const Text(
                'Ошибка',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 36),
              child: const Text(
                'Ошибка в каталоге',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
