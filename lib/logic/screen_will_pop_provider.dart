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

  ScreenWillPopProvider(String name) {
    _screens.add(name);
  }

  void addScreen(String screenName) {
    _screens.add(screenName);
  }

  String getScreen() {
    if (_screens.isEmpty) {
      return "";
    }

    return _screens.removeLast();
  }
}
