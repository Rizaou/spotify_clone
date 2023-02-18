import 'package:flutter/material.dart';
import 'package:spotify_clone/main.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';
import 'package:spotify_clone/presentation/widgets/custom_appbar.dart';
import 'package:spotify_clone/presentation/widgets/library_items.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: bgColor,
            height: kToolbarHeight * 2,
            width: double.infinity,
            child: CustomAppBar(),
          ),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();
                return notification.accepted;
              },
              child: ListView(
                shrinkWrap: true,
                children: [
                  LibraryItems(
                    title: "Liked Songs",
                    subtitle: "Playlist . 41 songs",
                    color: Colors.blue,
                  ),
                  LibraryItems(
                    title: "New Episodes",
                    subtitle: "Updated Yesterday",
                    color: Colors.purple,
                  ),
                  LibraryItems(
                    title: "Türkçe",
                    subtitle: "Playlist * Deniz",
                  ),
                  LibraryItems(
                    title: "Türkçe",
                    subtitle: "Playlist * Deniz",
                  ),
                  LibraryItems(
                    title: "Türkçe",
                    subtitle: "Playlist * Deniz",
                  ),
                  LibraryItems(
                    title: "Türkçe",
                    subtitle: "Playlist * Deniz",
                  ),
                  LibraryItems(
                    title: "Türkçe",
                    subtitle: "Playlist * Deniz",
                  ),
                  LibraryItems(
                    title: "Türkçe",
                    subtitle: "Playlist * Deniz",
                  ),
                  LibraryItems(
                    title: "Türkçe",
                    subtitle: "Playlist * Deniz",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
