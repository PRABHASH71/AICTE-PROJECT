import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/imageupload.dart';

class instapprove extends StatefulWidget {
  String? userId;
  String? instname;
  instapprove({Key? key, this.userId, this.instname}) : super(key: key);

  @override
  State<instapprove> createState() => _instapproveState();
}

class _instapproveState extends State<instapprove> {
  UploadTask? task;
  UploadTask? task2;
  PlatformFile? pickedfile;
  PlatformFile? pickedfile2;

  Future selectfile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    setState(() {
      pickedfile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedfile!.name}';
    final file = File(pickedfile!.path!);
    FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
    final ref =
        FirebaseStorage.instance.ref().child("${widget.userId}").child(path);
    task = ref.putFile(file);
    final snapshot = await task!.whenComplete(() {
      Fluttertoast.showToast(msg: "UPLOADED SUCCESSFULLY");
    });
    final urldownload = await snapshot.ref.getDownloadURL();

    await firebasefirestore
        .collection("users")
        .doc(widget.userId)
        .collection("files")
        .add({'downloadUrl': urldownload});
  }

  ///next select..............................................
  ///.........................................
  ///
  ///
  ///
  ///
  Future selectfile2() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    setState(() {
      pickedfile2 = result.files.first;
    });
  }

  Future uploadFile2() async {
    final path = 'files/${pickedfile2!.name}';
    final file = File(pickedfile2!.path!);
    FirebaseFirestore firebasefirestore2 = FirebaseFirestore.instance;
    final ref =
        FirebaseStorage.instance.ref().child("${widget.userId}").child(path);
    task2 = ref.putFile(file);
    final snapshot = await task2!.whenComplete(() {
      Fluttertoast.showToast(msg: "UPLOADED SUCCESSFULLY");
    });
    final urldownload2 = await ref.getDownloadURL();

    await firebasefirestore2
        .collection("users")
        .doc(widget.userId)
        .collection("files")
        .add({'downloadUrl': urldownload2});
  }

  List<String> items = [
    'SELECT ANY ONE',
    'ADD BRANCH',
    'NEW COLLEGE',
    'NEW COURSE'
  ];

  String? selectedItem = 'SELECT ANY ONE';
  String? value;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 63, 5, 97),
          title: Text(
            " APPROVAL",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("CHOOSE THE OPTION FOR APPROVAL",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 50,
                  ),
                  DropdownButton(
                    value: value,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(
                      () => (this.value = value as String?),
                    ),
                  ),
                  //picker 1
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Upload Image here",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //picker 1
                  SizedBox(
                    height: 20,
                  ),
                  if (pickedfile != null)
                    Container(
                      child: Image.file(
                        File(pickedfile!.path!),
                        width: 100,
                      ),
                    ),
                  ElevatedButton(
                    onPressed: selectfile,
                    child: Text("SELECT FILE"),
                  ),
                  ElevatedButton(
                      onPressed: uploadFile, child: Text("UPLOAD FILE")),
                  SizedBox(
                    height: 20,
                  ),

                  ///next picker
                  Text("Upload Pdf here",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  if (pickedfile2 != null)
                    Container(
                      child: Image.file(
                        File(pickedfile2!.path!),
                        width: 100,
                      ),
                    ),
                  ElevatedButton(
                    onPressed: selectfile2,
                    child: Text("SELECT FILE"),
                  ),
                  ElevatedButton(
                      onPressed: uploadFile2, child: Text("UPLOAD FILE")),

                  SizedBox(
                    height: 20,
                  ),

                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.purple,
                    child: MaterialButton(
                      padding: EdgeInsets.fromLTRB(20, 15, 15, 20),
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
                      child: Text(
                        "SEND",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              gradient:
                  const LinearGradient(colors: [Colors.red, Colors.yellow])),
        ),
      ),
    );

    // ignore: non_constant_identifier_names
  }
}
