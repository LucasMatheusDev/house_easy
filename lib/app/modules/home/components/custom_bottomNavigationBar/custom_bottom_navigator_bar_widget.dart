import 'package:flutter/material.dart';
import 'package:house_easy/app/modules/home/controller/home_pages_controller.dart';
import 'package:house_easy/app/style/colors_guide.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  const CustomBottomNavigatorBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigatorBar> createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(30)),
      child: BottomNavigationBar(
        elevation: 0.7,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        backgroundColor: ColorsGuides().colorPredominant,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Icon(Icons.crop_square_rounded),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Icon(Icons.settings),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
        selectedItemColor: ColorsGuides().colorDetails,
        onTap: (value) {
          setState(() {
            HomePagesController().setPageHome(value);
          });
        },
        currentIndex: HomePagesController.pageSelected.value,
      ),
    );
  }
}
