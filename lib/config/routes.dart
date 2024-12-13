import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/home_page.dart';
import 'package:flutter_tutorial/views/login_page.dart';

const String baseRoute='/';
const String homeRoute='/home';
const String loginRoute='/login';




Map<String, WidgetBuilder> appRoutes = {
  baseRoute: (context) => LoginPage(),
  homeRoute: (context) => HomePage(),
  loginRoute: (context) => LoginPage(),
};











class RouterManager {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }

  // Navigate to a specific route
  static void navigateTo(String routeName,{Object? arguments}) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  // Pop the current page
  static void pop() {
    navigatorKey.currentState?.pop();
  }
}