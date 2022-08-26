import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/imageupload.dart';

class college extends StatefulWidget {
  String? userId;
  String? instname;
  college({Key? key, this.userId, this.instname}) : super(key: key);

  @override
  State<college> createState() => _collegeState();
}

class _collegeState extends State<college> {
  UploadTask? task;
  UploadTask? task2;
  UploadTask? task3;
  UploadTask? task4;
  PlatformFile? pickedfile;
  PlatformFile? pickedfile2;
  PlatformFile? pickedfile3;
  PlatformFile? pickedfile4;
  late String university;
  late String collegeName;
  late String address;
  late String description;
  late final area;
  late final fund;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  CollectionReference refdet = FirebaseFirestore.instance.collection("users");

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
    final ref = FirebaseStorage.instance
        .ref()
        .child("${widget.userId}")
        .child("${widget.instname}")
        .child(path);
    task = ref.putFile(file);
    final snapshot = await task!.whenComplete(() {
      Fluttertoast.showToast(msg: "UPLOADED SUCCESSFULLY");
    });
    final urldownload = await snapshot.ref.getDownloadURL();

    await firebasefirestore
        .collection("users")
        .doc(widget.userId)
        .collection("files")
        .doc(widget.userId)
        .collection("Requirements")
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
        .doc(widget.instname)
        .collection("faculty details")
        .add({'downloadUrl': urldownload2});
  }

  Future selectfile3() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    setState(() {
      pickedfile3 = result.files.first;
    });
  }

  Future uploadFile3() async {
    final path = 'files/${pickedfile3!.name}';
    final file = File(pickedfile3!.path!);
    FirebaseFirestore firebasefirestore3 = FirebaseFirestore.instance;
    final ref =
        FirebaseStorage.instance.ref().child("${widget.userId}").child(path);
    task3 = ref.putFile(file);
    final snapshot = await task3!.whenComplete(() {
      Fluttertoast.showToast(msg: "UPLOADED SUCCESSFULLY");
    });
    final urldownload3 = await ref.getDownloadURL();

    await firebasefirestore3
        .collection("users")
        .doc(widget.userId)
        .collection("files")
        .doc(widget.instname)
        .collection("University affliation")
        .add({'downloadUrl': urldownload3});
  }

  Future selectfile4() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    setState(() {
      pickedfile4 = result.files.first;
    });
  }

  Future uploadFile4() async {
    final path = 'files/${pickedfile4!.name}';
    final file = File(pickedfile4!.path!);
    FirebaseFirestore firebasefirestore4 = FirebaseFirestore.instance;
    final ref =
        FirebaseStorage.instance.ref().child("${widget.userId}").child(path);
    task4 = ref.putFile(file);
    final snapshot = await task4!.whenComplete(() {
      Fluttertoast.showToast(msg: "UPLOADED SUCCESSFULLY");
    });
    final urldownload4 = await ref.getDownloadURL();

    await firebasefirestore4
        .collection("users")
        .doc(widget.userId)
        .collection("files")
        .doc(widget.instname)
        .collection("faculty details")
        .add({'downloadUrl': urldownload4});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Text(
            "COLLEGE APPROVAL",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("FILL EVERY FIELDS CAREFULLY",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length <= 5) {
                          return "Can't Validate";
                        }
                      },
                      onSaved: (value) {
                        university = value!;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'UNIVERSITY NAME',
                          labelText: "PARENT UNIVERSITY",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Text("Attach Affliation Certificate",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Include Pdf :-",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),

                        //picker 1
                        SizedBox(
                          height: 20,
                        ),

                        if (pickedfile3 != null)
                          Container(
                            child: Image.file(
                              File(pickedfile3!.path!),
                              width: 20,
                            ),
                          ),
                        ElevatedButton(
                          onPressed: selectfile3,
                          child: Text("SELECT FILE"),
                        ),
                        ElevatedButton(
                            onPressed: uploadFile3, child: Text("UPLOAD FILE")),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length <= 5) {
                          return "Can't Validate";
                        }
                      },
                      onSaved: (value) {
                        collegeName = value!;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'COLLEGE NAME',
                          labelText: "COLLEGE NAME",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length <= 10) {
                          return "Provide Complete Address";
                        }
                      },
                      onSaved: (value) {
                        address = value!;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'COLLEGE ADDRESS',
                          labelText: "ADDRESS",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Requirements Details",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    //picker 1
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Include Pdf :-",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),

                        //picker 1
                        SizedBox(
                          height: 20,
                        ),

                        if (pickedfile != null)
                          Container(
                            child: Image.file(
                              File(pickedfile!.path!),
                              width: 20,
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
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        int p = int.parse(value!);
                        if (p < 5) {
                          return "Can't Validate";
                        }
                      },
                      onSaved: (value) {
                        area = value!;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'IN ACRES',
                          labelText: "LAND AREA",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Add N.O.C",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Include Pdf :-",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),

                        //picker 1

                        if (pickedfile2 != null)
                          Container(
                            child: Image.file(
                              File(pickedfile2!.path!),
                              width: 20,
                            ),
                          ),
                        ElevatedButton(
                          onPressed: selectfile2,
                          child: Text("SELECT FILE"),
                        ),
                        ElevatedButton(
                            onPressed: uploadFile2, child: Text("UPLOAD FILE")),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        int p = int.parse(value!);
                        if (p < 2) {
                          return "Can't Validate";
                        }
                      },
                      onSaved: (value) {
                        fund = value!;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Rs. in Crores',
                          labelText: "Fund Positions",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Attach Funding Details",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Include Pdf :-",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),

                        //picker 1
                        SizedBox(
                          height: 30,
                        ),

                        if (pickedfile4 != null)
                          Container(
                            child: Image.file(
                              File(pickedfile4!.path!),
                              width: 20,
                            ),
                          ),
                        ElevatedButton(
                          onPressed: selectfile4,
                          child: Text("SELECT FILE"),
                        ),
                        ElevatedButton(
                            onPressed: uploadFile4, child: Text("UPLOAD FILE")),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ADD DESCRIPTION";
                        }
                      },
                      onSaved: (value) {
                        description = value!;
                      },
                      minLines: 3,
                      maxLines: 20,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'COLLEGE COURSES DESCRIPTION',
                          labelText: "DESCRIPTION",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
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
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            Fluttertoast.showToast(
                                msg: "Successfully Uploaded");
                          }

                          await refdet
                              .doc(widget.userId)
                              .collection("files")
                              .doc("Approval")
                              .collection("COLLEGES APPROVAL")
                              .doc(collegeName)
                              .set({
                            'Parent University': university,
                            'College Name': collegeName,
                            'Address': address,
                            'Land Area': area + " in Acres",
                            'Fund': fund + " in Crores",
                            'Description': description,
                          });
                        },
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
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              gradient:
                  const LinearGradient(colors: [Colors.white, Colors.white])),
        ),
      ),
    );
  }
}
