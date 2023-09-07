import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/home/details/news_Details_Screen.dart';
import 'package:news/home/home_screen.dart';
import 'package:news/home/splash_screen/splash_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit( designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    // Use builder only if you need to use library outside ScreenUtilInit context
    builder: (_ , child) {
      return MaterialApp(debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green
        ),
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          NewsDetailsScreen.routeName:(_) =>NewsDetailsScreen(),
          SplashScreen.routeName: (_) => SplashScreen(),
        },
        initialRoute: SplashScreen.routeName,
      );
    }
    );
  }
}
