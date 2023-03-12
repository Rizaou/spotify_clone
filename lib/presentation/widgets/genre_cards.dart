import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

class GenreCard extends StatelessWidget {
  GenreCard({
    Key? key,
    required this.title,
  }) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: h2,
      ),
    );
  }
}
