import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/custom-theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_fadeAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    _fadeAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fadeAnimationController.forward();
    return SafeArea(
        child: FadeTransition(
      opacity: _fadeAnimation,
      child: Center(
        child: Text(
          "HOME SCREEN",
          style: h1,
        ),
      ),
    ));
  }
}
