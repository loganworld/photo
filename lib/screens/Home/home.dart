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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  var hunit;
  var wunit;

  Future _getdata() {
    userdata.add(userdatatype());
    userdata.add(userdatatype(header: "Andreas, online purchase"));
    userdata.add(userdatatype(header: "Tiro Kokuris, new booking"));
    userdata.add(userdatatype(
        header: "Markostinus, has cancelled", body: "at 10.30, Room 3210"));
    userdata.add(userdatatype(
        header: "Markostinus, new booking", body: "at 10.30, Room 3210"));
    userdata.add(userdatatype(
        header: "Richard cons, in-store purchase",
        body: "at 10.30, Room 3210"));
    userdata.add(userdatatype(
        header: "Markostinus, has cancelled", body: "at 10.30, Room 3210"));
    userdata.add(userdatatype(
        header: "Markostinus, new booking", body: "at 10.30, Room 3210"));
    userdata.add(userdatatype(
        header: "Richard cons, in-store purchase",
        body: "at 10.30, Room 3210"));
  }

  @override
  void initState() {
    super.initState();
    _getdata();
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
                top: 80 * hunit,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: size.width,
                  height: 300,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width,
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Morning, " + userinfo.firstname,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27*unit,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 20 * hunit),
                            Text(
                              "You have today:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16*unit),
                            ),
                            Container(
                              width: 140,
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Booking",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16*unit),
                                    ),
                                    Text(
                                      userinfo.booking.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16*unit),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Pending",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16*unit),
                                    ),
                                    Text(
                                      userinfo.panding.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16*unit),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sold",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16*unit),
                                    ),
                                    Text(
                                      userinfo.sold.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16*unit),
                                    ),
                                  ],
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0 * hunit,
                        right: 0 * wunit,
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
                          width: 140 * hunit,
                          height: 140 * hunit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //ntro
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(top: 10*hunit,left: 20*hunit,right: 20*hunit),
                  width: size.width,
                  height: 520 * hunit,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: ListView.builder(
                    itemCount: userdata.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 30),
                              width: 50 * wunit,
                              child: Text(
                                userdata[index].date,
                                style: textStyleBlackbig,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                width: 250 * wunit,
                                child: Column(children: [
                                  Text(
                                    userdata[index].header,
                                    style: textStyleBlackbig,
                                  ),
                                  Text(
                                    userdata[index].body,
                                    style: textStyleBlack,
                                  ),
                                ])),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              //container
            ],
          ),
        ));
  }
}
