import 'package:flutter/material.dart';
import 'package:spotify_clone/main.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';
import 'package:spotify_clone/presentation/widgets/custom_appbar.dart';
import 'package:spotify_clone/presentation/widgets/library_items.dart';

class LibraryScreen extends StatefulWidget {
  LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return SafeArea(
      child: FadeTransition(
        opacity: _animation,
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
                      title: "Playlist",
                      subtitle: "Playlist * Deniz",
                    ),
                    LibraryItems(
                      title: "Playlist",
                      subtitle: "Playlist * Deniz",
                    ),
                    LibraryItems(
                      title: "Playlist",
                      subtitle: "Playlist * Deniz",
                    ),
                    LibraryItems(
                      title: "Playlist",
                      subtitle: "Playlist * Deniz",
                    ),
                    LibraryItems(
                      title: "Playlist",
                      subtitle: "Playlist * Deniz",
                    ),
                    LibraryItems(
                      title: "Playlist",
                      subtitle: "Playlist * Deniz",
                    ),
                    LibraryItems(
                      title: "Playlist",
                      subtitle: "Playlist * Deniz",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
