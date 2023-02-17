import 'package:flutter/material.dart';
import 'package:spotify_clone/main.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

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
            child: customAppBar,
          )
        ],
      ),
    );
  }
}
