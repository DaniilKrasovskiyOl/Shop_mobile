import 'package:flutter/material.dart';
import 'package:the_shop/widgets/app_bar.dart';
import 'package:the_shop/widgets/down_bar.dart';
import 'package:the_shop/widgets/custom_button.dart';
import 'package:the_shop/pages/profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBarWidget(
              textBar: 'Мои данные',
              haveVector: true,
              onBackTap: () {
                Navigator.pop(context);
              },
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Container(
                      padding: const EdgeInsets.only(top: 24),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 16, left: 15, right: 15),
                            child: const ProfileField(
                              textField: 'Населённый пункт',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 16, left: 15, right: 15),
                            child: const ProfileField(
                              textField: 'Иван Иванов',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 16, left: 15, right: 15),
                            child: const ProfileField(
                              textField: '+7 (000) 000-00-00',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            child: const ProfileField(
                              textField: 'email@mail.ru',
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: 48, top: 24, left: 15, right: 15),
                                child: GenderSelectionContainer(),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDeleteAccountDialog(context);
                                },
                                child: Container(
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFF7D7D7D)),
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: const CustomButtonWidget(
                                    text: 'удалить аккаунт',
                                    white: true,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Нажимая кнопку, Вы соглашаетесь c ',
                                                style: TextStyle(
                                                  color: Color(0xFF232323),
                                                  fontSize: 12,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.2,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    'Правилами\nи политикой конфиденциальности Компании.',
                                                style: TextStyle(
                                                  color: Color(0xFF232323),
                                                  fontSize: 12,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  height: 1.2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Переход на новую страницу при нажатии
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfilePage()),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 32, bottom: 16),
                                  child:
                                      const CustomButtonWidget(text: 'выйти'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

class ProfileField extends StatefulWidget {
  final String textField;

  const ProfileField({
    Key? key,
    this.textField = 'exmpl',
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileFieldState createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        height: 44,
        color: const Color(0xFFF8F8F8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.7, top: 3),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: widget.textField,
                    hintStyle: const TextStyle(
                      color: Color(0xFF7D7D7D),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: 1.44,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Color(0xFF7D7D7D),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                    letterSpacing: 1.44,
                  ),
                  onChanged: (value) {
                    // Здесь обработка
                  },
                  onSubmitted: (value) {
                    // Здесь после нажатия на поиск
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class GenderSelectionContainer extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _GenderSelectionContainerState createState() =>
      _GenderSelectionContainerState();
}

class _GenderSelectionContainerState extends State<GenderSelectionContainer> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isMaleSelected = !isMaleSelected;
              if (isMaleSelected) {
                isFemaleSelected = false;
              }
            });
          },
          child: Container(
            width: 18,
            height: 18,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF595959)),
              ),
            ),
            child: isMaleSelected
                ? const Center(
                    child: Icon(
                      Icons.check,
                      color: Color(0xFF595959),
                      size: 16,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Муж',
          style: TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            setState(() {
              isFemaleSelected = !isFemaleSelected;
              if (isFemaleSelected) {
                isMaleSelected = false;
              }
            });
          },
          child: Container(
            width: 18,
            height: 18,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF595959)),
              ),
            ),
            child: isFemaleSelected
                ? const Center(
                    child: Icon(
                      Icons.check,
                      color: Color(0xFF595959),
                      size: 16,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Жен',
          style: TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          margin: const EdgeInsets.symmetric(horizontal: 31),
          child: const Text(
            'Вы уверены, что хотите удалить аккаунт? Это действие необратимо.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Обработчик нажатия на кнопку "Да"
                  // deleteAccount();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 17),
                  width: 100,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF333333),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'ДА',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF333333),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'НЕТ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      );
    },
  );
}
