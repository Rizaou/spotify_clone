import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';
import 'dart:math' as math;

import 'package:spotify_clone/presentation/widgets/genre_cards.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key? key,
    required this.onSearchBar,
  }) : super(key: key);
  final int genreCount = 5;
  Function onSearchBar;

  final List<GenreCard> genreCards = [
    GenreCard(title: "Podcasts", cardColor: Colors.orange),
    GenreCard(title: "Live Events", cardColor: Colors.purple),
    GenreCard(
        title: "Made For You", cardColor: Color.fromARGB(255, 15, 49, 78)),
    GenreCard(title: "New releases", cardColor: Colors.pink),
    GenreCard(title: "Pop", cardColor: Colors.green),
    GenreCard(title: "Hip-Hop", cardColor: Color.fromARGB(255, 164, 99, 0)),
    GenreCard(title: "Mood", cardColor: Color.fromARGB(255, 194, 6, 69)),
    GenreCard(title: "Trending", cardColor: Color.fromARGB(255, 129, 48, 75)),
    GenreCard(title: "Charts", cardColor: Color.fromARGB(255, 91, 57, 68)),
    GenreCard(
        title: "Dance/ Electroinc",
        cardColor: Color.fromARGB(255, 187, 112, 0)),
    GenreCard(title: "Made For You", cardColor: Colors.blue),
    GenreCard(title: "Made For You", cardColor: Colors.blue),
    GenreCard(title: "Made For You", cardColor: Colors.blue),
    GenreCard(title: "Made For You", cardColor: Colors.blue),
    GenreCard(title: "Made For You", cardColor: Colors.blue),
  ];

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String get headerText => "Merhaba";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
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
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    switch (index) {
                      case 0:
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text("Search", style: h1));
                      case 1:
                        return const SizedBox(
                          height: 16,
                        );
                    }
                  },
                  childCount: 2,
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 50.0,
                  maxHeight: 50.0,
                  child: GestureDetector(
                    onTap: () => widget.onSearchBar(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search,
                            size: 38,
                          ),
                          Expanded(
                            child: Text(
                              "What do you want to listen to?",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Browse all",
                    style: h2,
                  ),
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: widget.genreCards.length,
                    (context, index) => widget.genreCards[index]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
