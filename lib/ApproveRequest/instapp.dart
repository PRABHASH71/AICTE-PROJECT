import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:login/ApproveRequest/branchnew.dart';
import 'package:login/ApproveRequest/collegeapproval.dart';

import 'package:login/meetings/usermodel.dart';

class instapprove extends StatefulWidget {
  const instapprove({Key? key}) : super(key: key);

  @override
  State<instapprove> createState() => _instapproveState();
}

class _instapproveState extends State<instapprove> {
  static final data1 = 'Steps for giving response for new Branch Approval.';

  static final data2 = 'Steps for giving response for new college Approval';
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
    return Container(
      child: Scaffold(
        body: Container(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 80,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              title: const Text(
                "APPROVAL",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 0, 53, 72),
                    Color.fromARGB(255, 0, 53, 72),
                  ])),
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  buildCard(
                    'ADD NEW BRANCH',
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 90, right: 90),
                    child: RawMaterialButton(
                      fillColor: Colors.green,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => newbranch()));
                      },
                      child: Text(
                        "ADD BRANCH",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  buildCard1(
                    'ADD NEW COLLEGE',
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 90, right: 90),
                    child: RawMaterialButton(
                      fillColor: Colors.green,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => college()));
                      },
                      child: Text(
                        "ADD COLLEGE",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.black,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 0, 0, 0)
              ])),
        ),
      ),
    );
  }

  Widget buildCard(String title) => Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 188, 234, 164),
                  Color.fromARGB(255, 126, 221, 233),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                data1,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => data1).join('\n\n'),
                style: TextStyle(fontSize: 18),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildCard1(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 188, 234, 164),
                  Color.fromARGB(255, 126, 221, 233),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                data2,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => data2).join('\n\n'),
                style: TextStyle(fontSize: 18),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );
}
