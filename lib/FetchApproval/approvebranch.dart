import 'package:flutter/material.dart';
import 'package:login/modelsnewbranch.dart';
import 'package:login/remotedatbranch.dart';

class approvebranch extends StatefulWidget {
  const approvebranch({Key? key}) : super(key: key);

  @override
  State<approvebranch> createState() => _approvebranchState();
}

class _approvebranchState extends State<approvebranch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "BRANCH APPROVAL",
          style: TextStyle(
            fontSize: 23,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: StreamBuilder<List<UserModel4>>(
            stream: FirestoreHelper.read(),
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
                    padding: const EdgeInsets.all(2.0),
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
                                      return Color.fromRGBO(228, 228, 228,
                                          0.722); // Use the default value.
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
                                            "Branch",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${singleUser.branchname}",
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
                                            "Total Faculties",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${singleUser.faculties}",
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
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Text(
                                            "${singleUser.description}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
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

                            // child: Column(
                            //   children: [
                            //     ListTile(
                            //         title: Text(
                            //       "COLLEGE NAME : ${singleUser.collegename} \n" +
                            //           "BRANCH NAME : ${singleUser.branchname} \n" +
                            //           "FACULTIES : ${singleUser.faculties} \n" +
                            //           "DESCRIPTION  : \n${singleUser.description} \n",
                            //       style: TextStyle(
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.bold),
                            //     )),
                            //     SizedBox(
                            //       height: 10,
                            //     )
                            //   ],
                            // ),
                          );
                        }),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
