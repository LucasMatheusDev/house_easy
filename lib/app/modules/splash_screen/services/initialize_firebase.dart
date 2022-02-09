import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class StartupFirebase {
  Future<void> initializeDefault() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}
