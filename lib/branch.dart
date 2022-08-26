import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/imageupload.dart';

class Branch extends StatefulWidget {
  String? userId;
  String? instname;
  Branch({Key? key, this.userId, this.instname}) : super(key: key);

  @override
  State<Branch> createState() => _BranchState();
}

class _BranchState extends State<Branch> {
  late String _branchName;
  late final faculty;
  late String _description;
  UploadTask? task;
  UploadTask? task2;
  PlatformFile? pickedfile;
  PlatformFile? pickedfile2;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Text(
            "BRANCH",
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
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                      },
                      onSaved: (value) {
                        _branchName = value!;
                      },
                      decoration: InputDecoration(
                          hintText: 'BRANCH NAME',
                          labelText: "BRANCH NAME",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("REQUIREMENTS DETAILS:-",
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
                        if (p < 10) {
                          return "Can't Validate";
                        }
                      },
                      onSaved: (newValue) {
                        faculty = newValue!;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'No. of Skilled Faculty',
                          labelText: "No. of Faculty",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
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
                      minLines: 3,
                      maxLines: 20,
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ADD DESCRIPTION";
                        }
                      },
                      onSaved: (value) {
                        _description = value!;
                      },
                      decoration: InputDecoration(
                          hintText: 'BRANCH DESCRIPTION',
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
                          if (!_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            Fluttertoast.showToast(
                                msg: "Successfully Uploaded");
                          }

                          await refdet
                              .doc(widget.userId)
                              .collection("files")
                              .doc("Approval")
                              .collection("BRANCH APPROVAL")
                              .doc(_branchName)
                              .set({
                            'BRANCH NAME': _branchName,
                            'Total Faculty': faculty,
                            'Description': _description,
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

    // ignore: non_constant_identifier_names
  }
}
