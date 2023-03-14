import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spotify_clone/presentation/widgets/appbar_buttons.dart';
import 'package:spotify_clone/presentation/widgets/modal_bottom_sheet.dart';

import '../custom-theme.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key}) : super(key: key);

  static const String playlistName = "Playlists";
  static const String podcastNShowsName = "Podcast & Shows";
  static const String albumsName = "Albums";
  static const String artistsName = "Artists";
  static const String downloadedName = "Downloaded";
  static const String byYouName = "By you";
  static const String bySpotifyName = "By Spotify";

  List<String> filterQueue = [];

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  void clearList() => setState(() {
        widget.filterQueue.clear();
      });
  void clickedAppBarTitle(String title) {
    setState(() {
      if (widget.filterQueue.contains(title)) {
        if (widget.filterQueue[0] == title) {
          widget.filterQueue.clear();
        } else {
          widget.filterQueue.remove(title);
        }
      } else {
        widget.filterQueue.add(title);
      }
    });
  }

  bool hasClicked() {
    return widget.filterQueue.isNotEmpty;
  }

  List<Widget> getTitleList() {
    List<Widget> list = [];
    if (widget.filterQueue.isEmpty) {
      //* Returns default list of title.
      //* Playlist - Podcast - Albums - Artists - Downloaded

      list = [
        AppBarButton(
            title: CustomAppBar.playlistName,
            onclick: () {
              clickedAppBarTitle(CustomAppBar.playlistName);
            }),
        AppBarButton(
            title: CustomAppBar.podcastNShowsName,
            onclick: () {
              clickedAppBarTitle(CustomAppBar.podcastNShowsName);
            }),
        AppBarButton(
            title: CustomAppBar.albumsName,
            onclick: () {
              clickedAppBarTitle(CustomAppBar.albumsName);
            }),
        AppBarButton(
            title: CustomAppBar.artistsName,
            onclick: () {
              clickedAppBarTitle(CustomAppBar.artistsName);
            }),
        AppBarButton(
            title: CustomAppBar.downloadedName,
            onclick: () {
              clickedAppBarTitle(CustomAppBar.downloadedName);
            }),
      ];
    } else {
      switch (widget.filterQueue[0]) {
        case CustomAppBar.playlistName:
          list = [
            AppBarButton(
                title: CustomAppBar.playlistName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.playlistName);
                }),
            AppBarButton(
                title: CustomAppBar.byYouName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.byYouName);
                }),
            AppBarButton(
                title: CustomAppBar.bySpotifyName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.bySpotifyName);
                }),
            AppBarButton(
                title: CustomAppBar.downloadedName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.downloadedName);
                }),
          ];
          break;

        case CustomAppBar.podcastNShowsName:
          list = [
            AppBarButton(
                title: CustomAppBar.podcastNShowsName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.podcastNShowsName);
                }),
          ];
          break;

        case CustomAppBar.albumsName:
          list = [
            AppBarButton(
                title: CustomAppBar.albumsName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.albumsName);
                })
          ];
          break;

        case CustomAppBar.artistsName:
          list = [
            AppBarButton(
                title: CustomAppBar.artistsName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.artistsName);
                })
          ];
          break;
        case CustomAppBar.downloadedName:
          list = [
            AppBarButton(
                title: CustomAppBar.downloadedName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.downloadedName);
                }),
            AppBarButton(
                title: CustomAppBar.playlistName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.playlistName);
                }),
            AppBarButton(
                title: CustomAppBar.albumsName,
                onclick: () {
                  clickedAppBarTitle(CustomAppBar.albumsName);
                }),
          ];

          break;
      }
    }

    return list;
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
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: bgColor,
                        clipBehavior: Clip.antiAlias,
                        useSafeArea: true,
                        // shape: const RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(50),
                        //     topRight: Radius.circular(50),
                        //   ),
                        // ),
                        context: context,
                        builder: (ctx) {
                          return ModalBottomSheet();
                        },
                      );
                    },
                    icon: Icon(Icons.add),
                    color: textColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  hasClicked()
                      ? AppBarButton(
                          title: "X",
                          onclick: clearList,
                          backgroundColor: Color.fromARGB(255, 32, 80, 34),
                        )
                      : SizedBox(),
                  ...getTitleList(),
                ],
              ),
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