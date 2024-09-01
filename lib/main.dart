import 'package:flutter/material.dart';
import 'package:harvest_lync/screens/authentication/phone_auth.dart';
import 'package:harvest_lync/screens/location_screen.dart';
import 'package:harvest_lync/screens/login_screen.dart';
import 'package:harvest_lync/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green.shade300,
        fontFamily: 'KGPP',
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        PhoneAuth.id: (context) => PhoneAuth(),
        LocationScreen.id: (context) => LocationScreen(),
      },
    );

    /*FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.green.shade300,
                fontFamily: 'KGPP',
              ),
              home: SplashScreen());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.green.shade300,
              fontFamily: 'KGPP',
            ),
            home: LoginScreen(),
            routes: {
              LoginScreen.id: (context) => LoginScreen(),
              PhoneAuth.id: (context) => PhoneAuth(),
              LocationScreen.id: (context) => LocationScreen(),
            },
          );
        }
      },
    );*/
  }
}