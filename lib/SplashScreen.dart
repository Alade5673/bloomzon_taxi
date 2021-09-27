import 'package:flutter/material.dart';

import 'Authentication/Login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  static const String idScreen = "splashScreen";
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        width: 375,
        height: 812,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 347,
              left: 25,
              child: Container(
                  width: 300,
                  height: 118.796875,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 15,
                        child: Image(image: AssetImage('assets/images/logo.png'))),
                  ]))),
        ]));
  }
}
