import 'package:kampus_gratis/models/scoreboard/scoreboard_model.dart';
import 'package:kampus_gratis/services/repository/scoreboard/scoreboard_repository.dart';

class ScoreProvider {
  final ScoreboardRepository _scoreRepository;

  ScoreProvider(this._scoreRepository);

  Future<List<ScoreboardModel>> getScore() async {
    var response = await _scoreRepository.getAllScore();

    final responseResult = ResponseResultScoreboard.fromJson(response);

    return responseResult.data;
  }
}