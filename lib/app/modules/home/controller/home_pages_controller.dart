import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/home/components/pages/initial/view/home_initial_view.dart';
import 'package:house_easy/app/modules/home/components/pages/module/view/home_module_view.dart';

class HomePagesController extends GetxController {
  static Rx<int> pageSelected = 0.obs;

  List<Widget> pages = <Widget>[
    const HomeInitialView(),
    const HomeModuleView(),
    const Center(child: Text("TELA 3", style: TextStyle(color: Colors.black),),),
    const Center(child: Text("TELA 4"),)
  ];

  void setPageHome(int index) {
    pageSelected.value = index;
    update();
  }
}
