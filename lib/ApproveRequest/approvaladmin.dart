// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/FetchApproval/approvebranch.dart';

import 'package:login/FetchApproval/approvecollege.dart';
import 'package:login/ApproveRequest/collegeapproval.dart';

import 'package:snapshot/snapshot.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class appadmin extends StatefulWidget {
  const appadmin({Key? key}) : super(key: key);

  @override
  State<appadmin> createState() => _appadminState();
}

class _appadminState extends State<appadmin> {
  static final data1 = 'LINK TO THE REQUESTS FOR BRANCH APPROVALS IS BELOW ';

  static final data2 = 'LINK TO THE REQUESTS FOR COLLEGE APPROVALS IS BELOW';

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
                    'BRANCH APPROVAL',
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: RawMaterialButton(
                      fillColor: Colors.green,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => approvebranch()));
                      },
                      child: Text(
                        "BRANCH APPROVALS",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  buildCard1(
                    'NEW COLLEGE APPROVALS',
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: RawMaterialButton(
                      fillColor: Colors.green,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Collegeapp()));
                      },
                      child: Text(
                        "COLLEGE APPROVAL",
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
