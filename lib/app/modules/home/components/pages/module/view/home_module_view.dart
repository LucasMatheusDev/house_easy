import 'package:flutter/material.dart';

class HomeModuleView extends StatelessWidget {
  const HomeModuleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: const TextStyle(color: Colors.black54, fontSize: 15),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Parece que você ainda não",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "tem módulos pareados",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      "assets/home/pages/module/home_2.jpeg",
                      width: 350,
                    ),
                  ),
                  Column(children: const [
                    Text(
                      "Toque no ícone + na home para",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "adicionar módulos",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
