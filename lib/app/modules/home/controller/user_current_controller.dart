import 'package:house_easy/app/modules/home/model/user_model.dart';
import 'package:house_easy/app/modules/home/viewmodel/user_current_viewmodel.dart';

class UserCurrentController {
  static String? name;

  Future<void> updateName() async {
    UserModel? user = await UserCurrentViewModel().currentUser();
    name = user?.name;
  }
}
