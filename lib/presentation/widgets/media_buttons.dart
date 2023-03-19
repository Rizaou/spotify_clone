import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

class MediaButtons extends StatefulWidget {
  MediaButtons({Key? key}) : super(key: key);
  bool _repeat = false;
  bool _shuffle = false;
  @override
  State<MediaButtons> createState() => _MediaButtonsState();
}

class _MediaButtonsState extends State<MediaButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              widget._shuffle = !widget._shuffle;
            });
          },
          icon: Icon(
            Icons.shuffle,
            size: 32,
            color: widget._shuffle ? greenTextColor : Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.white,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 7,
          height: MediaQuery.of(context).size.width / 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.black,
              size: 32,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward,
            size: 32,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget._repeat = !widget._repeat;
            });
          },
          icon: Icon(
            Icons.repeat,
            color: widget._repeat ? greenTextColor : Colors.white,
            size: 32,
          ),
        ),
      ],
    );
  }
}
