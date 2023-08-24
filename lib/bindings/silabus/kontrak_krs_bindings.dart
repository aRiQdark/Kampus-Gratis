import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/draft_krs_controller.dart';
import 'package:kampus_gratis/controllers/silabus/kontrak_krs_controller.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';
import 'package:kampus_gratis/services/repository/silabus/silabus_view_repository.dart';

class KontrakKrsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KontrakKrsController(Get.find<SilabusViewProvider>()));
    Get.lazyPut(() => SilabusViewRepository(Get.find()));
    Get.lazyPut(() => SilabusViewProvider(Get.find<SilabusViewRepository>()));
    Get.lazyPut(() => DraftKrsController(Get.find()));
  }
}
