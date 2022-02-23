import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/home/controller/user_current_controller.dart';
import 'package:house_easy/app/style/colors_guide.dart';

class CustomAppBarTitleWidget extends StatelessWidget {
  final bool isAdd;
  const CustomAppBarTitleWidget({Key? key, this.isAdd = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.notifications,
          color: Colors.white,
        ),
       Obx(() => Text(
          UserCurrentController.name.value,
          style: TextStyle(color: ColorsGuides().colorDetails, fontSize: 15),
        ),
       ),
        isAdd
            ? const Icon(Icons.add, color: Colors.white)
            : const Icon(
                Icons.cancel_sharp,
                color: Colors.white,
              ),
      ],
    );
  }
}
