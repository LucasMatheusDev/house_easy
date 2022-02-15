import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_easy/app/modules/NewUser/model/new_user_model.dart';

class NewUserRegisterRP {
  Future<UserCredential> createNewAccount(NewUserModel newUser) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final UserCredential _credential =
        await _auth.createUserWithEmailAndPassword(
            email: newUser.email!, password: newUser.password!);
    await _updateName(newUser.name!);
    return _credential;
  }

  Future<void> _updateName(String name) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      await _auth.currentUser?.updateDisplayName(name);
    }
  }
}
