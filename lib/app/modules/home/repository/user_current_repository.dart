import 'package:firebase_auth/firebase_auth.dart';

class UserCurrentRepository {
  Future<User?> userCurrent() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return _auth.currentUser;
  }

  Future<bool> hasCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }
}
