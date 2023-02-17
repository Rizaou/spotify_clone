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

Widget customAppBar = Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Container(
      padding: EdgeInsets.only(left: 10),
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
              child: Text(
                "Your Library",
                style: TextStyle(color: textColor),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: textColor,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                color: textColor,
              ),
            ],
          ),
        ],
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Playlist",
          style: TextStyle(color: textColor),
        ),
        Text(
          "Podcast",
          style: TextStyle(color: textColor),
        ),
        Text(
          "Albums",
          style: TextStyle(color: textColor),
        ),
      ],
    )
  ],
);
