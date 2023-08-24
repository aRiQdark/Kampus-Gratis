import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/beranda/beranda_controller.dart';

class BerandaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BerandaController());
  }
}
