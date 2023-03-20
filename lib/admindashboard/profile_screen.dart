import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/Fellowship.dart';
import 'package:login/ApproveRequest/approvaladmin.dart';

import 'package:login/email.dart';
import 'package:login/help.dart';
import 'package:login/index.dart';
import 'package:login/login.dart';

import 'package:login/meet.dart';
import 'package:login/noti.dart';
import 'package:login/personal.dart';
import 'package:login/profile.dart';
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
          backgroundColor: Color.fromARGB(255, 168, 225, 244),
          appBar: AppBar(
              centerTitle: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    gradient: LinearGradient(
                        colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(90),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: 30, right: 30, bottom: 30),
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.blue,
                                size: 26,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "         Search Your Topic",
                              labelStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              isDense: true),
                        ),
                      ),
                    ],
                  )),
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => help()));
                  },
                  icon: Icon(Icons.lightbulb),
                ),
              ]),
          body: Container(
            child: Container(
              child: GridView(
                padding: EdgeInsets.all(12),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => personal()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 3, 54, 96)
                          ])),
                      child: Column(
                        children: [
                          Image.asset("assets/org.png"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "ABOUT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 3, 54, 96)
                          ])),
                      child: Column(
                        children: [
                          Image.asset("assets/app.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "APPROVAL",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 3, 54, 96)
                          ])),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset("assets/meet2.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "MEETINGS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 3, 54, 96)
                          ])),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset("assets/ev.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "EVENTS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 3, 54, 96)
                          ])),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset("assets/fell.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "FELLOWSHIP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 3, 54, 96)
                          ])),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset("assets/scheme.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "SCHEMES",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            backgroundColor: Color.fromARGB(255, 5, 39, 66),
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
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: Container(
                      child: Column(
                        children: [
                          Material(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.0)),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/aa2.png"),
                              radius: 50,
                            ),
                            shadowColor: Color.fromARGB(255, 240, 237, 237),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "AICTE OFFICIAL",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
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
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      title: Text(
                        user.email!,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "EMAIL",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => email()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: ListTile(
                      leading: Icon(
                        Icons.account_balance_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        "ABOUT AICTE",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => personal()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: ListTile(
                      leading: Icon(
                        Icons.list_alt_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "SCHEMES",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => scheme()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: ListTile(
                      leading: Icon(
                        Icons.help,
                        color: Color.fromARGB(170, 255, 255, 255),
                      ),
                      title: Text(
                        "HELP DESK",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => help()));
                      },
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 168, 225, 244),
                    Color.fromARGB(255, 168, 225, 244)
                  ])),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 168, 225, 244),
              Color.fromARGB(255, 168, 225, 244)
            ])),
      ),
    );
  }
}
