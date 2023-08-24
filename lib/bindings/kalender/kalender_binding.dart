import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/Kalender/kalender_controller.dart';
import 'package:kampus_gratis/services/providers/kalender/Kalender_provider.dart';
import 'package:kampus_gratis/services/repository/kalender/kalender_repository.dart';

class KalenderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KalenderController>(() => KalenderController(Get.find()));
    Get.lazyPut(() => KalenderProvider(Get.find()));
    Get.lazyPut(() => KalenderRepository(Get.find()));
  }
}
