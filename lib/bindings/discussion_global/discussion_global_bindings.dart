import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/discussion_global/discussion_global_controller.dart';
import 'package:kampus_gratis/services/providers/discussion_global/discussion_global_provider.dart';
import 'package:kampus_gratis/services/providers/studiku/discussion_provider.dart';
import 'package:kampus_gratis/services/repository/discussion_global/discussion_global_repository.dart';

class DiscussionGlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscussionGlobalRepository(Get.find()));
    Get.lazyPut(
        () => DiscussionGlobalProvider(Get.find<DiscussionGlobalRepository>()));

    Get.lazyPut(() => DiscussionGlobalController(
        Get.find<DiscussionGlobalProvider>(), Get.find<DiscussionProvider>()));

    // Get.lazyPut(() =>
    //     DiscussionGlobalAddController(Get.find<DiscussionGlobalProvider>()));
  }
}
