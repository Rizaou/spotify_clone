import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/screens/home_screen.dart';
import 'package:spotify_clone/presentation/screens/library_screen.dart';
import 'package:spotify_clone/presentation/screens/search_screen.dart';

class ScreenWillPopProvider with ChangeNotifier {
  static const String homeScreenName = "HomeScreen";
  static const String searchScreenName = "SearchScreen";
  static const String libraryScreenName = "LibaryScreen";

  final Queue<String> _screens = new Queue<String>();

  ScreenWillPopProvider(Widget homeScreen) {
    _screens.add(homeScreen.toString());
  }

  void addScreen(Widget screen) {
    _screens.add(screen.toString());
    print("Screen added : ${screen.toString()} ${_screens.length}");
  }

  Widget? getScreen() {
    if (_screens.isEmpty) {
      print("screen is empty ${_screens.length}");
      return null;
    }

    switch (_screens.removeLast()) {
      case libraryScreenName:
        print("Library returned ${_screens.length}");
        return LibraryScreen();

      case homeScreenName:
        print("Home returned ${_screens.length}");
        return const HomeScreen();
      case searchScreenName:
        print("Search returned ${_screens.length}");
        return SearchScreen();
    }
  }
}
