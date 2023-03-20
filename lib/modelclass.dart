import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  GetUserName({required this.documentId, required String doc});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return FittedBox(
              child: Column(
                children: [
                  DataTable(
                    dataRowColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected))
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.08);
                      return Color.fromRGBO(228, 228, 228, 0.722);
                      ;
                      // Use the default value.
                    }),
                    headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected))
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.08);
                      return Color.fromARGB(
                          255, 201, 220, 254); // Use the default value.
                    }),
                    dataRowHeight: 100,
                    headingRowHeight: 100,
                    border: TableBorder.all(width: 2),
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Institute Name',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${data['Instname']}" +
                                    "                                                                ",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ]),
                        numeric: true,
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${data['email']}",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
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
            );
            // Text(
            //   'Instname :-  ${data['Instname']}'
            //           "\n" +
            //       'email :-  ${data['email']}',
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // );
          }
          return Container();
        })));
  }
}
