import 'dart:async';
import 'package:flutter/material.dart';
import 'package:the_shop/pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 500), () {
      Navigator.push(
          // ignore: prefer_const_constructors
          context,
          MaterialPageRoute(builder: (context) => const OnboardingPage()));
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(71.0, 0.0, 72.0, 0.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/icon.png',
                width: 500,
                height: 500,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
