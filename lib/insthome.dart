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
        backgroundColor: Color.fromARGB(255, 63, 5, 97),
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
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 89, 95, 203),
                      ),
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
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 229, 10, 10),
                    ),
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
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 2, 141, 7),
                    ),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => instapprove(
                                  userId: usermodel.uid,
                                  instname: usermodel.Instname!,
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 179, 8, 185),
                    ),
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
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 253, 164, 0),
                    ),
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
          gradient: const LinearGradient(colors: [Colors.red, Colors.yellow]),
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
                  gradient: LinearGradient(colors: <Color>[
                    Colors.orange,
                    Colors.red,
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
                          backgroundImage: AssetImage("assets/m.png"),
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
                    gradient: const LinearGradient(
                        colors: [Colors.red, Colors.yellow])),
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
                    gradient: const LinearGradient(
                        colors: [Colors.red, Colors.yellow])),
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
              gradient:
                  const LinearGradient(colors: [Colors.red, Colors.yellow])),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        backgroundColor: Color.fromARGB(255, 63, 5, 97),
        child: const Icon(Icons.login_outlined),
      ),
    );
  }
}
