import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/administrasi/berkas/berkas_controller.dart';
import 'package:kampus_gratis/services/providers/administrasi/administrasi_provider.dart';
import 'package:kampus_gratis/services/repository/administrasi/administrasi_repository.dart';

class BerkasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdministrasiProvider(Get.find()));
    Get.lazyPut(() => AdministrasiRepository(Get.find()));
    Get.lazyPut<BerkasController>(() => BerkasController(Get.find()));
  }
}
