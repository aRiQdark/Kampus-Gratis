import 'package:get/get.dart';
import 'package:kampus_gratis/models/studiku/enrolled_subject_model.dart';
import 'package:kampus_gratis/services/providers/studiku/studiku_provider.dart';

class StudikuController extends GetxController
    with StateMixin<List<EnrolledSubjectModel>> {
  // enrolled subject

  StudikuController(this._studikuProvider);

  final StudikuProvider _studikuProvider;

  getAllEnrolledSubject() async {
    try {
      List<EnrolledSubjectModel>? response =
          await _studikuProvider.getAllEnrolledSubject();
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllEnrolledSubject();
  }
}
