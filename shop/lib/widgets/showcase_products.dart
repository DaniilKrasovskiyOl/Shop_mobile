import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowcaseProductsWidget extends StatefulWidget {
  const ShowcaseProductsWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShowcaseProductsState createState() => _ShowcaseProductsState();
}

class _ShowcaseProductsState extends State<ShowcaseProductsWidget> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: 3,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return const CardWidget();
            },
          ),
          CardIndicator(currentPage: _currentPage, totalPages: 3),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 0.7,
          decoration: ShapeDecoration(
            color: const Color(0xFFE0E0E0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: SvgPicture.asset('assets/gora.svg'),
        ),
      ],
    );
  }
}

class CardIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const CardIndicator(
      {super.key, required this.totalPages, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Container(
          width: 7.01,
          height: 7.01,
          margin: EdgeInsets.only(
              left: (index) == 0 ? 0 : 7.5, right: (index) == 3 ? 0 : 7.5),
          decoration: ShapeDecoration(
            color: index == currentPage
                ? const Color(0xFF7D7D7D)
                : const Color(0xFF7D7D7D).withOpacity(0.5),
            shape: const OvalBorder(),
          ),
        ),
      ),
    );
  }
}

class VitrinaList extends StatelessWidget {
  const VitrinaList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const ShowcaseProductsWidget();
      },
      itemCount: 4, // null будет бесконечный список
    );
  }
}
