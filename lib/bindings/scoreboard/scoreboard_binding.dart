import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/scoreboard/scoreboard_controller.dart';
import 'package:kampus_gratis/services/providers/scoreboard/scoreboard_provider.dart';
import 'package:kampus_gratis/services/repository/scoreboard/scoreboard_repository.dart';

class ScoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScoreController(Get.find<ScoreProvider>()));
    Get.lazyPut(() => ScoreProvider(Get.find<ScoreboardRepository>()));
    Get.lazyPut(() => ScoreboardRepository(Get.find()));
  }
}
