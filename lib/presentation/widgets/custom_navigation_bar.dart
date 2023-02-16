import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);
  final double iconSize = 34;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(224, 0, 0, 0),
              Color.fromARGB(0, 0, 0, 0),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home_filled),
            iconSize: iconSize,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: iconSize,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.library_music_rounded),
            iconSize: iconSize,
          ),
        ],
      ),
    );
  }
}
