import 'package:get/get.dart';
import 'package:kampus_gratis/models/program/program_model.dart';
import 'package:kampus_gratis/services/providers/program/program_provider.dart';

class ProgramController extends GetxController
    with StateMixin<List<ProgramModel>> {
  final ProgramProvider _programProvider;
  ProgramController(this._programProvider);
  void getProgram() {
    _programProvider.getProgram().then((value) {
      List<ProgramModel>? data = value;
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onInit() {
    getProgram();
    super.onInit();
  }
}
