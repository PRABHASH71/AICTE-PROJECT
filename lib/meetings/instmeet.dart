import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/meetings/usermodel.dart';

class instMeet extends StatefulWidget {
  instMeet({Key? key}) : super(key: key);

  @override
  State<instMeet> createState() => _instMeetState();
}

class _instMeetState extends State<instMeet> {
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
      body: Container(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 80,
            backgroundColor: Color.fromARGB(255, 63, 5, 97),
            title: Text(
              " MEETINGS",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(40),
            child: Center(
              child: Text(
                "NO MEETINGS FOR  : " + usermodel.Instname!,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                gradient:
                    const LinearGradient(colors: [Colors.red, Colors.yellow])),
          ),
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}
