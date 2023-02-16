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
      appBar: AppBar(
          toolbarHeight: kToolbarHeight * 2,
          elevation: 0,
          title: Column(
            children: [
              Container(
                margin: EdgeInsets.all(0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: Text(
                        "D",
                        style: (TextStyle(color: Colors.black, fontSize: 30)),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text("Your Library"),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Playlist"),
                  Text("Podcast"),
                  Text("Albums"),
                ],
              )
            ],
          )),
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
