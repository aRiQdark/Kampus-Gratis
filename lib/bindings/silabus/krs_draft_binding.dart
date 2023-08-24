import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/draft_krs_controller.dart';
import 'package:kampus_gratis/services/providers/krs/krs_provider.dart';
import 'package:kampus_gratis/services/repository/krs/krs_repository.dart';

class KrsDraftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DraftKrsController>(() => DraftKrsController(Get.find()));
    Get.lazyPut(() => KrsProvider(Get.find()));
    Get.lazyPut(() => KrsRepository(Get.find()));
  }
}
