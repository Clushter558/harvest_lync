import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:harvest_lync/screens/location_screen.dart';
import 'package:harvest_lync/screens/login_screen.dart';
class SplashScreen extends StatefulWidget {

  static const String id='splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();  // Call this first

    // Delay for 3 seconds and then check the auth state
    Timer(Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        } else {
          Navigator.pushReplacementNamed(context, LocationScreen.id);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    const Color myColor1 = Color(0xFFB2DE49);
    const Color myColor2 = Color(0xFFffffff);
    const Color myColor3 = Color(0xFFffff66);

    const colorizeColors = [
      myColor2,
      myColor3,
    ];

    const colorizeTextStyle = TextStyle(
        fontSize: 50.0,
        fontFamily: 'KGPP',
        fontWeight: FontWeight.bold
    );

    const double kAnimationWidth = 250.0;

    return Scaffold(
      backgroundColor: myColor1,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 10),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'HarvestLync',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,

                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          ],
        ),
      ),
    );
  }
}