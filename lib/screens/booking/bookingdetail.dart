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
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class BookingdetailScreen extends StatefulWidget {
  @override
  _BookingdetailScreenState createState() => _BookingdetailScreenState();
}

class _BookingdetailScreenState extends State<BookingdetailScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Validations validations = new Validations();

  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  bool autovalidate = false;
  DateTime checkdate = new DateTime.now();
  DateTime photodate = new DateTime.now();
  TimeOfDay phototime = new TimeOfDay.now();
  DateFormat formatter = DateFormat('MM/DD/yyyy');
  DateFormat timeformatter = DateFormat('MM/DD/yyyy');
  var now = new DateTime.now();

  submit() {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
    } else {
      form.save();
    }

    Navigator.of(context).pushReplacementNamed(AppRoute.booking);
  }

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
              Container(
                  margin: EdgeInsets.only(top: 70 * hunit),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Booking Photoshoot",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27*unit,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        "Please complete form property to avoid issues",
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
                child: new Form(
                  key: formKey,
                  child: Container(
                  padding: EdgeInsets.only(top: 50*hunit,left: 30*hunit,right: 30*hunit),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 15 * hunit),
                                child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    validator: validations.validateName,
                                    onSaved: (value) {},
                                    style: textStyleGrey,
                                    decoration: InputDecoration(
                                        labelText: "Name",
                                        hintStyle: textStyleGrey,
                                        labelStyle: textStyleGrey,
                                        suffixStyle: textStyleGrey))),
                            Container(
                                margin: EdgeInsets.only(bottom: 15 * hunit),
                                child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    validator: validations.validateName,
                                    onSaved: (value) {},
                                    style: textStyleGrey,
                                    decoration: InputDecoration(
                                        labelText: 'Room no',
                                        hintStyle: textStyleGrey,
                                        labelStyle: textStyleGrey,
                                        suffixStyle: textStyleGrey))),
                            Container(
                                margin: EdgeInsets.only(bottom: 15 * hunit),
                                child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    validator: validations.validateName,
                                    onSaved: (value) {
                                      userinfo.phonenumber = value;
                                    },
                                    style: textStyleGrey,
                                    decoration: InputDecoration(
                                        labelText: 'E-mail',
                                        hintStyle: textStyleGrey,
                                        labelStyle: textStyleGrey,
                                        suffixStyle: textStyleGrey))),
                            Container(
                              margin: EdgeInsets.only(bottom: 15 * hunit),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  print(number.phoneNumber);
                                },
                                onInputValidated: (bool value) {
                                  print(value);
                                },
                                selectorConfig: SelectorConfig(
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle:
                                    TextStyle(color: Colors.grey[800]),
                                initialValue: number,
                                formatInput: false,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true, decimal: true),
                                onSaved: (PhoneNumber number) {
                                  print('On Saved: $number');
                                },
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 15 * hunit),
                                child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    validator: validations.validateName,
                                    onSaved: (value) {},
                                    controller: new TextEditingController()
                                      ..text = formatter.format(checkdate),
                                    onTap: () async {
                                      checkdate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.utc(
                                          2000,
                                        ),
                                        firstDate: DateTime.utc(
                                          1950,
                                        ),
                                        lastDate: DateTime.utc(
                                          2050,
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    readOnly: true,
                                    style: textStyleBlackbig,
                                    decoration: InputDecoration(
                                        labelText: 'Checkout Date',
                                        hintStyle: textStyleGrey,
                                        labelStyle: textStyleGrey,
                                        suffixStyle: textStyleGrey))),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: 200 * wunit,
                                      margin:
                                          EdgeInsets.only(bottom: 15 * hunit),
                                      child: TextFormField(
                                          keyboardType: TextInputType.datetime,
                                          validator: validations.validateName,
                                          onSaved: (value) {},
                                          controller:
                                              new TextEditingController()
                                                ..text =
                                                    formatter.format(photodate),
                                          onTap: () async {
                                            photodate = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.utc(
                                                2000,
                                              ),
                                              firstDate: DateTime.utc(
                                                1950,
                                              ),
                                              lastDate: DateTime.utc(
                                                2050,
                                              ),
                                            );
                                            setState(() {});
                                          },
                                          readOnly: true,
                                          style: textStyleBlackbig,
                                          decoration: InputDecoration(
                                              labelText: 'Photoshoot Date',
                                              hintStyle: textStyleGrey,
                                              labelStyle: textStyleGrey,
                                              suffixStyle: textStyleGrey))),
                                  Container(
                                      width: 100 * wunit,
                                      margin:
                                          EdgeInsets.only(bottom: 15 * hunit),
                                      child: TextFormField(
                                          keyboardType: TextInputType.datetime,
                                          validator: validations.validateName,
                                          onSaved: (value) {},
                                          controller:
                                              new TextEditingController()
                                                ..text = DateFormat("HH:mm")
                                                    .format(DateTime(
                                                        now.year,
                                                        now.month,
                                                        now.day,
                                                        phototime.hour,
                                                        phototime.minute)),
                                          onTap: () async {
                                            phototime = await showTimePicker(
                                              context: context,
                                              initialTime: phototime,
                                              builder: (BuildContext context,
                                                  Widget child) {
                                                return Theme(
                                                  data: ThemeData.dark(),
                                                  child: child,
                                                );
                                              },
                                            );
                                            setState(() {});
                                          },
                                          readOnly: true,
                                          style: textStyleBlackbig,
                                          decoration: InputDecoration(
                                              labelText: 'Photoshoot Time',
                                              hintStyle: textStyleGrey,
                                              labelStyle: textStyleGrey,
                                              suffixStyle: textStyleGrey))),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 15 * hunit),
                                child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    validator: validations.validateName,
                                    onSaved: (value) {},
                                    style: textStyleGrey,
                                    decoration: InputDecoration(
                                        labelText: 'Photographer (Optional)',
                                        hintStyle: textStyleGrey,
                                        labelStyle: textStyleGrey,
                                        suffixStyle: textStyleGrey))),
                            Container(
                                margin: EdgeInsets.only(bottom: 15 * hunit),
                                child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    validator: validations.validateName,
                                    onSaved: (value) {
                                      userinfo.phonenumber = value;
                                    },
                                    style: textStyleGrey,
                                    decoration: InputDecoration(
                                        labelText: 'Notices (Optional)',
                                        hintStyle: textStyleGrey,
                                        labelStyle: textStyleGrey,
                                        suffixStyle: textStyleGrey))),
                            Container(
                              height: 60.0,
                              width: size.width,
                              margin: EdgeInsets.fromLTRB(
                                  0, 30 * hunit, 0, 30 * hunit),
                              child: RaisedButton(
                                onPressed: () {
                                  submit();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff0da6ea),
                                          Color(0xff81cff5)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Book Now",
                                      textAlign: TextAlign.center,
                                      style: textStyleWhitebig,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              //container
            ],
          ),
        ));
  }
}
