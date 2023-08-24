import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/profil/profil_controller.dart';
import 'package:kampus_gratis/controllers/studiku/assignment_controller.dart';
import 'package:kampus_gratis/controllers/studiku/discussion_controller.dart';
import 'package:kampus_gratis/controllers/studiku/discussion_detail_controller.dart';
import 'package:kampus_gratis/controllers/studiku/session_controller.dart';
import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';
import 'package:kampus_gratis/controllers/studiku/studiku_controller.dart';
import 'package:kampus_gratis/services/providers/studiku/quiz_provider.dart';
import 'package:kampus_gratis/services/providers/studiku/session_provider.dart';
import 'package:kampus_gratis/services/providers/studiku/studiku_provider.dart';
import 'package:kampus_gratis/services/repository/studiku/quiz_repository.dart';
import 'package:kampus_gratis/services/providers/studiku/assignment_provider.dart';
import 'package:kampus_gratis/services/providers/studiku/discussion_provider.dart';
import 'package:kampus_gratis/services/repository/studiku/assignment_repository.dart';
import 'package:kampus_gratis/services/repository/studiku/discussion_repository.dart';
import 'package:kampus_gratis/services/repository/studiku/session_repository.dart';
import 'package:kampus_gratis/services/repository/studiku/studiku_repository.dart';

import '../../controllers/studiku/modul_controller.dart';
import '../../services/providers/studiku/module_provider.dart';
import '../../services/repository/studiku/module_repository.dart';

class StudikuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudikuRepository(Get.find()));
    Get.lazyPut(() => StudikuProvider(Get.find<StudikuRepository>()));
    Get.lazyPut(() => StudikuController(Get.find<StudikuProvider>()));

    Get.lazyPut(() => SessionRepository(Get.find()));
    Get.lazyPut(() => SessionProvider(Get.find<SessionRepository>()));
    Get.lazyPut(() => SessionStudikuController(Get.find<SessionProvider>()));

    Get.lazyPut(() => ModuleRepository(Get.find()));
    Get.lazyPut(() => ModuleProvider(Get.find<ModuleRepository>()));
    Get.lazyPut(() => ModulController(Get.find<ModuleProvider>()));

    Get.lazyPut(() => QuizRepository(Get.find()));
    Get.lazyPut(() => QuizProvider(Get.find<QuizRepository>()));
    Get.lazyPut(() => QuizController(Get.find<QuizProvider>()));
    Get.lazyPut(() => DiscussionRepository(Get.find()));
    Get.lazyPut(() => DiscussionProvider(Get.find<DiscussionRepository>()));
    Get.lazyPut(() => DiscussionController(Get.find<DiscussionProvider>()));
    Get.lazyPut(
        () => DiscussionDetailController(Get.find<DiscussionProvider>()));

    Get.lazyPut(() => ProfilController(Get.find()));


    Get.lazyPut(() => AssignmentRepository(Get.find()));
    Get.lazyPut(() => AssignmentProvider(Get.find<AssignmentRepository>()));
    Get.lazyPut(() => AssignmentController(Get.find<AssignmentProvider>()));
  }
}
