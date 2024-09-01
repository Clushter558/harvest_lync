import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:harvest_lync/screens/authentication/phone_auth.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 220,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
              ),
              onPressed: () {
                Navigator.pushNamed(context, PhoneAuth.id);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.phone_android_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Continue with Phone')
                ],
              ),
            ),
          ),
          SignInButton(
              Buttons.Google,
              text: ('Continue with Google')
              , onPressed: () {}
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('OR',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Login with Email',
              style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
