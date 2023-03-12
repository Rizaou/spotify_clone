import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';
import 'package:spotify_clone/presentation/screens/home_screen.dart';
import 'package:spotify_clone/presentation/screens/library_screen.dart';
import 'package:spotify_clone/presentation/screens/search_bar_screen.dart';
import 'package:spotify_clone/presentation/screens/search_screen.dart';
import 'package:spotify_clone/presentation/widgets/custom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  Widget screen = LibraryScreen();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onSearchBar() {
    setState(() {
      widget.screen = SearchBarScreen();
    });
  }

  void onHome() {
    setState(() {
      widget.screen = HomeScreen();
    });
  }

  void onSearch() {
    setState(() {
      widget.screen = SearchScreen(
        onSearchBar: onSearchBar,
      );
    });
  }

  void onLibrary() {
    setState(() {
      widget.screen = LibraryScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: bgColor,
      body: Stack(
        children: [
          widget.screen,
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: CustomNavigationBar(
              onHome: onHome,
              onLibrary: onLibrary,
              onSearch: onSearch,
            ),
          )
        ],
      ),
    );
  }
}

/**
 * 
 * 
CustomNavigationBar(
        onHome: onHome,
        onLibrary: onLibrary,
        onSearch: onSearch,
      ),


 */