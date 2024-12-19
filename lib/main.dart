import 'package:flutter/material.dart';
import 'package:flutter_tutorial/GetX/Views/GetxHome.dart';
import 'package:flutter_tutorial/views/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Provider/Notifier/ThemeNotifier.dart';
import 'helpers/Localization/AppLanguage.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
import 'views/login_page.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppLanguage(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguage>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(appLanguage.appLocal),
      supportedLocales: [
        Locale('en'), // الإنجليزية
        Locale('ar'), // العربية
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: GetxHome(),
    );
  }
}


// import 'package:get/get.dart';
// import 'Provider/Notifier//theme_controller.dart'; // تأكد من استخدام المسار الصحيح
// import 'config/routes.dart'; // تأكد من استخدام المسار الصحيح

// void main() {
//   Get.put(ThemeController());
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ThemeController themeController = Get.find();

//     return Obx(() {
//       return MaterialApp(
//         title: 'Flutter Demo',
//         themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
//         theme: themeController.currentTheme,
//         initialRoute: baseRoute,
//         navigatorKey: RouterManager.navigatorKey,
//         onGenerateRoute: RouterManager.generateRoute,
//         debugShowCheckedModeBanner: false,
//       );
//     });
//   }
// }