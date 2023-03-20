import "package:flutter/material.dart";
import 'package:login/Fellowship.dart';
import 'package:login/ApproveRequest/approvaladmin.dart';
import 'package:login/category.dart';
import 'package:login/email.dart';
import 'package:login/help.dart';
import 'package:login/index.dart';
import 'package:login/noti.dart';
import 'package:login/personal.dart';
import 'package:login/scheme.dart';
import 'package:login/searchfield.dart';

final List<String> imgList = [
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg"
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg"
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg"
];

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.black,
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
            icon: Icon(Icons.help),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 219, 219, 219),
                    Color.fromARGB(255, 219, 219, 219),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 26,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Search Your Topic",
                          labelStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          isDense: true),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
                            Color.fromARGB(255, 0, 0, 0),
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
          ]),
        ),
      ),
    );
  }
}
