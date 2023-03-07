import 'package:flutter/material.dart';

import '../custom-theme.dart';

class AppBarButton extends StatefulWidget {
  AppBarButton({
    Key? key,
    required this.title,
    required this.onclick,
  }) : super(key: key);

  bool clicked = false;
  String title;
  Function onclick;
  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  void clicked() {
    setState(() {
      widget.onclick();
      widget.clicked = !widget.clicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: clicked,
        child: Container(
          padding: const EdgeInsets.only(
            left: 14,
            right: 14,
            top: 8,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            color: widget.clicked ? appbarButtonClickedColor : null,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.title,
            style: h2,
          ),
        ),
      ),
    );
  }
}
