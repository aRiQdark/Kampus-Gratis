import 'package:get/get.dart';
import 'package:kampus_gratis/models/Acara%20kampus/Acara_model.dart';
import 'package:kampus_gratis/services/providers/Acara Kampus/Acara_provider.dart';

class AcaraController extends GetxController with StateMixin<List<Result>?> {
  AcaraController(
    this._acaraProvider,
  );

  final AcaraProvider _acaraProvider;
  // List<DataAcara>? result;

  RxBool isLoading = false.obs;
  getAcaraData() async {
    try {
      change(null, status: RxStatus.loading());
      final banner = await _acaraProvider.getDataAcara();
      change(banner, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
