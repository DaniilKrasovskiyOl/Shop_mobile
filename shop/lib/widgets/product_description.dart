import 'package:flutter/material.dart';

//ignore: must_be_immutable
class DescriptionProductWidget extends StatefulWidget {
  String generalDescr;
  String style;
  String kind;

  DescriptionProductWidget({
    Key? key,
    this.generalDescr = '',
    this.style = '',
    this.kind = '',
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DescrProductState createState() => _DescrProductState();
}

class _DescrProductState extends State<DescriptionProductWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 54,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: const Text(
                    'Описание и характеристики',
                    style: TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0.5,
                    ),
                  ),
                ),
                IconButton(
                  icon: _isExpanded
                      ? Transform.rotate(
                          angle: 3.14,
                          child: const Icon(Icons.expand_more),
                        )
                      : const Icon(Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Column(
              children: [
                Descr(
                  textDescr1: 'Общее описание:',
                  textDescr2: widget.generalDescr,
                ),
                const Delimiter(),
                Descr(textDescr1: 'Стиль:', textDescr2: widget.style),
                const Delimiter(),
                Descr(textDescr1: 'Вид:', textDescr2: widget.kind),
              ],
            ),
        ],
      ),
    );
  }
}

class Delimiter extends StatelessWidget {
  const Delimiter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        height: 2,
        decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
      ),
    );
  }
}

//ignore: must_be_immutable
class Descr extends StatelessWidget {
  String textDescr1;
  String textDescr2;

  Descr({
    Key? key,
    required this.textDescr1,
    required this.textDescr2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              textDescr1,
              style: const TextStyle(
                color: Color(0xFF1F1F1F),
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
          Expanded(
            child: Text(
              textDescr2,
              style: const TextStyle(
                color: Color(0xFF1F1F1F),
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
