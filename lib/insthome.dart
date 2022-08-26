import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/index.dart';
import 'package:login/instapp.dart';
import 'package:login/instmeet.dart';

import 'package:login/meet.dart';
import 'package:login/noti.dart';
import 'package:login/personal.dart';
import 'package:login/scheme.dart';
import 'package:login/usermodel.dart';

class insthome extends StatefulWidget {
  const insthome({Key? key}) : super(key: key);

  @override
  State<insthome> createState() => _insthomeState();
}

class _insthomeState extends State<insthome> {
  User? user = FirebaseAuth.instance.currentUser;
  Usermodel usermodel = Usermodel();
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.usermodel = Usermodel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 10, 3, 15),
        title: Text(
          "AICTE INSTITUTIONS",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Container(
            child: GridView(
              padding: EdgeInsets.all(10),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => personal()));
                  },
                  child: Container(
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
                          // ignore: prefer_const_constructors

                          SizedBox(
                            height: 20,
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
                        MaterialPageRoute(builder: (context) => instapprove()));
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
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 0, 0, 0)
          ]),
        ),
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
                  ]),
                  boxShadow: [
                    const BoxShadow(color: Colors.black, blurRadius: 10)
                  ],
                ),
                child: Container(
                  child: Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(60.0)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/aa2.png"),
                          radius: 60,
                        ),
                        shadowColor: Colors.black,
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
                  leading: Icon(Icons.school_rounded),
                  title: Text(usermodel.Instname!),
                  subtitle: Text("Institution name"),
                  trailing: Icon(Icons.edit),
                ),
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
                  title: Text(usermodel.email!),
                  subtitle: Text("EMAIL"),
                  trailing: Icon(Icons.send),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => personal()));
                  },
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 0, 0, 0)
              ])),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        child: const Icon(Icons.login_outlined),
      ),
    );
  }
}
