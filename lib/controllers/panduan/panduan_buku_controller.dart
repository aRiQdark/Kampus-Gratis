import 'package:get/get.dart';
import 'package:kampus_gratis/models/panduan/panduan_buku_model.dart';
import 'package:kampus_gratis/services/providers/panduan/panduan_provider.dart';

class PanduanBukuController extends GetxController
    with StateMixin<List<PanduanBukuModel>> {
  PanduanBukuController(this._panduanProvider);

  final PanduanProvider _panduanProvider;

  Future getAllPanduanBuku() async {
    try {
      change(null, status: RxStatus.loading());
      var result = await _panduanProvider.getAllPanduanBuku();

      change(result, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllPanduanBuku();
  }
}
