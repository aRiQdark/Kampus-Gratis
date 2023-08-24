import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/administrasi/data_diri/data_diri_controller.dart';
import 'package:kampus_gratis/services/providers/administrasi/administrasi_provider.dart';
import 'package:kampus_gratis/services/repository/administrasi/administrasi_repository.dart';

class DataDiriBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdministrasiRepository(Get.find()));
    Get.lazyPut(() => AdministrasiProvider(Get.find<AdministrasiRepository>()));
    Get.lazyPut<DataDiriController>(
        () => DataDiriController(Get.find<AdministrasiProvider>()));
  }
}
