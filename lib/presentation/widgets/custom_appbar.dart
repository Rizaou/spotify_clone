import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../custom-theme.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  Widget createHeader(String title) {
    return Container(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 8,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: h2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "D",
                  style: (TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Your Library",
                    style: h1,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width + 100,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createHeader("Playlists"),
                createHeader("Podcast & Shows"),
                createHeader("Albums"),
                createHeader("Artist"),
                createHeader("Downloaded"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/**
 Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.yellow,
                  child: Text(
                    "Playlist",
                    style: h2,
                  ),
                ),
                Container(
                  child: Text(
                    "Podcast",
                    style: h2,
                  ),
                ),
                Container(
                  child: Text(
                    "Albums",
                    style: h2,
                  ),
                ),
              ],
            )
 */