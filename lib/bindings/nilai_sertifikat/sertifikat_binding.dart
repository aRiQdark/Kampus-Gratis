import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/nilai_sertifikat/nilai_controller.dart';
import 'package:kampus_gratis/controllers/nilai_sertifikat/sertifikat_controller.dart';
import 'package:kampus_gratis/services/providers/nilai_sertifikat/nilai_provider.dart';
import 'package:kampus_gratis/services/providers/nilai_sertifikat/sertifikat_provider.dart';
import 'package:kampus_gratis/services/repository/nilai_sertifikat/nilai_repository.dart';
import 'package:kampus_gratis/services/repository/nilai_sertifikat/sertifikat_repository.dart';

class SertifikatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SertifikatController(Get.find<SertifikatProvider>()));
    Get.lazyPut(() => SertifikatProvider(Get.find<SertifikatRepository>()));
    Get.lazyPut(() => SertifikatRepository(Get.find()));
    Get.lazyPut(() => NilaiController(Get.find<nilaiProvider>()));
    Get.lazyPut(() => nilaiProvider(Get.find<NilaiRepository>()));
    Get.lazyPut(() => NilaiRepository(Get.find()));
  }
}
