import 'package:flutter/material.dart';
import 'package:house_easy/app/modules/splash_screen/viewmodel/initial_load_services.dart';
import 'package:house_easy/app/style/colors_guide.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // carregamento de algum dado
    InitialLoadServices().load();
    final Size _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsGuides().colorPredominant,
      body: Hero(
        
        tag: "logo_splash",
        child: Image.asset(
          "assets/splash_screen/logo_houseEasy.jpg",
          width: _sizeScreen.width,
          height: _sizeScreen.height,
        ),
      ),
    );
  }
}
