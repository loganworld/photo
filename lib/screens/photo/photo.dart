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
import 'package:photo_view/photo_view.dart';

class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Map<String, dynamic> image_info = {
    "Camera_Model": "Nikon D3",
    "File_Name": "DSC_217272.jpg",
    "File_Modified": "9/6/2020, 3:43",
    "File_Size": "8.06 MB",
    "Image_Size": "4000X3000",
    "Resolution": "300",
    "Color_Depth": "16.7 million",
    "Color_Type": "RGB",
  };
  var hunit;
  var wunit;
  bool info_show = true;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    hunit = size.height / 390;
    wunit = size.width / 760;
    return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pushReplacementNamed(AppRoute.home);
        },
        child: Scaffold(
          body: Row(
            children: [
              Container(
                width: 680 * wunit,
                height: size.height,
                child: Stack(
                  children: [
                    Positioned(
                        top: 60 * hunit,
                        left: 0,
                        child: Container(
                            width: info_show ? 620 * wunit : 680 * wunit,
                            height: 330 * hunit,
                            child: PhotoView(
                              initialScale: PhotoViewComputedScale.covered,
                              imageProvider: AssetImage("assets/ai.png"),
                            ))),
                    Positioned(
                        top: 0,
                        child: Container(
                            height: 60 * hunit,
                            width: 680 * wunit,
                            decoration:
                                BoxDecoration(color: Colors.blueGrey[50]),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "  Global Photography | ",
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 18 * unit,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(userinfo.name + "      ",
                                            style: textStyleGrey),
                                      ],
                                    ),
                                  ),
                                  //top buttons
                                  Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.qr_code,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {},
                                        ),
                                        SizedBox(width: 2 * unit),
                                        IconButton(
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {},
                                        ),
                                        SizedBox(width: 2 * unit),
                                        IconButton(
                                          icon: Icon(
                                            Icons.compare,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {},
                                        ),
                                        SizedBox(width: 2 * unit),
                                        IconButton(
                                          icon: Icon(
                                            Icons.cloud_upload,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {},
                                        ),
                                        SizedBox(width: 2 * unit),
                                        IconButton(
                                          icon: Icon(
                                            Icons.wifi,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {},
                                        ),
                                        SizedBox(width: 2 * unit),
                                        IconButton(
                                          icon: Icon(
                                            Icons.bluetooth,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {},
                                        ),
                                        SizedBox(width: 2 * unit),
                                        IconButton(
                                          icon: Icon(
                                            Icons.battery_full,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))),
                    if (info_show)
                      Positioned(
                          top: 60 * hunit,
                          right: 0,
                          child: Stack(children: [
                            Container(
                              width: 200 * wunit,
                              height: 330 * hunit,
                              decoration: BoxDecoration(color: Colors.white),
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 2 * hunit),
                                      Text("Camera Model",
                                          style: textStyleBlackbold),
                                      SizedBox(height: 2 * hunit),
                                      Text(image_info["Camera_Model"],
                                          style: textStyleGrey),
                                      SizedBox(height: 2 * hunit),
                                      Text("File Name",
                                          style: textStyleBlackbold),
                                      SizedBox(height: 2 * hunit),
                                      Text(image_info["File_Name"],
                                          style: textStyleGrey),
                                      SizedBox(height: 2 * hunit),
                                      Text("File Modified",
                                          style: textStyleBlackbold),
                                      SizedBox(height: 2 * hunit),
                                      Text(image_info["File_Modified"],
                                          style: textStyleGrey),
                                      SizedBox(height: 2 * hunit),
                                      Text("File Size",
                                          style: textStyleBlackbold),
                                      SizedBox(height: 2 * hunit),
                                      Text(image_info["File_Size"],
                                          style: textStyleGrey),
                                      SizedBox(height: 2 * hunit),
                                      Text("Image Size",
                                          style: textStyleBlackbold),
                                      SizedBox(height: 2 * hunit),
                                      Text(image_info["Image_Size"],
                                          style: textStyleGrey),
                                      SizedBox(height: 2 * hunit),
                                      Text("Resolution",
                                          style: textStyleBlackbold),
                                      SizedBox(height: 2 * hunit),
                                      Text(image_info["Resolution"],
                                          style: textStyleGrey),
                                      SizedBox(height: 2 * hunit),
                                      Text("Color Depth",
                                          style: textStyleBlackbold),
                                      SizedBox(height: 2 * hunit),
                                      Text(image_info["Color_Depth"],
                                          style: textStyleGrey),
                                      SizedBox(height: 2 * hunit),
                                      Text("Color Type",
                                          style: textStyleBlackbold),
                                      SizedBox(height: 2 * hunit),
                                      Text(image_info["Color_Type"],
                                          style: textStyleGrey),
                                      SizedBox(height: 2 * hunit),
                                    ]),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    info_show = false;
                                  });
                                },
                                child: Container(
                                    width: 200 * wunit,
                                    decoration:
                                        BoxDecoration(color: Colors.grey[300]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(width: 40 * wunit),
                                        Text("Hide", style: textStyleBlack),
                                        Icon(Icons.keyboard_arrow_right)
                                      ],
                                    )),
                              ),
                            )
                          ]))
                  ],
                ),
              ),
              Container(
                width: 80 * wunit,
                decoration: BoxDecoration(color: Colors.blueGrey[800]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          info_show = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 20 * hunit),
                        child: Column(
                          children: [
                            Icon(
                              Icons.filter_2,
                              color: Colors.white,
                              size: 25 * unit,
                            ),
                            SizedBox(
                              height: 10 * unit,
                            ),
                            Text("QR LIST",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12 * unit,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.qr_code_scanner,
                              color: Colors.white,
                              size: 25 * unit,
                            ),
                            SizedBox(
                              height: 2 * unit,
                            ),
                            Text("SCAN\nIMAGES\n238",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12 * unit,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 30 * unit,
                            ),
                            SizedBox(
                              height: 5 * hunit,
                            ),
                            Text("MOBILE\nSHOOT",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12 * unit,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.cloud_upload,
                              color: Colors.white,
                              size: 30 * unit,
                            ),
                            Text("QUEUE\nUPLOADS\n432",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12 * unit,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
