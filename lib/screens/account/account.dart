import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:phothpraph/Components/validations.dart';
import 'package:phothpraph/theme/style.dart';
import 'package:phothpraph/Components/ink_well_custom.dart';
import 'package:phothpraph/data/database/userinfo.dart';
import 'package:phothpraph/router.dart';
import 'dart:io';
import 'package:phothpraph/theme/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:phothpraph/screens/bottom_bar/bottom_bar.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool autovalidate = false;
  bool showpassword = true;
  Validations validations = new Validations();
  bool loginsuccess = true;

    var hunit = 1.0;
    var wunit = 1.0;


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
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
        bottomNavigationBar: Nav_bar(),
        body: SingleChildScrollView(
            child: Container(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  height: 220 * hunit,
                  width: size.width,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 20 * hunit,
                          bottom: 30 * hunit,
                          child: Row(
                            children: [
                              Text("Role : ", style: textStyleRed),
                            ],
                          )),
                      //profile image
                      Positioned(
                        top: 30 * hunit,
                        left: 20 * wunit,
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
                          width: 100 * hunit,
                          height: 100 * hunit,
                        ),
                      ),
                      //profile edit button
                      Positioned(
                          top: 100 * hunit,
                          left: 50 * wunit,
                          child: Container(
                              height: 22 * wunit,
                              child: MaterialButton(
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          width: 0,
                                          color: Colors.grey,
                                          style: BorderStyle.solid)),
                                  child: Icon(
                                    Icons.edit,
                                    size: 13 * wunit,
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
                                  }))),
                      //name and mail
                      Positioned(
                          top: 50 * hunit,
                          left: 160 * hunit,
                          child: Text(userinfo.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500))),
                      Positioned(
                          top: 80 * hunit,
                          left: 160 * hunit,
                          child: Text(userinfo.email,
                              style:
                                  TextStyle(color: greyColor, fontSize: 20))),
                    ],
                  ),
                ),
                //membership
                Container(
                  padding: EdgeInsets.all(20 * wunit),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //buttons
                      SingleChildScrollView(
                        child: Row(
                          children: [
                            Container(
                                width: 120 * wunit,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                height: 50 * hunit,
                                margin: EdgeInsets.all(5),
                                child: RaisedButton(
                                  color: active == 0
                                      ? Colors.red[700]
                                      : Colors.grey[800],
                                  onPressed: () {},
                                  child: Text(
                                    "Membership",
                                    style: textStyleWhite,
                                  ),
                                )),
                            Container(
                                width: 120 * wunit,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                height: 50 * hunit,
                                margin: EdgeInsets.all(5),
                                child: RaisedButton(
                                  color: active == 1
                                      ? Colors.red[700]
                                      : Colors.grey[800],
                                  onPressed: () {},
                                  child: Text(
                                    "Address",
                                    style: textStyleWhite,
                                  ),
                                )),
                            Container(
                                width: 150 * wunit,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                height: 50 * hunit,
                                margin: EdgeInsets.all(5),
                                child: RaisedButton(
                                  color: active == 1
                                      ? Colors.red[700]
                                      : Colors.grey[800],
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRoute.setting);
                                  },
                                  child: Text(
                                    "Account Detail",
                                    style: textStyleWhite,
                                  ),
                                )),
                          ],
                        ),
                        scrollDirection: Axis.horizontal,
                      ),
                      //magazine subcription
                      Container(
                        padding: EdgeInsets.only(
                            top: 30 * hunit, bottom: 30 * hunit),
                        child: Text(
                          "Magazines Subscription Standard",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      //start
                      Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[200],
                                    spreadRadius: 30,
                                    blurRadius: 30)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.only(
                              top: 25 * hunit,
                              left: 20 * wunit,
                              bottom: 25 * hunit,
                              right: 20 * wunit),
                          margin:
                              EdgeInsets.fromLTRB(0, 20 * hunit, 0, 20 * hunit),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Start", style: textStyleBlack),
                              Text(userinfo.starttime, style: textStyleRed),
                            ],
                          )),
                      //start
                      Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[200],
                                    spreadRadius: 30,
                                    blurRadius: 30)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.only(
                              top: 25 * hunit,
                              left: 20 * wunit,
                              bottom: 25 * hunit,
                              right: 20 * wunit),
                          margin:
                              EdgeInsets.fromLTRB(0, 20 * hunit, 0, 20 * hunit),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("End", style: textStyleBlack),
                              Text(userinfo.endtime, style: textStyleRed),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
