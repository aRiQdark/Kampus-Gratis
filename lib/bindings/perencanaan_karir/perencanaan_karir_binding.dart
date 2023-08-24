import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/perencanaan_karir/perencanaan_karir_controller.dart';
import 'package:kampus_gratis/services/providers/perencanaan_karir/perencanaan_karir_provider.dart';
import 'package:kampus_gratis/services/repository/perencanaan_karir/perencanaan_karir_repository.dart';

class PerencanaanKarirBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerencanaanKarirRepository(Get.find()));
    Get.lazyPut(
        () => PerencanaanKarirProvider(Get.find<PerencanaanKarirRepository>()));
    Get.lazyPut(
        () => PerencanaanKarirController(Get.find<PerencanaanKarirProvider>()));
  }
}
