import 'package:phothpraph/data/datamodel/datatypes.dart';
import "dart:io";

userinfotype userinfo = new userinfotype();
int selecteditem = 0;
bool imagepicked = false;
String fcmToken = "";
String tripid = "10000000";
File file;
bool picchecked = false;
int active = 0;
int cindex = 0;
List<userdatatype> userdata = [];
List<bookingdatatype> bookingdata = [];
List<bool> setting_enables = [true, true, true];
List<String> image_urls = [
  'https://images.pexels.com/photos/257360/pexels-photo-257360.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260',
  'https://images.pexels.com/photos/257360/pexels-photo-257360.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260',
  'https://images.pexels.com/photos/1766838/pexels-photo-1766838.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=2&amp;w=500 2x',
  'https://images.pexels.com/photos/733174/pexels-photo-733174.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260',
  'https://images.pexels.com/photos/255441/pexels-photo-255441.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260',
  'https://images.pexels.com/photos/257360/pexels-photo-257360.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260',
  'https://images.pexels.com/photos/1766838/pexels-photo-1766838.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=2&amp;w=500 2x',
  'https://images.pexels.com/photos/733174/pexels-photo-733174.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260',
  'https://images.pexels.com/photos/255441/pexels-photo-255441.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260',
  'https://images.pexels.com/photos/257360/pexels-photo-257360.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260',
  'https://images.pexels.com/photos/1766838/pexels-photo-1766838.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=2&amp;w=500 2x',
  'https://images.pexels.com/photos/733174/pexels-photo-733174.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260',
  'https://images.pexels.com/photos/255441/pexels-photo-255441.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260',
];
double unit = 1;
