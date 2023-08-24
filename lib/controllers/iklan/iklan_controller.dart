import 'package:get/get.dart';
import 'package:kampus_gratis/models/iklan/iklan_model.dart';
import 'package:kampus_gratis/services/providers/iklan/iklan_provider.dart';

class IklanController extends GetxController
    with StateMixin<List<IklanModel>?> {
  final IklanProvider _iklanProvider;

  IklanController(this._iklanProvider);

  getIklan() async {
    try {
      List<IklanModel>? iklan = await _iklanProvider.getIklan();
      change(iklan, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  @override
  void onInit() {
    getIklan();
    super.onInit();
  }
}
