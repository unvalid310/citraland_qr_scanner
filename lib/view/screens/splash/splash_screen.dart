import 'dart:async';

import 'package:citraland/utill/images.dart';
import 'package:citraland/utill/routes.dart';
import 'package:citraland/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  void startSplashScreen() async {
    Future.delayed(Duration(seconds: 5)).then((value) {
      print('start splash screen');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Center(
          child: Image.asset(
            Images.splash_logo,
            fit: BoxFit.fill,
            width: 200,
          ),
        ),
      ),
    );
  }
}
