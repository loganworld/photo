import 'package:flutter/material.dart';
import 'package:phothpraph/Components/ink_well_custom.dart';
import 'package:phothpraph/theme/style.dart';
import 'package:phothpraph/Components/validations.dart';
import 'package:phothpraph/data/database/userinfo.dart';
import 'package:phothpraph/router.dart';
import 'package:phothpraph/theme/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import "dart:io";

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool autovalidate = false;
  bool agree = true;
  Validations validations = new Validations();
  bool loginsuccess = true;
  void test() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Signup is wrong",
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
            decoration: BoxDecoration(color: Colors.grey[800].withAlpha(235)),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                30 * wunit, 60 * hunit, 30 * wunit, 40 * hunit),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: headingWhite,
                  ),
                  SizedBox(
                    height: 10 * hunit,
                  ),
                  Container(
                    height: 120 * hunit,
                    width: size.width,
                    child: Stack(
                      children: [
                        Text("  Sign Up to join", style: textStyleWhite),
                        Positioned(
                          right: 0 * wunit,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: picchecked
                                    ? Image.file(file).image
                                    : Image(
                                        image:
                                            AssetImage("assets/profilepic.png"),
                                      ).image,
                              ),
                            ),
                            width: 120 * hunit,
                            height: 120 * hunit,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: -20 * wunit,
                            child: Container(
                                height: 30 * wunit,
                                child: MaterialButton(
                                    shape: CircleBorder(
                                        side: BorderSide(
                                            width: 0,
                                            color: Colors.grey,
                                            style: BorderStyle.solid)),
                                    child: Icon(
                                      Icons.add,
                                      size: 25 * wunit,
                                      color: Colors.white,
                                    ),
                                    color: Colors.red,
                                    onPressed: () async {
                                      FilePickerResult result;
                                      result =
                                          await FilePicker.platform.pickFiles();
                                      if (result != null) {
                                        picchecked = true;
                                        file = File(result.files.single.path);
                                      }
                                    })))
                      ],
                    ),
                  ),
                  //username
                  Text(
                    "Name",
                    style: textStyleWhite,
                  ),
                  Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[900].withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5)),
                      height: 70 * hunit,
                      margin: EdgeInsets.fromLTRB(0, 20 * hunit, 0, 20 * hunit),
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
                                    style: textStyleWhite,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'User Name',
                                        hintStyle: textStyleWhite,
                                        labelStyle: textStyleWhite,
                                        suffixStyle: textStyleWhite))),
                          ),
                        ],
                      )),
                  //username
                  Text(
                    "Email",
                    style: textStyleWhite,
                  ),
                  Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[900].withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5)),
                      height: 70 * hunit,
                      margin: EdgeInsets.fromLTRB(0, 20 * hunit, 0, 20 * hunit),
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
                                    style: textStyleWhite,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'username@email.com',
                                        hintStyle: textStyleWhite,
                                        labelStyle: textStyleWhite,
                                        suffixStyle: textStyleWhite))),
                          ),
                        ],
                      )),
                  //password
                  Text(
                    "Password",
                    style: textStyleWhite,
                  ),
                  Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[900].withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5)),
                      height: 70 * hunit,
                      margin: EdgeInsets.fromLTRB(0, 20 * hunit, 0, 20 * hunit),
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
                                    obscureText: true,
                                    onSaved: (value) {
                                      userinfo.password = value;
                                    },
                                    style: textStyleWhite,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Set Password',
                                        hintStyle: textStyleWhite,
                                        labelStyle: textStyleWhite,
                                        suffixStyle: textStyleWhite))),
                          ),
                        ],
                      )),
                  //forget password
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoute.forgotPassword);
                      },
                      child: CheckboxListTile(
                          checkColor: Colors.grey[800],
                          activeColor: Colors.red,
                          value: agree,
                          onChanged: (value) {
                            setState(() {
                              agree = value;
                            });
                          },
                          title: Text("I agree to the terms of service",
                              style: textStyleWhite))),
                  //submit
                  Container(
                      width: size.width,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      height: 70 * hunit,
                      margin: EdgeInsets.fromLTRB(0, 10 * hunit, 0, 10 * hunit),
                      child: RaisedButton(
                        color: Colors.red[700],
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoute.home);
                        },
                        child: Text(
                          "Sign Up",
                          style: textStyleWhitebig,
                        ),
                      )),
                  //or
                  Container(
                    width: size.width,
                    height: 30 * hunit,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(color: Colors.white),
                          height: 2,
                          width: 50 * wunit,
                        ),
                        Text(
                          "or",
                          style: textStyleWhite,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(color: Colors.white),
                          height: 2,
                          width: 50 * wunit,
                        ),
                      ],
                    ),
                  ),

                  //sign with social
                  Container(
                      width: size.width,
                      height: 50 * hunit,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned(
                              child: Text("Sign Up with Google or Facebook",
                                  style: textStyleWhite)),
                          Positioned(
                            right: 70 * wunit,
                            child: GestureDetector(
                                child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[500].withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image(
                                  image: AssetImage("assets/google.png"),
                                  height: 20 * hunit),
                            )),
                          ),
                          Positioned(
                            right: 20 * wunit,
                            child: GestureDetector(
                                child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[500].withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image(
                                  image: AssetImage("assets/facebook.png"),
                                  height: 20 * hunit),
                            )),
                          ),
                        ],
                      )),
                  //sign up
                  SizedBox(
                    height: 20 * hunit,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have account? ", style: textStyleWhite),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoute.loginScreen);
                        },
                        child: Text("Sign In", style: textStyleRed),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ])));
  }
}
