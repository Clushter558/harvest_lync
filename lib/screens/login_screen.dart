import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harvest_lync/screens/location_screen.dart';
import 'package:harvest_lync/widgets/auth_ui.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-screen';
  @override
  Widget build(BuildContext context) {



    const Color myColor1 = Color(0xFFB2DE49);
    const Color myColor2 = Color(0xFF9A6735);

    return Scaffold(
        backgroundColor: myColor1,
        body: Column(
          children: [
            Expanded(child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png',height: 300,),
                  Text('HarvestLync',style: TextStyle(
                    fontFamily: 'KGPP',
                    fontSize: 40,
                    color: myColor2,
                  ),)
                ],
              ),
            ),),
            Expanded(child: Container(
              child: Auth(),
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('By Continuing, you accept the \n Terms and Conditions and Privacy Policy',textAlign: TextAlign.center, style:TextStyle(color: Colors.black, fontSize: 10) ,),
            )
          ],
        )
    );
  }
}
