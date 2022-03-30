import 'package:flutter/material.dart';
import 'package:house_easy/app/modules/home/components/custom_appbar/components/smile_edit_profile.widget.dart';
import 'package:house_easy/app/modules/home/controller/home_pages_controller.dart';
import 'package:house_easy/app/modules/home/controller/user_current_controller.dart';

class CustomAppbarInScroll extends StatelessWidget {
  const CustomAppbarInScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SmileEditProfile(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.stay_current_landscape,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
              
                HomePagesController.pageSelected.value = 5;
                UserCurrentController.name.value = "Módulos";
              },
              child: const Text(
                "Módulos",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.people,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
                UserCurrentController.name.value = "Permissões";
                HomePagesController.pageSelected.value = 6;
              },
              child: const Text(
                "Permissões",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
                HomePagesController.pageSelected.value = 7;

                UserCurrentController.name.value = "configurações";
              },
              child: const Text(
                "Configurações",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.help_outline_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
                
                HomePagesController.pageSelected.value = 8;

                UserCurrentController.name.value = "Ajuda";
              },
              child: const Text(
                "Ajuda",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
