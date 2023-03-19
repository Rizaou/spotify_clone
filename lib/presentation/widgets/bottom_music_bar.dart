import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';
import 'package:spotify_clone/presentation/screens/music_player_screen.dart';

class BottomMusicBar extends StatefulWidget {
  BottomMusicBar({Key? key}) : super(key: key);

  @override
  State<BottomMusicBar> createState() => _BottomMusicBarState();
}

class _BottomMusicBarState extends State<BottomMusicBar> {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MusicPlayerScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(_createRoute()),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color.fromARGB(255, 33, 74, 106),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 6,
              ),
              height: 60,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Song Name",
                      style: normalText.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "SONY WH-1000XM3",
                      style: normalText.copyWith(
                          color: greenTextColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.headset,
                    color: greenTextColor,
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
