import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

class GenreCard extends StatelessWidget {
  GenreCard({
    Key? key,
    required this.title,
    required this.cardColor,
  }) : super(key: key);
  String title;
  Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: cardColor,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
