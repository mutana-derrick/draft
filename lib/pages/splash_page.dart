import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';

import 'package:flutter/widgets.dart'; // for Timer

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 0; // Initial opacity for fade-in animation

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed('/loginpage');
      },
    );
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        setState(
          () {
            _opacity =
                1.0; // Animate opacity to 1.0 (fully visible) after frame builds
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1), // Adjust animation duration
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add your image and text here
              Image.asset("assets/icons/nodrugs.jpg"),
              const SizedBox(height: 20.0),
              const Text(
                'Heal Path',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 27, 89, 139),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToLoginPage(BuildContext context) {}
}
