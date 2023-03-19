import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

class MusicPlayerTools extends StatelessWidget {
  const MusicPlayerTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Icon(
                  Icons.headphones_rounded,
                  color: greenTextColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "SONY WH-1000XM3",
                    style: normalText.copyWith(
                      color: greenTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Icon(
              Icons.line_weight_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
