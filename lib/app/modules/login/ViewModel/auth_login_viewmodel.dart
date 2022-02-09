import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/login/controller/load_button_login_controller.dart';
import 'package:house_easy/app/modules/login/model/user_login_model.dart';
import 'package:house_easy/app/modules/login/repository/user_auth.dart';

class AuthLoginViewModel {
  Future login(UserLoginModel user) async {
    LoadButtonLoginController.isLoad.value = true;
    final _credencial = await UserAuthenticRepository().authLogin(user);
    if (_credencial.credential == null) {
      LoadButtonLoginController.isLoad.value = false;
      return Get.snackbar(
          "Usuário invalido", "verifique os campos e tente novamente");
    }
    if (_credencial.credential != null) {
      LoadButtonLoginController.isLoad.value = false;
      //! caso de certo passar para a proxima tela
      debugPrint("usuário validado");
    }
  }
}
