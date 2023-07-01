import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:login/FetchApproval/collegemodel.dart';
import 'package:login/FetchApproval/collegeremote.dart';

class Collegeapp extends StatefulWidget {
  const Collegeapp({Key? key}) : super(key: key);

  @override
  State<Collegeapp> createState() => _CollegeappState();
}

class _CollegeappState extends State<Collegeapp> {
  Future<void> _handlerefresh() async {
    return await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "COLLEGE APPROVALS",
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        body: LiquidPullToRefresh(
          onRefresh: _handlerefresh,
          color: Colors.blue,
          height: 200,
          animSpeedFactor: 5,
          backgroundColor: Color.fromARGB(255, 237, 255, 255),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: StreamBuilder<List<UserModel5>>(
                stream: FirestoreHelper1.read(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("some error Occured"),
                    );
                  }
                  if (snapshot.hasData) {
                    final userData = snapshot.data;

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: ListView.builder(
                            itemCount: userData!.length,
                            itemBuilder: (context, index) {
                              final singleUser = userData[index];
                              return Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 6,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 255, 245, 250),
                                      Color.fromARGB(255, 255, 245, 250),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: FittedBox(
                                  child: Column(
                                    children: [
                                      DataTable(
                                        dataRowColor: MaterialStateProperty
                                            .resolveWith<Color?>(
                                                (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.selected))
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.08);
                                          return Color.fromRGBO(
                                              228, 228, 228, 0.722);
                                          ;
                                          // Use the default value.
                                        }),
                                        headingRowColor: MaterialStateProperty
                                            .resolveWith<Color?>(
                                                (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.selected))
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.08);
                                          return Color.fromARGB(255, 201, 220,
                                              254); // Use the default value.
                                        }),
                                        dataRowHeight: 100,
                                        headingRowHeight: 100,
                                        border: TableBorder.all(width: 2),
                                        columns: <DataColumn>[
                                          DataColumn(
                                            label: Text(
                                              'College Name',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${singleUser.collegename}" +
                                                        "                                                                ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ]),
                                            numeric: true,
                                          ),
                                        ],
                                        rows: <DataRow>[
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text(
                                                "Parent University",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataCell(Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${singleUser.ParentUniversity}",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text(
                                                "Total Area",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataCell(Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${singleUser.Area}",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text(
                                                "Total Cost",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataCell(Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${singleUser.cost}",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text(
                                                "Description",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataCell(Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${singleUser.description}",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: Container(
                                          height: 30,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ),
      ),
    );
  }
}
