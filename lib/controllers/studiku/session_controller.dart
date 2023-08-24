import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kampus_gratis/models/studiku/session_model.dart';
import 'package:kampus_gratis/services/providers/studiku/session_provider.dart';

class SessionStudikuController extends GetxController
    with StateMixin<List<SessionModel>> {
  SessionStudikuController(this._sessionProvider);
  RxList isExpanded = [].obs;

  final SessionProvider _sessionProvider;

  final localStorage = GetStorage();

  void changeExpanded(int indexParam) async {
    if (isExpanded[indexParam] == false) {
      isExpanded[indexParam] = true;
    } else {
      isExpanded[indexParam] = false;
    }
  }

  getAllSessionByid(String paramIdSession) async {
    try {
      change(null, status: RxStatus.loading());
      List<SessionModel>? response =
          await _sessionProvider.getAllSessionById(paramIdSession);

      if (response != null) {
        for (int i = 0; i <= response.length; i++) {
          isExpanded.insert(i, false);
        }
      }

      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllSessionByid(Get.arguments[0]);
  }
}
