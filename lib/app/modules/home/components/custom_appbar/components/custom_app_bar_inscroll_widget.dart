import 'package:flutter/material.dart';
import 'package:house_easy/app/modules/home/components/custom_appbar/components/smile_edit_profile.widget.dart';

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
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () {},
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
