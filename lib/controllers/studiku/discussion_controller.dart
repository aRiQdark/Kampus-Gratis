import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kampus_gratis/models/studiku/discussion_model.dart';
import 'package:kampus_gratis/services/providers/studiku/discussion_provider.dart';

class DiscussionController extends GetxController
    with StateMixin<List<DiscussionModel>> {
  // get all discussion from id session

  final DiscussionProvider _discussionProvider;
  DiscussionController(this._discussionProvider);

  getAllDiscussionById(String idSession) async {
    try {
      var result = await _discussionProvider.getAllDiscussionById(idSession);
      change(result, status: RxStatus.success());

      return result;
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  // cek role

  RxString studentId = ''.obs;
  final localStorage = GetStorage();

  checkStudentId() {
    studentId.value = localStorage.read('student_id');
  }

  @override
  void onInit() {
    super.onInit();
    checkStudentId();
    getAllDiscussionById(Get.arguments[0]);
  }
}
