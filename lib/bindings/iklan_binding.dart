import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/iklan/iklan_controller.dart';
import 'package:kampus_gratis/services/providers/iklan/iklan_provider.dart';
import 'package:kampus_gratis/services/repository/iklan/iklan_repository.dart';

class IklanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IklanRepository(Get.find()));
    Get.lazyPut(() => IklanProvider(Get.find<IklanRepository>()));
    Get.lazyPut(() => IklanController(Get.find<IklanProvider>()));
  }
}
