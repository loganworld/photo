import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:phothpraph/Components/validations.dart';
import 'package:phothpraph/data/datamodel/datatypes.dart';
import 'package:phothpraph/theme/style.dart';
import 'package:phothpraph/data/database/userinfo.dart';
import 'package:phothpraph/router.dart';
import 'dart:io';
import 'package:phothpraph/theme/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:phothpraph/screens/bottom_bar/bottom_bar.dart';
import 'package:flutter/services.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  var hunit;
  var wunit;


  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    hunit = size.height / 900;
    wunit = size.width / 390;
    return Scaffold(
        bottomNavigationBar: Nav_bar(),
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0da6ea), Color(0xff81cff5)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Stack(
            children: [
              //header
              Positioned(
                top: 50 * hunit,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: size.width,
                  height: 300 * wunit,
                  child: Stack(
                    children: [
                      //name and email
                     Positioned(
                        top: 30 * hunit,
                        left: 110 * wunit,
                        child: Container(
                          width: size.width,
                          height: 300 * wunit,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userinfo.firstname,
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 18*unit,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 5 * hunit),
                              Text(
                                userinfo.email,
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 14*unit,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //image
                     Positioned(
                        top: 0 * hunit,
                        left: 0 * wunit,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
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
                          width: 110 * hunit,
                          height: 110 * hunit,
                        ),
                      ),
                    //edit
                   Positioned(
                     right: 0,
                     top: 40*unit,
                     child: IconButton(icon: Icon(Icons.edit,size:30,color:Colors.grey[800]),onPressed: (){

                   },),)
                    ],
                  ),
                ),
              ),
              //ntro
              Positioned(
                bottom: 0,
                child: Container(
                    padding: EdgeInsets.only(
                        top: 50 * hunit, left: 30 * hunit, right: 30 * hunit),
                    width: size.width,
                    height: 620 * hunit,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        //security
                        Container(
                            padding: EdgeInsets.only(
                                top: 15 * hunit, bottom: 30 * hunit),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 10, bottom: 10),
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[300],
                                              width: 2))),
                                  child: Text("Security",
                                      style: textStyleBlueBold),
                                ),
                                rowbutton(
                                    text: "Change Passward", ontap: () {}),
                                scrollbutton(
                                    text: "Finger Print Login",
                                    ontap: () {},
                                    id: 0),
                              ],
                            )),
                        //Green screen
                        Container(
                            padding: EdgeInsets.only(
                                top: 15 * hunit, bottom: 30 * hunit),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 10, bottom: 10),
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[300],
                                              width: 2))),
                                  child: Text("Green Screen",
                                      style: textStyleBlueBold),
                                ),
                                rowbutton(
                                    text: "Virtual Background",
                                    ontap: () {
                                      Navigator.of(context)
                                          .pushNamed(AppRoute.backgroundimage);
                                    }),
                                scrollbutton(
                                    text: "Virtual Forground",
                                    ontap: () {},
                                    id: 1),
                              ],
                            )),
                        //General
                        Container(
                            padding: EdgeInsets.only(
                                top: 15 * hunit, bottom: 30 * hunit),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 10, bottom: 10),
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[300],
                                              width: 2))),
                                  child:
                                      Text("General", style: textStyleBlueBold),
                                ),
                                scrollbutton(
                                    text: "Change Passward",
                                    ontap: () {},
                                    id: 2),
                                rowbutton(
                                    text: "Change Language", ontap: () {}),
                                rowbutton(
                                    text: "Term & Conditions", ontap: () {}),
                                rowbutton(text: "Privacy Policy", ontap: () {}),
                                rowbutton(text: "Rate Us", ontap: () {}),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        AppRoute.loginScreen);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 20,
                                        bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Log Out",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ))),
              ),
              //container
            ],
          ),
        ));
  }

  Widget rowbutton({text, ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.grey[300], width: 2))),
        padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[700]),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }

  Widget scrollbutton({text, ontap, id = 0}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[300], width: 2))),
          child: SwitchListTile(
            onChanged: (v) {
              setState(() {
                setting_enables[id] = !setting_enables[id];
              });
            },
            title: Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[700]),
            ),
            value: setting_enables[id],
          )),
    );
  }
}
