import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/approval.dart';
import 'package:login/approvaladmin.dart';
import 'package:login/email.dart';
import 'package:login/help.dart';
import 'package:login/index.dart';

import 'package:login/meet.dart';
import 'package:login/noti.dart';
import 'package:login/personal.dart';
import 'package:login/scheme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  final user = FirebaseAuth.instance.currentUser!;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 80,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            title: const Text(
              " AICTE APP",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            elevation: 4.0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => help()));
                },
                icon: Icon(Icons.lightbulb),
              )
            ],
          ),
          body: Container(
            child: GridView(
              padding: EdgeInsets.all(10),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => personal()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(90),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 240, 245, 248),
                          Color.fromARGB(255, 94, 218, 234),
                          Color.fromARGB(255, 76, 126, 235)
                        ])),
                    child: Column(
                      children: [
                        Image.asset("assets/org.png"),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "ABOUT",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => appadmin()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(90),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 240, 245, 248),
                          Color.fromARGB(255, 94, 218, 234),
                          Color.fromARGB(255, 76, 126, 235)
                        ])),
                    child: Column(
                      children: [
                        Image.asset("assets/app.png"),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "APPROVAL",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IndexPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 240, 245, 248),
                          Color.fromARGB(255, 94, 218, 234),
                          Color.fromARGB(255, 76, 126, 235)
                        ])),
                    padding: EdgeInsets.all(90),
                    child: Column(
                      children: [
                        Image.asset("assets/meet2.png"),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "MEETINGS",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => notifi()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 240, 245, 248),
                          Color.fromARGB(255, 94, 218, 234),
                          Color.fromARGB(255, 76, 126, 235)
                        ])),
                    padding: EdgeInsets.all(90),
                    child: Column(
                      children: [
                        Image.asset("assets/ev.png"),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "EVENTS",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => approval()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 240, 245, 248),
                          Color.fromARGB(255, 94, 218, 234),
                          Color.fromARGB(255, 76, 126, 235)
                        ])),
                    padding: EdgeInsets.all(90),
                    child: Column(
                      children: [
                        Image.asset("assets/f.png"),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "FELLOWSHIP",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => scheme()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 240, 245, 248),
                          Color.fromARGB(255, 94, 218, 234),
                          Color.fromARGB(255, 76, 126, 235)
                        ])),
                    padding: EdgeInsets.all(90),
                    child: Column(
                      children: [
                        Image.asset("assets/scheme.png"),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "SCHEMES",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 50),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            child: const Icon(Icons.login_outlined),
          ),
          drawer: Drawer(
            child: Container(
              width: 100,
              height: 100,
              child: ListView(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 198, 240, 245),
                          Color.fromARGB(255, 70, 204, 253),
                        ])),
                    child: Container(
                      child: Column(
                        children: [
                          Material(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.0)),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/aa2.png"),
                              radius: 60,
                            ),
                            shadowColor: Color.fromARGB(255, 240, 237, 237),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 198, 240, 245),
                          Color.fromARGB(255, 70, 204, 253),
                        ])),
                    child: ListTile(
                      leading: Icon(Icons.email),
                      title: Text(user.email!),
                      subtitle: Text("EMAIL"),
                      trailing: Icon(Icons.send),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => email()));
                      },
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 18, 13, 13),
                    Color.fromARGB(255, 8, 6, 6)
                  ])),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0)
            ])),
      ),
    );
  }
}
