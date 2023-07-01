import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel4 {
  final String? branchname;
  final String? collegename;
  final String? faculties;
  final String? description;
  UserModel4({
    this.branchname,
    this.collegename,
    this.faculties,
    this.description,
  });

  factory UserModel4.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel4(
      collegename: snapshot['collegename'],
      branchname: snapshot['branchname'],
      faculties: snapshot['faculties'],
      description: snapshot['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        "branchname": branchname,
        "collegename": collegename,
        "faculties": faculties,
        "description": description,
      };
}
