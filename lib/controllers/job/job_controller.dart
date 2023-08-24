import 'package:get/get.dart';
import 'package:kampus_gratis/models/penyaluran_kerja/job_models.dart';
import 'package:kampus_gratis/services/providers/job/job_provider.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class JobController extends GetxController with StateMixin<List<JobModels>?> {
  JobController(this._jobProvider);
  final JobProvider _jobProvider;
  getAllJobs(List type) async {
    JSON body = {"type": type};
    try {
      var data = await _jobProvider.getAll(body);
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));

    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllJobs(Get.arguments);
  }
}
