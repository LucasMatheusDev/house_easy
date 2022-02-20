import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/home/components/custom_appbar/custom_app_bar_widget.dart';
import 'package:house_easy/app/modules/home/components/custom_bottomNavigationBar/custom_bottom_navigator_bar_widget.dart';
import 'package:house_easy/app/modules/home/controller/home_pages_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      primary: true,
      appBar: CustomAppBar(
        sizeScreen: _sizeScreen,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: _sizeScreen.height * 0.15),
        child: Center(
          child: Obx(
            () => HomePagesController()
                .pages
                .elementAt(HomePagesController.pageSelected.value),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigatorBar(),
    );
  }
}
