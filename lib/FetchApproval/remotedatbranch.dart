import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/FetchApproval/modelsnewbranch.dart';

class FirestoreHelper {
  static Stream<List<UserModel4>> read() {
    final userCollection = FirebaseFirestore.instance.collection("BRANCH");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel4.fromSnapshot(e)).toList());
  }

  static Future create(UserModel4 user) async {
    final userCollection = FirebaseFirestore.instance.collection("BRANCH");
    final docRef = userCollection.doc();
    final newUser = UserModel4(
            branchname: user.branchname,
            collegename: user.collegename,
            faculties: user.faculties,
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
