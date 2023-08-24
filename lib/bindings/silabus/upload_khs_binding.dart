import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/upload_khs_controller.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';
import 'package:kampus_gratis/services/repository/silabus/silabus_view_repository.dart';

class UploadKhsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadKhsController(Get.find<SilabusViewProvider>()));
    Get.lazyPut(() => SilabusViewRepository(Get.find()));
    Get.lazyPut(() => SilabusViewProvider(Get.find<SilabusViewRepository>()));
  }
}
