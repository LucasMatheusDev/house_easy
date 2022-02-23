import 'package:flutter/material.dart';
import 'package:house_easy/app/modules/home/components/custom_appbar/components/custom_app_bar_inscroll_widget.dart';
import 'package:house_easy/app/modules/home/components/custom_appbar/components/custom_app_bar_title_widget.dart';
import 'package:house_easy/app/style/colors_guide.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Size sizeScreen;
  const CustomAppBar({Key? key, required this.sizeScreen}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => sizeScreen;
}

class _CustomAppBarState extends State<CustomAppBar> {
  final double _minChildSize = 0.35;

  @override
  Widget build(BuildContext context) {
    final sizeAppBar = widget.sizeScreen.height * 0.55;
    final sizeAppBarMin = sizeAppBar * _minChildSize + 0.5;
    return RotatedBox(
      quarterTurns: 6,
      child: SizedBox(
        width: widget.sizeScreen.width,
        height: widget.sizeScreen.height * 0.55,
        child: DraggableScrollableSheet(
          snap: true,
          initialChildSize: _minChildSize,
          minChildSize: _minChildSize,
          builder: (context, scrollController) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return ListView(
                  shrinkWrap: true,
                  itemExtent: widget.sizeScreen.height * 0.55,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  controller: scrollController,
                  children: [
                    RotatedBox(
                      quarterTurns: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsGuides().colorPredominant,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 35, bottom: 5, left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment:
                                constraints.maxHeight <= sizeAppBarMin
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                            children: [
                              constraints.maxHeight > sizeAppBarMin
                                  ? const CustomAppBarTitleWidget(isAdd: false)
                                  : Container(),
                              constraints.maxHeight >= sizeAppBarMin
                                  ? const CustomAppbarInScroll()
                                  : Container(),
                              constraints.maxHeight <= sizeAppBarMin
                                  ? const CustomAppBarTitleWidget()
                                  : Container(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  height: 5,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      //),
    );
  }
}
