import 'package:flutter/material.dart';
import 'package:house_easy/app/modules/home/components/custom_appbar/components/smile_edit_profile.widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 6,
      child: SizedBox(
        width: widget.sizeScreen.width,
        height: widget.sizeScreen.height * 0.55,
        child: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints.minHeight);
            return (DraggableScrollableSheet(
              initialChildSize: 0.30,
              minChildSize: 0.30,
              builder: (context, scrollController) {
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // scrollController.positions.last.minScrollExtent >
                              //         0.0
                              //     ? Container()
                              //     :
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
                              // scrollController.positions.last.minScrollExtent <=
                              //         0.0
                              //     ? const CustomAppBarTitleWidget()
                              //     :
                              const Spacer(),
                              Container(
                                height: 5,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
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
            ));
          },
        ),
        //),
      ),
    );
  }
}
