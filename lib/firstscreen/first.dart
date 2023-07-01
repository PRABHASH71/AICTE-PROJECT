import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login/instlogin/inslogin.dart';
import 'package:login/instdashboard/insthome.dart';
import 'package:login/adminlogin/login.dart';
import 'package:login/shemes/scheme.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 150, horizontal: 1),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/aa.png'),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        height: 45,
                        width: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 136, 1),
                                  Color.fromARGB(255, 253, 220, 3),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            "Admin",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => inslog()));
                      },
                      child: Container(
                        height: 45,
                        width: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 136, 1),
                                  Color.fromARGB(255, 253, 220, 3),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            "Institution",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/my.png'),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
