import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'utilities/routing_constants.dart';
//import 'file:///C:/Users/Admin/AndroidStudioProjects/Navigation-Flutter-Demo/lib/view/screen0.dart';
//import 'file:///C:/Users/Admin/AndroidStudioProjects/Navigation-Flutter-Demo/lib/view/screen1.dart';
//import 'file:///C:/Users/Admin/AndroidStudioProjects/Navigation-Flutter-Demo/lib/view/screen2.dart';
import 'screens/auth/screen0.dart';
import 'screens/auth/screen1.dart';
import 'screens/auth/sceen2.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case screen0Route:
        return MaterialPageRoute(builder: (_) => Screen0());
      case screen1Route:
        return MaterialPageRoute(builder: (_) => Screen1());
      case screen2Route:
        return MaterialPageRoute(builder: (_) => Screen2());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

    }
  }
}