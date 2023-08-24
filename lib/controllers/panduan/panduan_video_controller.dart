import 'package:get/get.dart';
import 'package:kampus_gratis/models/panduan/panduan_video_model.dart';
import 'package:kampus_gratis/services/providers/panduan/panduan_provider.dart';

class PanduanVideoController extends GetxController
    with StateMixin<List<PanduanVideoModel>> {
  PanduanVideoController(this._panduanProvider);

  RxBool isFullScreen = false.obs;

  final PanduanProvider _panduanProvider;

  Future getAllPanduanVideo() async {
    try {
      change(null, status: RxStatus.loading());
      var result = await _panduanProvider.getAllPanduanVideo();

      change(result, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllPanduanVideo();
  }
}
