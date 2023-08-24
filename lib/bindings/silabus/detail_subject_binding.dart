import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/detail_subject_controller.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';
import 'package:kampus_gratis/services/repository/silabus/silabus_view_repository.dart';

class DetailSubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SilabusViewRepository(Get.find()));
    Get.lazyPut(() => SilabusViewProvider(Get.find()));
    Get.lazyPut<DetailSubjectController>(
        () => DetailSubjectController(Get.find()));
  }
}
