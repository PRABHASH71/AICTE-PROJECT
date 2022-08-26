import 'dart:io';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:login/modelclass.dart';
import 'package:path_provider/path_provider.dart';

class approval extends StatefulWidget {
  approval({Key? key}) : super(key: key);

  @override
  State<approval> createState() => _approvalState();
}

class _approvalState extends State<approval> {
  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 243, 242, 240),
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 80,
            backgroundColor: Color.fromARGB(255, 11, 11, 11),
            title: const Text(
              " FELLOWSHIP",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
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
                            title: GetUserName(
                                documentId: docIDs[index], doc: docIDs[index]),
                          ),
                        ),
                      );
                    },
                  );
                },
              )),
            ],
          )),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            gradient:
                const LinearGradient(colors: [Colors.red, Colors.yellow])),
      ),
    );
  }
}
