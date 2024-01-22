import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'vitrina.dart';
import 'package:the_shop/widgets/customButton.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 64.0,
          ),
          SizedBox(
            height: 377,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildPage(
                    image: 'assets/gora.svg',
                    text:
                        'Покупайте продукты не выходя из дома или получайте бонусы за прогулку за ними.'),
                _buildPage(
                    image: 'assets/gora.svg',
                    text:
                        'Удобная навигация внутри магазина не позволит вам потеряться или что то забыть.'),
                _buildPage(
                    image: 'assets/gora.svg',
                    text: 'Делитесь корзиной с близкими и друзьями.'),
                _buildPage(
                    image: 'assets/gora.svg',
                    text: 'Приятной работы с приложением'),
              ],
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              if (_currentPage < 3) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            },
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                height: 50,
                child: CustomButton(
                  text: _currentPage < 3 ? 'далее' : 'начать',
                  haveIcon: false,
                )),
          ),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            width: 109,
            height: 16,
            child: _buildDots(),
          ),
          const SizedBox(height: 48.0)
        ],
      ),
    );
  }

  Widget _buildPage({required String image, required String text}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 273.0,
              height: 273.0,
              color: const Color(0xFFE0E0E0),
            ),
            SvgPicture.asset(
              image,
              height: 64.0,
              width: 140.0,
              fit: BoxFit.contain,
            ),
          ],
        ),
        const SizedBox(height: 23),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 265,
            maxHeight: 81,
          ),
          child: Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 1.32,
              letterSpacing: 1.44,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (int i) {
        return Container(
          margin:
              EdgeInsets.only(left: i == 0 ? 0 : 7.5, right: i == 3 ? 0 : 7.5),
          width: 16.0,
          height: 16.0,
          child: SvgPicture.asset(
            _currentPage == i ? 'assets/dot_empty.svg' : 'assets/dot_full.svg',
          ),
        );
      }),
    );
  }
}
