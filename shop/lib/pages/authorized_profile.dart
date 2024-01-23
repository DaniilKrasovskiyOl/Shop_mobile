import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:the_shop/widgets/app_bar.dart';
import 'package:the_shop/widgets/down_bar.dart';
import 'package:the_shop/widgets/custom_button.dart';

class AutorizedProfile extends StatefulWidget {
  const AutorizedProfile({super.key});

  @override
  State<AutorizedProfile> createState() => _AutorizedProfileState();
}

class _AutorizedProfileState extends State<AutorizedProfile> {
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
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
                      children: [
                        ProfileItem(
                          text: 'Мои данные',
                          context: context,
                          diffPage: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                bottom: 24, top: 24, left: 15, right: 15),
                            child: const CustomButtonWidget(text: 'выйти'),
                          ),
                        ),
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
