import 'package:flutter/material.dart';

class CounterProduct extends StatefulWidget {
  final int initialValue;
  final Function() onIncrement;
  final Function() onDecrement;
  final Function(int) onUpdate;

  const CounterProduct({
    Key? key,
    required this.initialValue,
    required this.onIncrement,
    required this.onDecrement,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<CounterProduct> createState() => _CounterProductState();
}

class _CounterProductState extends State<CounterProduct> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (_counter > 1) {
                  _counter--;
                }
              });
              widget.onDecrement();
              widget.onUpdate(_counter);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 12,
              color: const Color(0xFFAAAAAA),
              child: const Text(
                '-',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 12,
            child: Text(
              _counter > 999 ? '...' : '$_counter',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF1F1F1F),
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _counter++;
              });
              widget.onIncrement();
              widget.onUpdate(_counter);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 12,
              color: const Color(0xFF1F1F1F),
              child: const Text(
                '+',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
