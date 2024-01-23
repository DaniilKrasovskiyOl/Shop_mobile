import 'package:flutter/material.dart';
import 'package:the_shop/pages/adress.dart';
import 'package:the_shop/pages/authorized_profile.dart';
import 'package:the_shop/widgets/custom_button.dart';
import '../widgets/app_bar.dart';
import '../widgets/down_bar.dart';
import 'profile_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const AppBarWidget(textBar: 'Профиль'),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 24, top: 16, left: 15, right: 15),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AutorizedProfile()),
                                );
                              },
                              child: const CustomButtonWidget(
                                  text: 'войти / зарегистрироваться')),
                        ),
                        ProfileItem(
                          text: 'Адреса магазинов',
                          context: context,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 4),
                  child: DownBarWidget(indxPage: 5, parentContext: context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class ProfileItem extends StatelessWidget {
  String text;
  BuildContext context;
  final int diffPage;

  ProfileItem(
      {Key? key,
      this.text = 'example',
      required this.context,
      this.diffPage = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          diffPage == 1
              ? MaterialPageRoute(builder: (context) => const MyProfile())
              : MaterialPageRoute(builder: (context) => const AdressPage()),
        );
      },
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 2.5,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.network(
                          'https://icons.veryicon.com/png/o/system/system-3/arrow-right-s-line-1.png')),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFE3E3E3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
