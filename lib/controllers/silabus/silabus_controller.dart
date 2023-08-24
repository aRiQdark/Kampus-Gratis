import 'package:get/get.dart';
import 'package:kampus_gratis/models/silabus/majors_model.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';

class SilabusController extends GetxController with StateMixin<List<Majors>?> {
  SilabusController(
    this._silabusViewProvider,
  );

  final SilabusViewProvider _silabusViewProvider;

  getSilabusData(String facultyId) async {
    try {
      final modul = await _silabusViewProvider.getData(facultyId);
      change(modul, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSilabusData(Get.arguments);
  }
}
