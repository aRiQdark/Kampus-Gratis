import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/panduan/panduan_kamus_model.dart';
import 'package:kampus_gratis/services/providers/panduan/panduan_provider.dart';

class PanduanKamusKGController extends GetxController
    with StateMixin<List<PanduanKamusModel>> {
  PanduanKamusKGController(this._panduanProvider);

  final searchController = TextEditingController();

  final PanduanProvider _panduanProvider;

  Future getAllPanduanKamus(String type, String? search) async {
    try {
      change(null, status: RxStatus.loading());
      var result = await _panduanProvider.getAllPanduanKamus(type, search);

      // print('result = $result');

      change(result, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllPanduanKamus(Get.arguments[0], Get.arguments[1]);
  }
}
