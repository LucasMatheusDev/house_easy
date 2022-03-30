import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/NewUser/view/new_user_view.dart';
import 'package:house_easy/app/modules/login/Helpers/validator.dart';
import 'package:house_easy/app/modules/login/ViewModel/auth_login_viewmodel.dart';
import 'package:house_easy/app/modules/login/controller/load_button_login_controller.dart';
import 'package:house_easy/app/modules/login/model/user_login_model.dart';
import 'package:house_easy/app/style/colors_guide.dart';
import 'package:house_easy/app/style/logo_guide.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserLoginModel user = UserLoginModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  RxBool isObscure = true.obs;

  @override
  Widget build(BuildContext context) {
    final Size _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorsGuides().colorPredominant,
      body: Form(
        key: _formLogin,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: _sizeScreen.width * 1,
                height: _sizeScreen.height * 0.35,
                child: Hero(
                  tag: "logo_splash",
                  child: Image.asset(
                    LogoGuide.logo,
                  ),
                ),
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
                        key: const Key("TextFormEmail"),
                        style: const TextStyle(color: Colors.white),
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: const Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            splashRadius: 1,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              _emailController.text = "";
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: "E-mail",
                        ),
                        validator: (email) {
                          return Validator().emailFormLogin(email!);
                        },
                        onSaved: (newValue) => user.email = newValue!,
                      ),
                      Divider(
                        color: ColorsGuides().colorDetails,
                        thickness: 2,
                        height: 10,
                      ),
                      Obx(
                        () => TextFormField(
                          key: const Key("TextFormPassword"),
                          style: const TextStyle(color: Colors.white),
                          controller: _passwordController,
                          obscureText: isObscure.value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              splashRadius: 1,
                              splashColor: Colors.transparent,
                              onPressed: () {
                                isObscure.value = !isObscure.value;
                              },
                              icon: Icon(
                                isObscure.value
                                    ? Icons.lock
                                    : Icons.remove_red_eye_sharp,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: "Senha",
                          ),
                          validator: (value) {
                            return Validator().password(value!);
                          },
                          onSaved: (newValue) => user.password = newValue!,
                        ),
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
              ValueListenableBuilder<bool>(
                valueListenable: LoadButtonLoginController.isLoad,
                builder: (context, isLoad, child) => isLoad
                    ? CircularProgressIndicator(
                        color: ColorsGuides().colorDetails)
                    : ElevatedButton(
                        key: const Key("buttonKey"),
                        onPressed: () async {
                          if (_formLogin.currentState!.validate()) {
                            _formLogin.currentState!.save();
                            AuthLoginViewModel().login(user);
                          }
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              (RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                          minimumSize:
                              MaterialStateProperty.all(const Size(180, 40)),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF02F2F1),
                          ),
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
                      onPressed: () {
                        Get.to(
                          () => const NewUserView(),
                          transition: Transition.fadeIn,
                        );
                      },
                      child: Text(
                        "Crie uma agora!",
                        style: TextStyle(color: ColorsGuides().colorDetails),
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
