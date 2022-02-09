import 'package:flutter/material.dart';
import 'package:house_easy/app/style/colors_guide.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsGuides().colorPredominant,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: "logo_splash",
                child: Image.asset("assets/splash_screen/logo_houseEasy.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF273244).withOpacity(1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.cancel,
                              color: Colors.white,
                              size: 20,
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "E-mail"),
                      ),
                      Divider(
                        color: ColorsGuides().colorDetails,
                        thickness: 2,
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Senha"),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Esqueceu a senha ?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Entrar",
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all((RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))),
                  minimumSize: MaterialStateProperty.all(const Size(180, 40)),
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF02F2F1),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Não tem uma conta ?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Crie uma agora!",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
