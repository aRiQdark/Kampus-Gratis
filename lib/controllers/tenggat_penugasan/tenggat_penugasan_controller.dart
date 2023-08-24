import 'package:get/get.dart';
import 'package:kampus_gratis/models/tenggat_penugasan/assignment_model.dart';
import 'package:kampus_gratis/services/providers/tenggat_penugasan/tenggat_penugasan_provider.dart';

class TenggatPenugasanController extends GetxController
    with StateMixin<AssignmentModel> {
  final TenggatPenugasanProvider _tenggatPenugasanProvider;
  TenggatPenugasanController(this._tenggatPenugasanProvider);

  getAssignmentSubmissions() async {
    try {
      var result = await _tenggatPenugasanProvider.getAssignmentSubmissions();
      change(result, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getAssignmentSubmissions();
    super.onInit();
  }
}
