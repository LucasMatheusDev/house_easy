import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/home/view/home_view.dart';

import 'app/modules/splash_screen/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'House Easy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        );
  }
}
