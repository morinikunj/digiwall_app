import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/homepage.dart';
import 'package:wallpaper_app/widgets/app_icon.dart';

class SpalshScreen extends StatefulWidget {
  SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SpalshScreen> {
  void initState() {
    super.initState();

    //go to one screen to another
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // splash screen design
    return Scaffold(
      body: Container(
        color: Color(0xff2196F3),
        child: Center(
          child: AppIcon(),
        ),
      ),
    );
  }
}
