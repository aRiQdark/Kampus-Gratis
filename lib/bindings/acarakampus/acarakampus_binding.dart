import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/Acara%20kampus/Acara_Controller.dart';
import 'package:kampus_gratis/services/providers/Acara%20Kampus/Acara_provider.dart';
import 'package:kampus_gratis/services/repository/Acara%20kampus/Acara_repository.dart';

class AcaraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcaraController(Get.find<AcaraProvider>()));
    Get.lazyPut(() => AcaraProvider(Get.find<AcaraRepository>()));
    Get.lazyPut(() => AcaraRepository(Get.find()));
  }
}
