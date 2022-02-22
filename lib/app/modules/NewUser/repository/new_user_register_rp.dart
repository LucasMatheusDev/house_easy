import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:house_easy/app/modules/NewUser/model/new_user_model.dart';

class NewUserRegisterRP {
  Future<UserCredential?> createNewAccount(NewUserModel newUser) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential? _credential;
    try {
      _credential = await _auth.createUserWithEmailAndPassword(
          email: newUser.email!, password: newUser.password!);
      debugPrint("CREDENCIAL: $_credential");
      await _updateName(newUser.name!);
    } on FirebaseAuthException catch (_) {
      return _credential;
    }
    return _credential;
  }

  Future<void> _updateName(String name) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.currentUser?.updateDisplayName(name);
  }
}
