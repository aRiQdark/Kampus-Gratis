import 'package:get/get.dart';
import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/services/networks/base_provider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseProvider(), permanent: true);
    Get.put(ApiService(Get.find()), permanent: true);
  }
}
