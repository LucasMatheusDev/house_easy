import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/home/components/pages/initial/view/home_initial_view.dart';
import 'package:house_easy/app/modules/home/components/pages/module/view/home_module_view.dart';

class HomePagesController extends GetxController {
  static Rx<int> pageSelected = 0.obs;

  List<Widget> pages = <Widget>[
    //* Aqui seria as telas da home view
    const HomeInitialView(),
    const HomeModuleView(),
    const Center(
      child: Text(
        "TELA 3",
        style: TextStyle(color: Colors.black),
      ),
    ),
    const Center(
      child: Text("TELA 4"),
    ),
    const Center(
      child: Text("TELA 5"),
    ),
    const Center(
      child: Text("TELA 6"),
    ),
    const Center(
      child: Text("TELA 7"),
    ),
    const Center(
      child: Text("TELA 8"),
    ),
    const Center(
      child: Text("TELA 9"),
    ),
  ];

  void setPageHome(int index) {
    pageSelected.value = index;
    update();
  }
}
