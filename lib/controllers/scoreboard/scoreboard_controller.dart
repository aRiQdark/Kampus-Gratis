import 'package:get/get.dart';
import 'package:kampus_gratis/models/scoreboard/scoreboard_model.dart';
import 'package:kampus_gratis/services/providers/scoreboard/scoreboard_provider.dart';

class ScoreController extends GetxController with StateMixin<List<ScoreboardModel>>{
  final ScoreProvider _scoreProvider;
  ScoreController(this._scoreProvider);

  RxBool isLoading = false.obs;

  Future getScore() async {
    try {
      final data = await _scoreProvider.getScore();
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getScore();
    super.onInit();
  }
}