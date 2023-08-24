import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/app_controller.dart';
import 'package:kampus_gratis/controllers/profil/profil_controller.dart';
import 'package:kampus_gratis/services/providers/profile_provider.dart';
import 'package:kampus_gratis/services/repository/profile_repository.dart';

class ProfilBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => ProfileRepository(Get.find()));
    Get.lazyPut(() => ProfileProvider(Get.find<ProfileRepository>()));
    Get.lazyPut(() => ProfilController(Get.find<ProfileProvider>()));
  }
}
