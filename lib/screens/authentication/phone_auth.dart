import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../../services/phoneauth.dart';

class PhoneAuth extends StatefulWidget {
  static const String id = 'phone-auth';

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}


class _PhoneAuthState extends State<PhoneAuth> {

  bool validate = false;

  var countryCodeController = TextEditingController(text: '+91');
  var phonenoController = TextEditingController();

  showAlertDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
          SizedBox(width: 8),
          Text('Verifying')
        ],
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context, builder : (BuildContext context){
      return alert;
    });
  }

  PhoneAuthentication _service= PhoneAuthentication();

  @override


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black,),
        title: Text('Login', style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red.shade200,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                color: Colors.red,
                size: 60,
              ),
            ),
            SizedBox(height: 12,),
            Text(
              'Enter your Phone',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Text('Conformation will be sent to phone', style: TextStyle(color: Colors.grey),),
            Row(
              children: [
                Expanded(flex:1,child: TextFormField(
                  controller: countryCodeController,
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: 'Country Code'
                  ),
                )),
                SizedBox(width: 10,),
                Expanded(flex:3,child: TextFormField(
                  onChanged: (value){
                    if(value.length==10) {
                      setState(() {
                        validate = true;
                      });
                    }
                    if(value.length<10) {
                      setState(() {
                        validate = false;
                      });
                    }
                  },
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: phonenoController,
                  decoration: InputDecoration(
                      labelText: 'Phone Number'
                  ),
                )),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AbsorbPointer(
            absorbing: validate ? false: true,
            child: ElevatedButton(onPressed: () {
              String number='${countryCodeController.text}${phonenoController.text}';
              showAlertDialog(context);
              _service.verifyPhoneNumber(context, number);

            },style: ButtonStyle(backgroundColor: validate ? MaterialStateProperty.all(Theme.of(context).primaryColor) : MaterialStateProperty.all(Colors.grey),),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Next'),
              ),),
          ),
        ),
      ),
    );
  }
}
