import 'package:flutter/material.dart';
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
      home: const HomePage(),
    );
  }
}

/**
 * 
 * 
 * CircleAvatar(
                    child: Text(
                      "D",
                      style: (TextStyle(color: Colors.black, fontSize: 30)),
                    ),
                    backgroundColor: Colors.orange,
                  ),
 */
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: LibraryScreen(),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
