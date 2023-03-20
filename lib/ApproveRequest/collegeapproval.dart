import 'package:flutter/material.dart';
import 'package:login/collegemodel.dart';
import 'package:login/collegeremote.dart';

class college extends StatefulWidget {
  const college({Key? key}) : super(key: key);

  @override
  State<college> createState() => _collegeState();
}

class _collegeState extends State<college> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController collegename = TextEditingController();
  TextEditingController ParentUniversity = TextEditingController();
  TextEditingController Area = TextEditingController();
  TextEditingController cost = TextEditingController();
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
    collegename.dispose();
    ParentUniversity.dispose();
    Area.dispose();
    cost.dispose();
    description.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("College Approval"),
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
                          return "Provide Proper College Name";
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
                        if (value!.length <= 3) {
                          return "Provide Proper University Name";
                        }
                      },
                      controller: ParentUniversity,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'PARENT UNIVERSITY',
                          labelText: "PARENT UNIVERSITY",
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
                      controller: Area,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Land Area in Acres",
                          border: OutlineInputBorder(),
                          hintText: "Land Area in Acres"),
                    ),

                    SizedBox(
                      child: Text("ATTACH PDF OR IMAGE HERE"),
                      height: 40,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("This Field Can't be Empty");
                        }
                      },
                      controller: cost,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Fund in crores",
                          border: OutlineInputBorder(),
                          hintText: "Fund in crores"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length <= 6) {
                          return ("Provide proper Description");
                        }
                      },
                      controller: description,
                      minLines: 3,
                      maxLines: 20,
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
                          FirestoreHelper1.create(UserModel5(
                            ParentUniversity: ParentUniversity.text,
                            collegename: collegename.text,
                            Area: Area.text,
                            cost: cost.text,
                            description: description.text,
                          ));
                        }
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
