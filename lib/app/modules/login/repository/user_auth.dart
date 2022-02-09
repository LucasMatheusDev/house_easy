
import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_easy/app/modules/login/model/user_login_model.dart';

class UserAuthenticRepository {
  Future<UserCredential> authLogin(UserLoginModel login) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final UserCredential _credential = await _auth.signInWithEmailAndPassword(
        email: login.email, password: login.password);
    return _credential;
  }
}
