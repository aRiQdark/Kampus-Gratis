import 'package:get/get.dart';

import '../../controllers/nilai_sertifikat/nilai_controller.dart';
import '../../services/providers/nilai_sertifikat/nilai_provider.dart';
import '../../services/repository/nilai_sertifikat/nilai_repository.dart';

class NilaiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NilaiController(Get.find<nilaiProvider>()));
    Get.lazyPut(() => nilaiProvider(Get.find<NilaiRepository>()));
    Get.lazyPut(() => NilaiRepository(Get.find()));
  }
}
