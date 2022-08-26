// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/get_details.dart';
import 'package:login/tracker.dart';
import 'package:snapshot/snapshot.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class appadmin extends StatefulWidget {
  const appadmin({Key? key}) : super(key: key);

  @override
  State<appadmin> createState() => _appadminState();
}

class _appadminState extends State<appadmin> {
  List<String> docIds = [];
  List<String> newIds = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((Snapshot) => Snapshot.docs.forEach((document) {
              docIds.add(document.reference.id);
            }));
  }

  Futuregetdetails() async {
    await FirebaseFirestore.instance
        .collection("files")
        .get()
        .then((Snapshot) => Snapshot.docs.forEach((document) {
              docIds.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 232, 232),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 9, 8, 9),
        title: const Text(
          "APPROVAL",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocId(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                      itemCount: docIds.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 97, 167, 240),
                                  Color.fromARGB(255, 173, 140, 167)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: ListTile(
                              title: getdetails(documentid: docIds[index]),
                            ),
                          ),
                        );
                      }));
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => tracker()));
              },
              child: Container(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 141, 161, 103),
                          Color.fromARGB(255, 74, 103, 124)
                        ])),
                    child: Text(
                      "CLICK HERE",
                      style: TextStyle(color: Color.fromARGB(255, 16, 15, 15)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
