import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/logic/screen_will_pop_provider.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';
import 'package:spotify_clone/presentation/screens/home_screen.dart';
import 'package:spotify_clone/presentation/screens/library_screen.dart';
import 'package:spotify_clone/presentation/screens/search_bar_screen.dart';
import 'package:spotify_clone/presentation/screens/search_screen.dart';
import 'package:spotify_clone/presentation/widgets/custom_navigation_bar.dart';
import './logic/screen_will_pop_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ScreenWillPopProvider(HomeScreen());
      },
      builder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.dark,
          title: 'Flutter Demo',
          home: HomePage(
            screenProvider: Provider.of<ScreenWillPopProvider>(context),
          ),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.screenProvider}) : super(key: key);
  ScreenWillPopProvider screenProvider;
  // Widget screen = LibraryScreen();
  Widget screen = HomeScreen();
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final screen = widget.screenProvider.getScreen();
    if (screen == null) {
      print("No screen initialization");

      widget.screen = HomeScreen();
    } else {
      widget.screen = screen;
    }
  }

  void onSearchBar() {
    widget.screenProvider.addScreen(widget.screen);
    setState(() {
      widget.screen = SearchBarScreen();
    });
  }

  void onHome() {
    if (widget.screen.toString() == HomeScreen().toString()) {
      return;
    }

    widget.screenProvider.addScreen(widget.screen);

    setState(() {
      widget.screen = HomeScreen();
    });
  }

  void onSearch() {
    if (widget.screen.toString() == SearchScreen().toString()) {
      return;
    }

    widget.screenProvider.addScreen(widget.screen);
    setState(() {
      widget.screen = SearchScreen(
        onSearchBar: onSearchBar,
      );
    });
  }

  void onLibrary() {
    if (widget.screen.toString() == LibraryScreen().toString()) {
      return;
    }

    widget.screenProvider.addScreen(widget.screen);
    setState(() {
      widget.screen = LibraryScreen();
    });
  }

  Future<bool> _canChangeScreen() async {
    var screen = widget.screenProvider.getScreen();
    if (screen == null) {
      print("screen is null");
      return true;
    } else {
      if (screen.toString() == ScreenWillPopProvider.searchScreenName) {
        screen = SearchScreen(
          onSearchBar: onSearchBar,
        );
      }

      setState(() {
        widget.screen = screen!;
      });
    }
    print("Returned true");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: bgColor,
      body: WillPopScope(
        onWillPop: _canChangeScreen,
        child: Stack(
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