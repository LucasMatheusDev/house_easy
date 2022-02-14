import 'package:get/get.dart';
import 'package:house_easy/app/modules/login/view/login_page.dart';
import 'package:house_easy/app/modules/splash_screen/services/initialize_firebase.dart';

//! está classe é um REQUISITO para a splash screen

class InitialLoadServices {
  Future<void> load() async {
    _loadServices().then(
      (value) => Get.off(
        () => const LoginPage(),
        transition: Transition.fade,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _loadServices() async {
    // aqui será as funções que deveram ser carregadas ao iniciar o app
    await StartupFirebase().initializeDefault();
  }
}
