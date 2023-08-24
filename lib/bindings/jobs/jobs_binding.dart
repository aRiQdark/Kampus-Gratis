import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/job/job_controller.dart';
import 'package:kampus_gratis/services/providers/job/job_provider.dart';
import 'package:kampus_gratis/services/repository/job/job_repository.dart';

class JobsBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<JobController>(() => JobController(Get.find()));
    Get.lazyPut(() => JobProvider(Get.find()));
    Get.lazyPut(() => JobRepository(Get.find()));
  }
}
