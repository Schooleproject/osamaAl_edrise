import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/home_page.dart';
import 'package:flutter_tutorial/views/login_page.dart';

// تعريف المسارات
const String baseRoute = '/';
const String homeRoute = '/home';
const String loginRoute = '/login';

// خريطة المسارات
Map<String, WidgetBuilder> appRoutes = {
  baseRoute: (context) => LoginPage(),
  homeRoute: (context) => HomePage(),
  loginRoute: (context) => LoginPage(),
};

class RouterManager {
  // مفتاح النافذة
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // دالة لتوليد المسارات
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage()); // يمكنك استبدالها بصفحة خطأ مخصصة
    }
  }

  // التنقل إلى مسار محدد
  static void navigateTo(String routeName, {Object? arguments}) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  // العودة إلى الصفحة السابقة
  static void pop() {
    navigatorKey.currentState?.pop();
  }
}