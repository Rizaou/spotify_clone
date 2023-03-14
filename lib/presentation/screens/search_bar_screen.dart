import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

class SearchBarScreen extends StatefulWidget {
  SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen>
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Color.fromARGB(255, 40, 40, 40)),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 69, 69, 69)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "What do you want to listen to?",
                        style: normalText,
                      )),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ],
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(left: 14),
              alignment: Alignment.centerLeft,
              height: 50,
              child: Text(
                "Recent searches",
                style: h2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
