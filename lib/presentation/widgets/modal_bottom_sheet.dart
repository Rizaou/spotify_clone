import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

import '../screens/create_playlist_screen.dart';

class ModalBottomSheet extends StatelessWidget {
  ModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Icon(
                      Icons.linear_scale_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "Create",
                      style: h2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CratePlaylistScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Icon(
                            Icons.music_note,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Playlist",
                                style: h2,
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Add song to a new playlist",
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 50,
                      child: Icon(
                        Icons.music_note,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Blend",
                          style: h2,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Combine tastes in a shared playlist with friends",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
