import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

class SearchBarScreen extends StatefulWidget {
  SearchBarScreen({Key? key}) : super(key: key);

  bool showArrow = false;
  bool clickedAppBar = false;
  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen>
    with TickerProviderStateMixin {
  late AnimationController _sceenFadeController;
  late AnimationController _arrowController;
  late AnimationController _scaleUpPaddingController;
  late Animation<double> _animation;
  late Animation<double> _arrowBoxSize;
  late Animation<double> _paddingSize;
  final FocusNode _focusNode = FocusNode();

  String get headerText => "Merhaba";

  @override
  void initState() {
    super.initState();
    _sceenFadeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_sceenFadeController);

    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );

    _arrowBoxSize = Tween(begin: 0.0, end: 30.0).animate(_arrowController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.showArrow = true;
        }
      });

    _scaleUpPaddingController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _paddingSize =
        Tween<double>(begin: 8.0, end: 0.0).animate(_scaleUpPaddingController)
          ..addListener(() {
            setState(() {});
          });

    scaleUpAppBar();
  }

  @override
  void dispose() {
    super.dispose();
    _sceenFadeController.dispose();
    _arrowController.dispose();
    _focusNode.dispose();
  }

  void scaleUpAppBar() {
    widget.clickedAppBar = true;

    _arrowController.forward();
    _scaleUpPaddingController.forward();

    _focusNode.requestFocus();
  }

  void scaleDownAppBar() {
    widget.clickedAppBar = false;

    _arrowController.reverse();
    _scaleUpPaddingController.reverse();

    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    _sceenFadeController.forward();

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
              child: GestureDetector(
                onTap: () {
                  scaleUpAppBar();
                },
                child: Container(
                    margin: EdgeInsets.all(_paddingSize.value),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 69, 69, 69)),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          // padding: const EdgeInsets.all(4),
                          width: _arrowBoxSize.value,
                          child: widget.clickedAppBar
                              ? IconButton(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  onPressed: () {
                                    scaleDownAppBar();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                )
                              : null,
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: _focusNode,
                            onTap: scaleUpAppBar,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              hintText: "What do you want to listen to?",
                              hintStyle: normalText.copyWith(),
                            ),
                            style: normalText.copyWith(),
                          ),
                        ),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ],
                    )),
              ),
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
