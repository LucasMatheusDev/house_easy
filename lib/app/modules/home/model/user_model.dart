import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  String? email;
  String? uid;
  bool? emailVerified;
  String? photoUrl;

  UserModel(User? user) {
    name = user?.displayName;
    email = user?.email;
    uid = user?.uid;
    emailVerified = user?.emailVerified;
    photoUrl = user?.photoURL;
  }
}
