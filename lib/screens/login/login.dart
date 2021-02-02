import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:phothpraph/Components/validations.dart';
import 'package:phothpraph/theme/style.dart';
import 'package:phothpraph/Components/ink_well_custom.dart';
import 'package:phothpraph/data/database/userinfo.dart';
import 'package:phothpraph/router.dart';
import 'dart:io';
import 'package:phothpraph/theme/style.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool autovalidate = false;
  bool showpassword = true;
  Validations validations = new Validations();
  bool loginsuccess = true;

  void test() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "login is wrong",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          FlatButton(
              color: Colors.green,
              child: Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  submit() {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
    } else {
      form.save();
    }
  }

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
          Positioned(
              child: Image(
                  image: AssetImage("assets/background.png"),
                  width: size.width,
                  height: size.height)),
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(color: Colors.white),
          ),

          //form
          new Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  30 * wunit, 30 * hunit, 30 * wunit, 40 * hunit),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back",
                      style: headingWhite,
                    ),
                    SizedBox(
                      height: 40 * hunit,
                    ),
                    //logo
                    Container(
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(
                              image: AssetImage("assets/logo_icon.png"),
                              width: 150,
                              fit: BoxFit.fitWidth),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //or
                    Container(
                      margin: EdgeInsets.only(top: 50 * hunit),
                      width: size.width,
                      height: 30 * hunit,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Login to your Account",
                            style: textStyleGreybig,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white70.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5),
                          //border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[100],
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 20.0, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                0.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        height: 60 * hunit,
                        margin:
                            EdgeInsets.fromLTRB(0, 30 * hunit, 0, 10 * hunit),
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
                                        userinfo.phonenumber = value;
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
                    //password
                    Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white70.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5),
                          //border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[100],
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 20.0, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                0.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        height: 60 * hunit,
                        margin:
                            EdgeInsets.fromLTRB(0, 20 * hunit, 0, 10 * hunit),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Positioned(
                              left: 20 * wunit,
                              child: Container(
                                  width: 350 * wunit,
                                  child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      validator: validations.validatePassword,
                                      obscureText: showpassword,
                                      onSaved: (value) {
                                        userinfo.password = value;
                                      },
                                      style: textStyleGrey,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                        hintStyle: textStyleGrey,
                                        labelStyle: textStyleGrey,
                                        suffixStyle: textStyleGrey,
                                      ))),
                            ),
                            Positioned(
                              right: 20 * size.width / 390,
                              top: 15 * size.height / 750,
                              child: GestureDetector(
                                child: Icon(
                                  showpassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 25,
                                  color: Colors.grey[700],
                                ),
                                onTap: () {
                                  setState(() {
                                    showpassword = !showpassword;
                                  });
                                },
                              ),
                            )
                          ],
                        )),

                    //submit
                    Container(
                      height: 60.0,
                      width: size.width,
                      margin: EdgeInsets.fromLTRB(0, 30 * hunit, 0, 30 * hunit),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoute.home);
                          Navigator.of(context).pushNamed(AppRoute.home);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff0da6ea), Color(0xff81cff5)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Sign in",
                              textAlign: TextAlign.center,
                              style: textStyleWhitebig,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //or
                    Container(
                      width: size.width,
                      height: 30 * hunit,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "OR",
                            style: textStyleGrey,
                          ),
                        ],
                      ),
                    ),
                    //sign up
                    Container(
                      width: size.width,
                      height: 60 * hunit,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 120 * wunit,
                            child: IconButton(
                                icon: Icon(Icons.fingerprint,
                                    size: 80 * wunit, color: Colors.blue),
                                onPressed: () {}),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70 * hunit,
                    ),
                    //forget password
                    Container(
                      width: size.width,
                      height: 30 * hunit,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoute.forgotPassword);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: textStyleGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ])));
  }
}
