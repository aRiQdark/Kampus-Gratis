import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/program/program_controller.dart';
import 'package:kampus_gratis/services/providers/program/program_provider.dart';
import 'package:kampus_gratis/services/repository/program/program_repository.dart';

class ProgramBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramController>(() => ProgramController(Get.find()));
    Get.lazyPut<ProgramProvider>(() => ProgramProvider(Get.find()));
    Get.lazyPut<ProgramRepository>(() => ProgramRepository(Get.find()));
  }
}
