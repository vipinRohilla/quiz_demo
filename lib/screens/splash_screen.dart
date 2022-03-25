import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quiz_application/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                radius: 0.7,
                center: Alignment.center,
                colors: [Colors.pink, Colors.purple])),
        child: Center(
          child: AnimatedTextKit(animatedTexts: [
            TypewriterAnimatedText("QUIZ",
                speed: const Duration(milliseconds: 80),
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold)),
            TypewriterAnimatedText("App",
                speed: const Duration(milliseconds: 80),
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }
}
