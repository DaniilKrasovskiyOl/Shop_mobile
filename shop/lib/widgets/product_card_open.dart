import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_shop/widgets/custom_button.dart';

class ProductCardOpenWidget extends StatefulWidget {
  final String name;
  final double price;
  final double? oldPrice;
  final String image;

  const ProductCardOpenWidget(
      {Key? key,
      required this.name,
      required this.price,
      this.oldPrice,
      required this.image})
      : super(key: key);

  @override
  State<ProductCardOpenWidget> createState() => _ProductCardOpenState();
}

class _ProductCardOpenState extends State<ProductCardOpenWidget> {
  final PageController _pageController = PageController(initialPage: 1);
  int _currentPage = 1;
  late List<String> imageUrls;

  @override
  void initState() {
    super.initState();
    imageUrls = [
      widget.image,
      widget.image,
      widget.image,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8,
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageUrls.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page + 1;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return _buildContainerWithImage(imageUrl: imageUrls[index]);
            },
          ),
        ),
        _buildDots(),
        Container(
          margin:
              const EdgeInsets.only(left: 15, right: 15, top: 16, bottom: 8),
          color: Colors.white,
          child: Text(
            widget.name,
            style: const TextStyle(
              color: Color(0xFF232323),
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              height: 1.3,
              letterSpacing: 0.20,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
          ),
          color: Colors.white,
          child: Row(
            children: [
              Text(
                '${widget.price} ₽',
                style: const TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  widget.oldPrice != null ? '${widget.oldPrice} ₽' : '',
                  style: const TextStyle(
                    color: Color(0xFF7D7D7D),
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.lineThrough,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
          child: const CustomButtonWidget(
            text: 'в корзину',
            haveIcon: true,
          ),
        ),
      ],
    );
  }

  Widget _buildContainerWithImage({required String imageUrl}) {
    return Container(
      margin: const EdgeInsets.all(16),
      color: const Color(0xFFE0E0E0),
      child: Image.network(
        imageUrl,
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(imageUrls.length, (int i) {
        return Container(
          margin: EdgeInsets.only(
              left: i == 0 ? 0 : 7.5,
              right: i == imageUrls.length - 1 ? 0 : 7.5),
          width: 16.0,
          height: 16.0,
          child: SvgPicture.asset(
            _currentPage == i + 1
                ? 'assets/dot_empty.svg'
                : 'assets/dot_full.svg',
          ),
        );
      }),
    );
  }
}
