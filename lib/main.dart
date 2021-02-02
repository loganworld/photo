import 'package:flutter/material.dart';
import "screens/splash_screen/splash_screen.dart";
import 'router.dart';
import 'package:flutter/services.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photographer',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.generateRoute,
      home: SplashScreen(),
    );
  }
}
