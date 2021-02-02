import 'package:flutter/material.dart';
import 'package:phothpraph/Components/ink_well_custom.dart';
import 'package:phothpraph/router.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'dart:convert';
import 'package:phothpraph/Components/validations.dart';
import 'package:phothpraph/theme/style.dart';
import 'package:phothpraph/data/database/userinfo.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController controller = TextEditingController();
  String thisText = "";
  int pinLength = 4;
  Validations validations = new Validations();

  bool hasError = false;
  String errorMessage;
@override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var hunit = size.height / 900;
    var wunit = size.width / 390;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
          child: Stack(children: [
          Container(width: size.width,
                  height: size.height,
            decoration: BoxDecoration(color: Colors.white),
          ),
          Container(
            height: size.height,
            padding: EdgeInsets.fromLTRB(
                30 * wunit, 60 * hunit, 30 * wunit, 40 * hunit),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 80 * hunit,
                      width: size.width,
                      child: Stack(
                        children: [
                          Positioned(
                            left: -5,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 40 * hunit,
                              ),
                              onPressed: () => Navigator.of(context)
                                  .pushReplacementNamed(AppRoute.loginScreen),
                            ),
                          )
                        ],
                      )),
                  Container(
                    child: Text('Forgot Password',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30 * hunit,
                            fontWeight: FontWeight.w500)),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25 * hunit),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Lost your password? ', style: textStyleRed),
                              Text('Please enter', style: textStyleGrey),
                            ],
                          ),
                          Text(
                              'your username or email address. you\nwill recieve a link to create a new\npassword via email',
                              style: textStyleGrey),
                        ],
                      )),
                ]),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        30 * wunit, 20 * hunit, 30 * wunit, 40 * hunit),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: size.width - 60 * wunit,
                            decoration: BoxDecoration(
                          color: Colors.white70.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5),
                          //border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200],
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                0.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          ),
                            height: 70 * hunit,
                            margin: EdgeInsets.fromLTRB(
                                0, 20 * hunit, 0, 20 * hunit),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: 20 * wunit,
                                  child: Container(
                                      width: 350 * wunit,
                                      child: TextFormField(
                                          keyboardType: TextInputType.name,
                                          validator: validations.validateName,
                                          onSaved: (value) {
                                            userinfo.email = value;
                                          },
                                          style: textStyleGrey,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Email',
                                              hintStyle: textStyleGrey,
                                              labelStyle: textStyleGrey,
                                              suffixStyle: textStyleGrey))),
                                ),
                              ],
                            )),
                        Container(
                          height: 60.0,
                          width: size.width - 60 * wunit,
                          margin: EdgeInsets.fromLTRB(0, 30 * hunit, 0, 30 * hunit),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoute.loginScreen);
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Color(0xff0da6ea), Color(0xff81cff5)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Sign in",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )))
        ],
      )),
    );
  }
}
