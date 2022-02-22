import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/home/components/custom_appbar/custom_app_bar_widget.dart';
import 'package:house_easy/app/modules/home/components/custom_bottomNavigationBar/custom_bottom_navigator_bar_widget.dart';
import 'package:house_easy/app/modules/home/controller/home_pages_controller.dart';
import 'package:house_easy/app/modules/home/viewmodel/user_current_viewmodel.dart';
import 'package:house_easy/app/style/colors_guide.dart';

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
      body: FutureBuilder(
        future: UserCurrentViewModel().currentUser(),
        key: const Key("homeFutureKey"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: EdgeInsets.only(top: _sizeScreen.height * 0.15),
              child: Center(
                child: Obx(
                  () => HomePagesController()
                      .pages
                      .elementAt(HomePagesController.pageSelected.value),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: ColorsGuides().colorDetails,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNavigatorBar(),
    );
  }
}
