import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

class LibraryItems extends StatelessWidget {
  LibraryItems({
    Key? key,
    required this.title,
    required this.subtitle,
    this.color = Colors.red,
  }) : super(key: key);
  final Color color;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Container(
          color: color,
        ),
      ),
      title: Text(
        title,
        style: h2,
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
