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

class BackgroundScreen extends StatefulWidget {
  @override
  _BackgroundScreenState createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Background Images",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Upload up to 10 virtual background Image",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        body: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
                child: Container(
              height: 760 * hunit,
              child: ListView.builder(
                  itemCount: ((image_urls.length + 1) / 2).round(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: index == 0
                                  ? Image.asset(
                                      "assets/add_image.png",
                                      height: (size.width - 60) / 3,
                                      width: (size.width - 60) / 2,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      image_urls[index * 2],
                                      height: (size.width - 60) / 3,
                                      width: (size.width - 60) / 2,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          if (index * 2 + 1 < image_urls.length)
                            GestureDetector(
                              onTap: () {
                                print("dd");
                                Navigator.pop(context);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.network(
                                  image_urls[index * 2 + 1],
                                  height: (size.width - 60) / 3,
                                  width: (size.width - 60) / 2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          else
                            Container(
                              height: (size.width - 60) / 3,
                              width: (size.width - 60) / 2,
                            )
                        ],
                      ),
                    );
                  }),
            ))));
  }
}
