import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/modelsnewbranch.dart';
import 'package:login/remotedatbranch.dart';

class newbranch extends StatefulWidget {
  const newbranch({Key? key}) : super(key: key);

  @override
  State<newbranch> createState() => _newbranchState();
}

class _newbranchState extends State<newbranch> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController branchname = TextEditingController();
  TextEditingController collegename = TextEditingController();
  TextEditingController faculty = TextEditingController();
  TextEditingController description = TextEditingController();
  checkvalidation(GlobalKey<FormState> _formkey) {
    if (_formkey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    branchname.dispose();
    collegename.dispose();
    faculty.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Branch Approval"),
          centerTitle: true,
          toolbarHeight: 80,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 236, 246, 253),
            Color.fromARGB(255, 236, 246, 253),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length <= 3) {
                          return ("Provide proper Branch Name");
                        }
                      },
                      controller: branchname,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'BRANCH NAME',
                          labelText: "BRANCH NAME",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length <= 3) {
                          return ("Provide proper College Name");
                        }
                      },
                      controller: collegename,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'COLLEGE NAME',
                          labelText: "COLLEGE NAME",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This Field Can't be Empty");
                        }
                      },
                      controller: faculty,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "TOTAL FACULTIES",
                          border: OutlineInputBorder(),
                          hintText: "TOTAL FACULTY"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: description,
                      minLines: 3,
                      maxLines: 20,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length <= 6) {
                          return ("Provide Proper Description");
                        }
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'COLLEGE BRANCH DESCRIPTION',
                          labelText: "DESCRIPTION",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        if (checkvalidation(_formkey) == false) {
                          FirestoreHelper.create(UserModel4(
                            branchname: branchname.text,
                            collegename: collegename.text,
                            faculties: faculty.text,
                            description: description.text,
                          ));
                        }
                        ;
                      },
                      child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SUBMIT",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
