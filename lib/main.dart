import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';
import 'package:spotify_clone/presentation/screens/library_screen.dart';
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

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  void onHome() {
    print("OnHome");
  }

  void onSearch() {
    print("OnSearch");
  }

  void onLibrary() {
    print("OnLibrary");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: bgColor,
      body: LibraryScreen(),
      bottomNavigationBar: CustomNavigationBar(
        onHome: onHome,
        onLibrary: onLibrary,
        onSearch: onSearch,
      ),
    );
  }
}
