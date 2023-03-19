import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/widgets/media_buttons.dart';
import 'package:spotify_clone/presentation/widgets/music_player_app_bar.dart';
import 'package:spotify_clone/presentation/widgets/music_player_tools.dart';

import '../custom-theme.dart';

class MusicPlayerScreen extends StatefulWidget {
  MusicPlayerScreen({Key? key}) : super(key: key);

  bool _liked = false;

  double _sliderValue = 0;
  double _songDuration = 5.57;

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  void _sliderChanged(double value) {
    setState(() {
      widget._sliderValue = value;
    });
  }

  void _likeSong() {
    setState(() {
      widget._liked = !widget._liked;
    });
  }

  double _songPassTime() {
    return (widget._sliderValue * widget._songDuration);
  }

  void _return() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 64),
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.width * 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.black, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                MusicPlayerAppBar(
                  shrink: _return,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .9,
                        height: MediaQuery.of(context).size.width * .9,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Song Name",
                                  style: h1,
                                ),
                                Text(
                                  "Artist Name",
                                  style: h2.copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: _likeSong,
                              icon: Icon(
                                widget._liked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 36,
                                color: widget._liked
                                    ? greenTextColor
                                    : Colors.white,
                                fill: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Slider(
                            inactiveColor: Color.fromARGB(255, 39, 39, 39),
                            activeColor: Colors.white,
                            value: widget._sliderValue,
                            onChanged: _sliderChanged,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _songPassTime().toStringAsFixed(2),
                                style: normalText.copyWith(color: Colors.grey),
                              ),
                              Text(
                                widget._songDuration.toString(),
                                style: normalText.copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      MediaButtons(),
                      const MusicPlayerTools(),
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(top: 32),
                        width: MediaQuery.of(context).size.width * .9,
                        height: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      "Lyrcis",
                                      style: h2,
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.share,
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.expand,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Lyrics Here",
                                  style: h1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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





     



        //  Container(
        //       height: MediaQuery.of(context).size.height,
        //       width: MediaQuery.of(context).size.width,
              
        //       decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //           colors: [Colors.red, Colors.black],
        //           begin: Alignment.topLeft,
        //           end: Alignment.bottomRight,
        //         ),
        //       ),
            
        //     ),