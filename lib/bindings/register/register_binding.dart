import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/register/register_controller.dart';
import 'package:kampus_gratis/services/providers/auth/auth_provider.dart';
import 'package:kampus_gratis/services/repository/auth/auth_repository.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find()));
    Get.lazyPut<AuthProvider>(() => AuthProvider(Get.find()));
    Get.lazyPut<RegisterController>(() => RegisterController(Get.find()));
  }
}
