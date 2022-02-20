import 'package:flutter/material.dart';
import 'package:house_easy/app/style/colors_guide.dart';

class SmileEditProfile extends StatelessWidget {
  const SmileEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: ColorsGuides().colorPredominant,
        borderRadius: BorderRadius.circular(60),
        border: Border.all(color: ColorsGuides().colorDetails),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: ColorsGuides().colorDetails,
                  borderRadius: BorderRadius.circular(60),
                ),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Container(
              width: 35,
              height: 50,
              decoration: const BoxDecoration(
                // border: Border.all(color: ColorsGuides().colorDetails)
                // borderRadius: BorderRadius.all(Radius.circular(20),),
                border: Border(
                  bottom: BorderSide(
                      color: Colors.white,
                      width: 2.5,
                      style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
                child: const Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 12,
                ),
              ),
            ),
          )
        ],
      ),
      margin: const EdgeInsets.all(8),
    );
  }
}
