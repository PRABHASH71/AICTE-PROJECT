import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel5 {
  final String? ParentUniversity;
  final String? collegename;
  final String? Area;
  final String? cost;
  final String? description;
  UserModel5({
    this.ParentUniversity,
    this.collegename,
    this.Area,
    this.cost,
    this.description,
  });

  factory UserModel5.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel5(
      collegename: snapshot['collegename'],
      ParentUniversity: snapshot['ParentUniversity'],
      Area: snapshot['Area'],
      cost: snapshot['cost'],
      description: snapshot['description'],
    );
  }
  Map<String, dynamic> toJson() => {
        "ParentUniversity": ParentUniversity,
        "collegename": collegename,
        "Area": Area,
        "cost": cost,
        "description": description,
      };
}
