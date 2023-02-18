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
            child: ListView(
              shrinkWrap: true,
              children: [
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
        ],
      ),
    );
  }
}
