// ignore_for_file: must_call_super

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/screens/login/LogInScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LogInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(75),
          child: Image.asset("assets/images/orange.jpeg"),
        ),
      ),
    );
  }
}
