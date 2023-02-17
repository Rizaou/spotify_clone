import 'package:flutter/material.dart';

import '../custom-theme.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);
  final double iconSize = 34;

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
    return Container(
      height: 60,
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
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: menuButton,
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
                  onPressed: menuButton,
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
                  onPressed: menuButton,
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
    );
  }
}
