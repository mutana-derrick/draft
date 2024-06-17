import 'package:abbyride/pages/home_page.dart';
import 'package:abbyride/pages/login_page.dart';
import 'package:abbyride/pages/splash_page.dart';
import 'package:abbyride/styles/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tekana',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.backgroundcolor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/loginpage': (context) => const LoginPage(),
        '/home': (context) => const Homepage(),
      },
    );
  }
}
