import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/administrasi/data_keluarga/data_keluarga_controller.dart';
import 'package:kampus_gratis/services/providers/administrasi/administrasi_provider.dart';
import 'package:kampus_gratis/services/repository/administrasi/administrasi_repository.dart';

class DataKeluargaBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AdministrasiProvider(Get.find()));
    Get.lazyPut(() => AdministrasiRepository(Get.find()));
    Get.lazyPut<DataKeluargaController>(() => DataKeluargaController(Get.find()));
  }

}