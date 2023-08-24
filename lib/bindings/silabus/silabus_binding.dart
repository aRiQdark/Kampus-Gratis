import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/silabus_controller.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';
import 'package:kampus_gratis/services/repository/silabus/silabus_view_repository.dart';

class SilabusBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SilabusViewRepository(Get.find()));
    Get.lazyPut(() => SilabusViewProvider(Get.find<SilabusViewRepository>()));
    Get.lazyPut(() => SilabusController(Get.find<SilabusViewProvider>()));
    // Get.lazyPut(() => DetailJurusanRepository(Get.find()));
    // Get.lazyPut(() => DetailJurusanProvider(Get.find()));
  }
}
