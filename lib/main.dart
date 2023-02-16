import 'package:flutter/material.dart';
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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
