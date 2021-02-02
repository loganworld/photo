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

class Nav_bar extends StatelessWidget {
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: cindex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        cindex = value;
        if (cindex == 0)
          Navigator.of(context).pushReplacementNamed(AppRoute.home);
        if (cindex == 1) Navigator.of(context).pushReplacementNamed(AppRoute.statistics);
       if (cindex == 3) Navigator.of(context).pushReplacementNamed(AppRoute.booking);
       if (cindex == 2) Navigator.of(context).pushReplacementNamed(AppRoute.photo);
       if (cindex == 4)
          Navigator.of(context).pushReplacementNamed(AppRoute.setting);
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Container(
            child: Icon(Icons.home,size: 40,),
            margin: EdgeInsets.only(top: 10),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Analysis',
          icon: Container(
            child: Icon(Icons.equalizer,size: 40,),
            margin: EdgeInsets.only(top: 10),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Shoot',
          icon: Container(
            child: Icon(Icons.camera,size: 40,),
            margin: EdgeInsets.only(top: 10),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Booking',
          icon: Container(
            child: Icon(Icons.insert_invitation,size: 40,),
            margin: EdgeInsets.only(top: 10),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Container(
            child: Icon(Icons.settings,size: 40,),
            margin: EdgeInsets.only(top: 10),
          ),
        ),
      ],
    );
  }
}
