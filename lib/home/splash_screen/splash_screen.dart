import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animation_splash.json',
    );
  }

  goToHome() async {
    await Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false));
  }
}
