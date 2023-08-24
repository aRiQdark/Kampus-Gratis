import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/administrasi/verifikasi_akhir/verifikasi_akhir_controller.dart';

import '../../../services/providers/administrasi/administrasi_provider.dart';
import '../../../services/repository/administrasi/administrasi_repository.dart';

class VerifikasiAkhirBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdministrasiProvider(Get.find()));
    Get.lazyPut(() => AdministrasiRepository(Get.find()));
    Get.lazyPut<VerifikasiAkhirController>(
        () => VerifikasiAkhirController(Get.find()));
  }
}
