import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/login/login_controller.dart';
import 'package:kampus_gratis/services/providers/auth/auth_provider.dart';
import 'package:kampus_gratis/services/repository/auth/auth_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find()));
    Get.lazyPut<AuthProvider>(() => AuthProvider(Get.find()));

    Get.lazyPut<LoginController>(() => LoginController(Get.find()));
  }
}
