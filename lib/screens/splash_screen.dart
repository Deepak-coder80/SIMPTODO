import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splash: Image.asset('assets/images/logo.png',
      width: 450,height: 450,),
      nextScreen: const HomeScreen(),
      splashIconSize: 300,
    );
  }
}
