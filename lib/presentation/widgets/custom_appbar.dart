import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/widgets/appbar_buttons.dart';

import '../custom-theme.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  void clicked() {}

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
                AppBarButton(title: "Playlists"),
                AppBarButton(title: "Podcast & Shows"),
                AppBarButton(title: "Albums"),
                AppBarButton(title: "Artist"),
                AppBarButton(title: "Downloaded"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


/*
 AppBarButton(title: "Playlists"),
                AppBarButton(title: "Podcast & Shows"),
                AppBarButton(title: "Albums"),
                AppBarButton(title: "Artist"),
                AppBarButton(title: "Downloaded"),
 */