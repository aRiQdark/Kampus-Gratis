import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_buku_controller.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_controller.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_kamus_kg_controller.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_video_controller.dart';
import 'package:kampus_gratis/services/providers/panduan/panduan_provider.dart';
import 'package:kampus_gratis/services/repository/panduan/panduan_repository.dart';

class PanduanBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PanduanRepository(Get.find()));
    Get.lazyPut(() => PanduanProvider(Get.find<PanduanRepository>()));
    Get.lazyPut(() => PanduanController());
    Get.lazyPut(() => PanduanVideoController(Get.find<PanduanProvider>()));
    Get.lazyPut(() => PanduanBukuController(Get.find<PanduanProvider>()));
    Get.lazyPut(() => PanduanKamusKGController(Get.find<PanduanProvider>()));
  }
}
