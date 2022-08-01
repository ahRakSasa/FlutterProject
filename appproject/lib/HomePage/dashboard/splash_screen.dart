import 'dart:async';
import 'package:appproject/HomePage/dashboard/main_page.dart';
import 'package:appproject/HomePage/dashboard/profile_page.dart';
import 'package:appproject/HomePage/dashboard/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/logo1.jpg'))),
          ),
          Positioned(
              bottom: 50,
              child: CupertinoActivityIndicator(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
