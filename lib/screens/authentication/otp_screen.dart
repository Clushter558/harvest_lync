import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harvest_lync/screens/authentication/phone_auth.dart';
import 'package:harvest_lync/screens/location_screen.dart';

class OtpScreen extends StatefulWidget {
  final String? number, verId;
  OtpScreen({this.number, this.verId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _loading = false;
  String error = '';


  var otp1 = TextEditingController();
  var otp2 = TextEditingController();
  var otp3 = TextEditingController();
  var otp4 = TextEditingController();
  var otp5 = TextEditingController();
  var otp6 = TextEditingController();

  Future<void> phoneCredential(BuildContext context, String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verId!, smsCode: otp);
      final User? user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        Navigator.pushReplacementNamed(context, LocationScreen.id);
      } else {
        if (mounted) {
          setState(() {
            error = 'Login Failed';
            _loading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          error = 'Invalid OTP';
          _loading = false;
        });
      }
    }
  }

  Color myColor1 = Color(0xFFB2DE49);
  Color myColor3 = Color(0xFFffff66);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor1,
        title: Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red.shade200,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                size: 60,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome Back',
              style: TextStyle(fontFamily: 'KGPP', fontSize: 19),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "We sent a 6 digit code to: ",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                      children: [
                        TextSpan(
                          text: widget.number,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneAuth()),
                    );
                  },
                  child: Icon(Icons.edit),
                ),
              ],
            ),
            SizedBox(height: 13),
            Row(
              children: [
                _buildOtpField(context, otp1, node),
                SizedBox(width: 10),
                _buildOtpField(context, otp2, node),
                SizedBox(width: 10),
                _buildOtpField(context, otp3, node),
                SizedBox(width: 10),
                _buildOtpField(context, otp4, node),
                SizedBox(width: 10),
                _buildOtpField(context, otp5, node),
                SizedBox(width: 10),
                _buildOtpField(context, otp6, node),
              ],
            ),
            SizedBox(height: 18),
            if (_loading)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 50,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                ),
              ),
            SizedBox(height: 18),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, TextEditingController controller,
      FocusScopeNode node) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(border: OutlineInputBorder()),
        onChanged: (value) {
          if (value.length == 1) {
            node.nextFocus();
          }
          if (_isOtpComplete()) {
            String _otp = _getFullOtp();
            if (_otp.length == 6) {
              setState(() {
                _loading = true;
              });
              phoneCredential(context, _otp);
            }
          } else {
            setState(() {
              error = '';
            });
          }
        },
      ),
    );
  }

  bool _isOtpComplete() {
    return otp1.text.isNotEmpty &&
        otp2.text.isNotEmpty &&
        otp3.text.isNotEmpty &&
        otp4.text.isNotEmpty &&
        otp5.text.isNotEmpty &&
        otp6.text.isNotEmpty;
  }

  String _getFullOtp() {
    return '${otp1.text}${otp2.text}${otp3.text}${otp4.text}${otp5.text}${otp6.text}';
  }
}
