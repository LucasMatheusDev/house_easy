import 'package:get/get.dart';
import 'package:house_easy/app/modules/NewUser/controller/button_new_user_controller.dart';
import 'package:house_easy/app/modules/NewUser/model/new_user_model.dart';
import 'package:house_easy/app/modules/NewUser/repository/new_user_register_rp.dart';

class NewUserRegisterVM {
  Future<void> newUser(NewUserModel newUser) async {
    ButtonNewUser.isLoad.value = true;
    final _credential = await NewUserRegisterRP().createNewAccount(newUser);
    if (_credential.user == null) {
      Get.snackbar(
          "Cadastro invalido", "Por favor, verifique os campos digitados");
    }else{  
      //! vai para a tela inicial
    }
    ButtonNewUser.isLoad.value = false;

  }
}
