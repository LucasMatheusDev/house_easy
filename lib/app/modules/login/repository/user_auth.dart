import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_easy/app/modules/login/model/user_login_model.dart';

class UserAuthenticRepository {
  Future<UserCredential?> authLogin(UserLoginModel login) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential? _credential;
    try {
      _credential = await _auth.signInWithEmailAndPassword(
          email: login.email, password: login.password);
    } on FirebaseAuthException catch (_) {
      return _credential;
    }

    return _credential;
  }
}
