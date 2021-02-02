import 'package:flutter/material.dart';
import "package:phothpraph/screens/splash_screen/splash_screen.dart";
import 'package:phothpraph/screens/login/login.dart';
import 'package:phothpraph/screens/signup/signup.dart';
import "package:phothpraph/screens/login/phone_verification.dart";
import 'package:phothpraph/screens/account/account.dart';
import 'package:phothpraph/screens/setting/settingscreen.dart';
import 'package:phothpraph/screens/Home/home.dart';
import 'package:phothpraph/screens/statistics/statistics.dart';
import 'package:phothpraph/data/database/userinfo.dart';
import 'package:phothpraph/screens/photo/photo.dart';
import 'package:phothpraph/screens/booking/booking.dart';
import 'package:phothpraph/screens/booking/bookingdetail.dart';
import 'package:phothpraph/screens/background/backgound.dart';
import 'package:phothpraph/screens/setting/settingscreen.dart';
import 'package:phothpraph/screens/background/backgound.dart';
class PageViewTransition<T> extends MaterialPageRoute<T> {
  PageViewTransition({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse)
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    return FadeTransition(opacity: animation, child: child);
  }
}

class AppRoute {
  static const String splashScreen = '/splashScreen';
  static const String loginScreen = '/login';
  static const String signUpScreen = '/signup';
  static const String forgotPassword = '/forgotPassword';
  static const String account = '/account';
  static const String setting = '/setting';
  static const String home = '/home';
  static const String photo = '/photo';
  static const String booking = '/booking';
  static const String bookingdetail = '/bookingdetail';
  static const String backgroundimage = '/backgroundimage';
  static const String shop_detail = '/shop_detail';
  static const String shop_cart = '/shop_cart';
  static const String statistics = '/statistics';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return PageViewTransition(builder: (_) => SplashScreen());
      case loginScreen:
        return PageViewTransition(builder: (_) => LoginScreen());
      case signUpScreen:
        return PageViewTransition(builder: (_) => SignupScreen());
      case forgotPassword:
        return PageViewTransition(builder: (_) => PhoneVerification());
      case statistics:
        return PageViewTransition(builder: (_) => StatisticScreen());
      case backgroundimage:
        return PageViewTransition(builder: (_) => BackgroundScreen());
      case photo:
        return PageViewTransition(builder: (_) => PhotoScreen());
      case booking:
        {
          cindex = 3;
          return PageViewTransition(builder: (_) => BookingScreen());
        }
      case bookingdetail:
        {
          cindex = 3;
          return PageViewTransition(builder: (_) => BookingdetailScreen());
        }
      case setting:
        {
          cindex = 4;
          return PageViewTransition(builder: (_) => SettingScreen());
        }
      case home:
        {
          cindex = 0;
          return PageViewTransition(builder: (_) => HomeScreen());
        }
      default:
        return PageViewTransition(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
