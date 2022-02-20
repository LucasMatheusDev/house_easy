import 'package:get/get.dart';
import 'package:house_easy/app/modules/home/view/home_view.dart';
import 'package:house_easy/app/modules/login/controller/load_button_login_controller.dart';
import 'package:house_easy/app/modules/login/model/user_login_model.dart';
import 'package:house_easy/app/modules/login/repository/user_auth.dart';

class AuthLoginViewModel {
  Future login(UserLoginModel user) async {

    LoadButtonLoginController.isLoad.value = true;
    
    final _credencial = await UserAuthenticRepository().authLogin(user);

    if (_credencial == null) {
      LoadButtonLoginController.isLoad.value = false;
      return Get.snackbar(
          "Usuário invalido", "verifique os campos e tente novamente");
    }
    if (_credencial.user != null) {
     Get.off(
        () => const HomeView(),
        transition: Transition.fadeIn,
        duration: const Duration(seconds: 1),
      );
      LoadButtonLoginController.isLoad.value = false;
     
    }
  }
}
