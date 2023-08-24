import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/tenggat_penugasan/tenggat_penugasan_controller.dart';
import 'package:kampus_gratis/services/providers/tenggat_penugasan/tenggat_penugasan_provider.dart';
import 'package:kampus_gratis/services/repository/tenggat_penugasan/tenggat_penugasan_repository.dart';

class TenggatPenugasanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TenggatPenugasanRepository(Get.find()));
    Get.lazyPut(
        () => TenggatPenugasanProvider(Get.find<TenggatPenugasanRepository>()));
    Get.lazyPut(
        () => TenggatPenugasanController(Get.find<TenggatPenugasanProvider>()));
  }
}
