import 'package:abbyride/firebase_options.dart';
import 'package:abbyride/pages/home_page.dart';
import 'package:abbyride/pages/login_page.dart';
import 'package:abbyride/pages/splash_page.dart';
import 'package:abbyride/styles/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
// Firebase initialisation
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(
      AuthenticationRepository(),
    ),
  );
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
