import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final bool haveIcon;
  final bool white;

  const CustomButtonWidget(
      {Key? key, required this.text, this.haveIcon = false, this.white = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: white
          ? const Color.fromARGB(255, 197, 109, 2)
          : const Color.fromARGB(255, 253, 139, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (haveIcon)
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 22,
              width: 23,
              child: SvgPicture.asset('assets/shoping_bag.svg'),
            ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: white ? Colors.black : Colors.white,
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                height: 0.11,
                letterSpacing: 1.44,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonNum extends StatefulWidget {
  const ButtonNum({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ButtonNumState createState() => _ButtonNumState();
}

class _ButtonNumState extends State<ButtonNum> {
  int numOfBuy = 1;

  void increment() {
    setState(() {
      numOfBuy++;
    });
  }

  void decrement() {
    if (numOfBuy > 1) {
      setState(() {
        numOfBuy--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          height: 50,
          color: const Color(0xFFF0F0F0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: decrement,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: const Color(0xFF1F1F1F),
                  child: const Text(
                    '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      height: 1.7,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  children: [
                    const Text(
                      'В КОРЗИНЕ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 1.7,
                        letterSpacing: 1.44,
                      ),
                    ),
                    Text(
                      numOfBuy.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: increment,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: const Color.fromARGB(255, 255, 140, 0),
                  child: const Text(
                    '+',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      height: 1.7,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
