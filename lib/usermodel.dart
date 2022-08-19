class Usermodel {
  String? uid;
  String? Instname;
  String? email;
  Usermodel({this.uid, this.Instname, this.email});
  factory Usermodel.fromMap(map) {
    return Usermodel(
      uid: map['uid'],
      Instname: map['Instname'],
      email: map['email'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'Instname': Instname,
    };
  }
}
