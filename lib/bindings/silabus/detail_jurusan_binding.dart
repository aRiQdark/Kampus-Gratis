import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/detail_jurusan_controller.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';
import 'package:kampus_gratis/services/repository/silabus/silabus_view_repository.dart';

class DetailJurusanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailJurusanController>(
        () => DetailJurusanController(Get.find()));
    Get.lazyPut(() => SilabusViewRepository(Get.find()));
    Get.lazyPut(() => SilabusViewProvider(Get.find()));
  }
}
