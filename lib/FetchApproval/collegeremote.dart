import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/FetchApproval/collegemodel.dart';

class FirestoreHelper1 {
  static Stream<List<UserModel5>> read() {
    final userCollection = FirebaseFirestore.instance.collection("COLLEGE");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel5.fromSnapshot(e)).toList());
  }

  static Future create(UserModel5 user) async {
    final userCollection = FirebaseFirestore.instance.collection("COLLEGE");
    final docRef = userCollection.doc();
    final newUser = UserModel5(
            collegename: user.collegename,
            ParentUniversity: user.ParentUniversity,
            Area: user.Area,
            cost: user.cost,
            description: user.description)
        .toJson();
    try {
      await docRef.set(newUser);
      Fluttertoast.showToast(msg: "Request Sended Successfully");
    } catch (e) {
      print("some error occures $e");
    }
  }
}
