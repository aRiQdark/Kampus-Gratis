import 'package:get/get.dart';
import 'package:kampus_gratis/models/penyaluran_kerja/job_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/providers/job/job_provider.dart';

class DetailJobController extends GetxController
    with StateMixin<DetailJobModel?> {
  final JobProvider _jobProvider;
  DetailJobController(this._jobProvider);
  getDetailJob(String id) async {
    try {
      var data = await _jobProvider.getJobDetail(id);
      change(data, status: RxStatus.success());
    } catch (e) {}
  }
  Future<void> applyUrl(Uri url)async{
    if(!await launchUrl(url)){
      throw 'Could not launch $url';
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetailJob(Get.arguments);
  }
}
