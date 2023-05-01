import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';
import 'package:spotify_clone/presentation/screens/search_screen.dart';
import 'package:spotify_clone/presentation/widgets/appbar_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final double _iconSize = 30.0;

  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_fadeAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    _fadeAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fadeAnimationController.forward();
    return SafeArea(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return notification.accepted;
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text(
                              "Good morning",
                              style: h1,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.white,
                                  size: _iconSize,
                                ),
                                Icon(
                                  Icons.timelapse_sharp,
                                  color: Colors.white,
                                  size: _iconSize,
                                ),
                                Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: _iconSize,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    minHeight: 50,
                    maxHeight: 50,
                    child: Container(
                      child: Row(
                        children: [
                          AppBarButton(title: "Music", onclick: () {}),
                          AppBarButton(
                              title: "Podcasts & Shows", onclick: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      "Recently played",
                      style: h1,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                  "lib/images/artists/opeth.jpeg",
                                  fit: BoxFit.fill),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      "New releases for you",
                      style: h1,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              height: 100,
                              width: 100,
                              color: Colors.red,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      "Made for you",
                      style: h1,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              height: 100,
                              width: 100,
                              color: Colors.red,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      "Recommended for today",
                      style: h1,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              height: 100,
                              width: 100,
                              color: Colors.red,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
