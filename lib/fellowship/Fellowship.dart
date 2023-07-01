import 'dart:io';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:login/fellowship/modelclass.dart';
import 'package:path_provider/path_provider.dart';

class approval extends StatefulWidget {
  approval({Key? key}) : super(key: key);

  @override
  State<approval> createState() => _approvalState();
}

class _approvalState extends State<approval> {
  Future<void> _handlerefresh() async {
    return await Future.delayed(Duration(milliseconds: 500));
  }

  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (value) => value.docs.forEach((document) {
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
          body: LiquidPullToRefresh(
            onRefresh: _handlerefresh,
            color: Colors.blue,
            height: 200,
            animSpeedFactor: 5,
            backgroundColor: Color.fromARGB(255, 237, 255, 255),
            child: Center(
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
                          padding: EdgeInsets.all(1.0),
                          child: ListTile(
                            title: GetUserName(
                                documentId: docIDs[index], doc: docIDs[index]),
                          ),
                        );
                      },
                    );
                  },
                )),
              ],
            )),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            gradient:
                const LinearGradient(colors: [Colors.red, Colors.yellow])),
      ),
    );
  }
}
