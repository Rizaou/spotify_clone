import 'package:flutter/material.dart';

import '../custom-theme.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({
    Key? key,
    required this.onHome,
    required this.onSearch,
    required this.onLibrary,
  }) : super(key: key);
  final double iconSize = 34;

  Function()? onHome;
  Function()? onSearch;
  Function()? onLibrary;

  void menuButton() {
    print("Menu");
  }

  void searchButton() {
    print("Search");
  }

  void libraryButton() {
    print("Library");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 126,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(224, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromARGB(255, 33, 74, 106),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: onHome,
                          icon: Icon(Icons.home_filled),
                          iconSize: iconSize,
                          color: textColor,
                        ),
                        Text(
                          "Home",
                          style: normalText,
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: onSearch,
                          icon: Icon(Icons.search),
                          iconSize: iconSize,
                          color: textColor,
                        ),
                        Text(
                          "Search",
                          style: normalText,
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: onLibrary,
                          icon: Icon(Icons.library_music),
                          iconSize: iconSize,
                          color: textColor,
                        ),
                        Text(
                          "Library",
                          style: normalText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
