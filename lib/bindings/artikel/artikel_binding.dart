import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/artikel/artikel_controller.dart';
import 'package:kampus_gratis/services/providers/artikel/artikel_provider.dart';
import 'package:kampus_gratis/services/repository/artikel/artikel_repository.dart';

class ArtikelBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtikelRepository(Get.find()));
    Get.lazyPut(() => ArtikelProvider(Get.find()));

    Get.lazyPut(() => ArtikelController(Get.find()));
  }
}
