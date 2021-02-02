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

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  var hunit;
  var wunit;

  Future _getdata() {
    bookingdata.add(bookingdatatype());
    bookingdata.add(bookingdatatype(firstname: "Andreas, online purchase"));
    bookingdata.add(bookingdatatype(firstname: "Tiro Kokuris, new booking"));
    bookingdata.add(bookingdatatype(
        firstname: "Markostinus, has cancelled",
        detail: "at 10.30, Room 3210",
        state: "Cancel"));
    bookingdata.add(bookingdatatype(
        firstname: "Markostinus, new booking",
        detail: "at 10.30, Room 3210",
        state: "Pending"));
    bookingdata.add(bookingdatatype(
        firstname: "Richard cons, in-store purchase",
        detail: "at 10.30, Room 3210"));
    bookingdata.add(bookingdatatype(
        firstname: "Markostinus, has cancelled",
        detail: "at 10.30, Room 3210"));
    bookingdata.add(bookingdatatype(
        firstname: "Markostinus, new booking", detail: "at 10.30, Room 3210"));
    bookingdata.add(bookingdatatype(
        firstname: "Richard cons, in-store purchase",
        detail: "at 10.30, Room 3210"));
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
        floatingActionButton:Container(
          margin: EdgeInsets.only(right: 20),
          width: 60*unit,
          height: 60*unit,
          child:  FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.add,color: Colors.blue,size: 50*unit),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoute.bookingdetail);
          },
        ),),
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
              Container(
                  margin: EdgeInsets.only(top: 70 * hunit),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Booking",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27*unit,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        "Manage and monitor booking in real time",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14*unit,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
              //ntro
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(top:10*hunit,left: 20*hunit,right: 20*hunit),
                  width: size.width,
                  height: 620 * hunit,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: ListView.builder(
                    itemCount: bookingdata.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 30),
                              width: 50 * wunit,
                              child: Text(
                                bookingdata[index].date,
                                style: textStyleBlackbig,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                width: 170 * wunit,
                                child: Column(children: [
                                  Text(
                                    bookingdata[index].firstname,
                                    style: textStyleBlackbig,
                                  ),
                                  Text(
                                    bookingdata[index].detail,
                                    style: textStyleBlack,
                                  ),
                                ])),
                            Container(
                                width: 100 * wunit,
                                child: Column(children: [
                                  Text(
                                    "Status",
                                    style: textStyleBlackbig,
                                  ),
                                  Text(
                                    bookingdata[index].state,
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
