import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:house_easy/app/modules/home/controller/user_current_controller.dart';
import 'package:house_easy/app/modules/home/model/user_model.dart';
import 'package:house_easy/app/modules/home/repository/user_current_repository.dart';
import 'package:house_easy/app/modules/login/view/login_page.dart';

class UserCurrentViewModel {
  Future<UserModel?> currentUser() async {
    UserModel? userModel;
    final hasCurrentUser = await UserCurrentRepository().hasCurrentUser();
    if (hasCurrentUser) {
      final User? _userCurrent = await UserCurrentRepository().userCurrent();
      userModel = UserModel(_userCurrent);
      UserCurrentController.name.value = "Boa tarde, ${userModel.name}";
    } else {
      Get.off(() => const LoginPage());
    }
    return userModel;
  }
}
