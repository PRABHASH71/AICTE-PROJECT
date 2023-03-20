import 'dart:async';

import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:login/first.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (() {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => first()));
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 206, 35, 23),
              Colors.orangeAccent,
              Colors.white,
              Colors.green,
              Color.fromARGB(255, 9, 93, 12),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/aa.png",
              ),
              SizedBox(
                height: 29,
              ),
              Container(
                height: 90,
                width: 90,
                child: Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_t5zkfmnt.json',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
