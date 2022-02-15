import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/NewUser/controller/button_new_user_controller.dart';
import 'package:house_easy/app/modules/NewUser/model/new_user_model.dart';
import 'package:house_easy/app/modules/NewUser/viewmodel/new_user_register_vm.dart';
import 'package:house_easy/app/modules/login/Helpers/validator.dart';
import 'package:house_easy/app/modules/login/view/login_page.dart';
import 'package:house_easy/app/style/colors_guide.dart';

class NewUserView extends StatefulWidget {
  const NewUserView({Key? key}) : super(key: key);

  @override
  State<NewUserView> createState() => _NewUserViewState();
}

class _NewUserViewState extends State<NewUserView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final NewUserModel _newUser = NewUserModel();
  final Rx<bool> _isCheck = false.obs;
  final GlobalKey<FormState> _formNewUser = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsGuides().colorPredominant,
      body: Form(
        key: _formNewUser,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: _sizeScreen.width * 1,
                height: _sizeScreen.height * 0.35,
                child: Hero(
                  tag: "logo_splash",
                  child: Image.asset(
                    "assets/splash_screen/logo_houseEasy.jpg",
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
                        key: const Key("formName"),
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                            size: 20,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Nome Completo",
                        ),
                        validator: (name) {
                          return Validator().name(name!);
                        },
                        onSaved: (newValue) => _newUser.email = newValue!,
                      ),
                      Divider(
                        color: ColorsGuides().colorDetails,
                        thickness: 2,
                        height: 10,
                      ),
                      TextFormField(
                        key: const Key("formEmail"),
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                            size: 20,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "E-mail",
                        ),
                        validator: (email) {
                          return Validator().emailFormLogin(email!);
                        },
                        onSaved: (newValue) => _newUser.email = newValue!,
                      ),
                      Divider(
                        color: ColorsGuides().colorDetails,
                        thickness: 2,
                        height: 10,
                      ),
                      TextFormField(
                        key: const Key("formPassword"),
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.remove_red_eye_sharp,
                            color: Colors.white,
                            size: 20,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Senha",
                        ),
                        onSaved: (newValue) => _newUser.password = newValue!,
                        validator: (password) =>
                            Validator().password(password!),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "A senha deve ter ao menos 6 caracteres",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          fillColor: MaterialStateProperty.all(
                              ColorsGuides().colorDetails),
                          checkColor: Colors.white,
                          value: _isCheck.value,
                          onChanged: (value) {
                            _isCheck.value = value!;
                          }),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Ao criar uma conta, você concorda com os Termos e condições e com a política de privacidade da Houseasy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ValueListenableBuilder<bool>(
                valueListenable: ButtonNewUser.isLoad,
                builder: (context, isLoad, child) => isLoad
                    ? CircularProgressIndicator(
                        color: ColorsGuides().colorDetails)
                    : ElevatedButton(
                        key: const Key("buttonNewUser"),
                        onPressed: () async {
                          if (_formNewUser.currentState!.validate()) {
                            _formNewUser.currentState!.save();
                            NewUserRegisterVM().newUser(_newUser);
                          }
                        },
                        child: const Text(
                          "Criar conta",
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
                    "Já possui uma conta ?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.off(
                          () => const LoginPage(),
                        );
                      },
                      child: Text(
                        "Faça o Login!",
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
