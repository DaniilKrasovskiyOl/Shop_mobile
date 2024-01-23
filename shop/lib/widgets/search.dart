import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchWidget> {
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
            Container(
              padding: const EdgeInsets.only(left: 13.57),
              child: const Icon(Icons.search),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.7, top: 3),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'ПОИСК',
                    hintStyle: TextStyle(
                      color: Color(0xFF7D7D7D),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: 1.44,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Color(0xFF7D7D7D),
                    fontSize: 12,
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
