import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/logic/image_getter.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              ScreenWillPopProvider(ScreenWillPopProvider.homeScreenName),
        ),
        ChangeNotifierProvider(
          create: (context) => ImageGetter(),
        ),
      ],
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
  String currentScreen = "";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final String screen = widget.screenProvider.getScreen();
    if (screen == "") {
      print("No screen initialization");

      widget.screen = HomeScreen();
      widget.currentScreen = ScreenWillPopProvider.homeScreenName;
    } else {
      widget.screen = _getScreen(screen);
      widget.currentScreen = screen;
    }
  }

  Widget _getScreen(String name) {
    switch (name) {
      case ScreenWillPopProvider.homeScreenName:
        return HomeScreen();
      case ScreenWillPopProvider.libraryScreenName:
        return LibraryScreen();
      case ScreenWillPopProvider.searchScreenName:
        return SearchScreen(
          onSearchBar: onSearchBar,
        );
    }

    return HomeScreen();
  }

  void onSearchBar() {
    setState(() {
      widget.screen = SearchBarScreen();
    });
  }

  void onHome() {
    if (widget.currentScreen == ScreenWillPopProvider.homeScreenName) {
      return;
    }

    widget.screenProvider.addScreen(widget.currentScreen);

    setState(() {
      widget.screen = HomeScreen();
      widget.currentScreen = ScreenWillPopProvider.homeScreenName;
    });
  }

  void onSearch() {
    if (widget.currentScreen == ScreenWillPopProvider.searchScreenName) {
      return;
    }

    widget.screenProvider.addScreen(widget.currentScreen);
    setState(() {
      widget.currentScreen = ScreenWillPopProvider.searchScreenName;
      widget.screen = SearchScreen(
        onSearchBar: onSearchBar,
      );
    });
  }

  void onLibrary() {
    if (widget.currentScreen == ScreenWillPopProvider.libraryScreenName) {
      return;
    }

    widget.screenProvider.addScreen(widget.currentScreen);
    setState(() {
      widget.currentScreen = ScreenWillPopProvider.libraryScreenName;
      widget.screen = LibraryScreen();
    });
  }

  Future<bool> _canChangeScreen() async {
    var screenName = widget.screenProvider.getScreen();
    Widget screenWidget = HomeScreen();

    if (screenName == "") {
      print("screen is null");
      return true;
    } else {
      switch (screenName) {
        case ScreenWillPopProvider.searchScreenName:
          screenWidget = SearchScreen(
            onSearchBar: onSearchBar,
          );
          break;
        case ScreenWillPopProvider.homeScreenName:
          screenWidget = HomeScreen();
          break;
        case ScreenWillPopProvider.libraryScreenName:
          screenWidget = LibraryScreen();
          break;
      }

      setState(() {
        widget.screen = screenWidget;
        widget.currentScreen = screenName;
      });
    }
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