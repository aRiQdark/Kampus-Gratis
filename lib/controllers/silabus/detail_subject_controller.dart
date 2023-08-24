
import 'package:get/get.dart';
import 'package:kampus_gratis/models/silabus/detail_subject.dart';

import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';

class DetailSubjectController extends GetxController
    with StateMixin<DataSubject> {
  final SilabusViewProvider _silabusViewProvider;

  DetailSubjectController(this._silabusViewProvider);

  RxString subjectDesc =
      'hahahahaohroiiweigirbibvb ruawuufhorhfjowjf hsuahghoor'.obs;

  RxBool isExpanded1 = false.obs;

  void changeExpanded1() {
    isExpanded1.toggle();
  }

  void getSubjectData() async {
    try {
      final data = await _silabusViewProvider.getDetailSubject();
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSubjectData();
  }
}
