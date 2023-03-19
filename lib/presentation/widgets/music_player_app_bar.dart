import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

class MusicPlayerAppBar extends StatelessWidget {
  MusicPlayerAppBar({
    Key? key,
    required this.shrink,
  }) : super(key: key);

  Function shrink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        children: [
          IconButton(
            onPressed: () => shrink(),
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PLAYING FROM ARTIST",
                    style: normalText.copyWith(),
                  ),
                  Text(
                    "Artist Name",
                    style: normalText.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.linear_scale_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
