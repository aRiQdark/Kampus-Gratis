import 'package:get/get.dart';
import 'package:kampus_gratis/models/perencanaan_karir/perencanaan_karir_model.dart';
import 'package:kampus_gratis/services/providers/perencanaan_karir/perencanaan_karir_provider.dart';

class PerencanaanKarirController extends GetxController
    with StateMixin<PerencanaanKarirModel> {
  PerencanaanKarirController(this._perencanaanKarirProvider);
  
  final PerencanaanKarirProvider _perencanaanKarirProvider;

  getCareer() async {
    try {
      var response = await _perencanaanKarirProvider.getCareer();
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getCareer();
    super.onInit();
  }
}
