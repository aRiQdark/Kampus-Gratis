import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class ScoreboardRepository {
  final ApiService _apiService;

  ScoreboardRepository(this._apiService);

  Future<JSON> getAllScore() async {
    var response = await _apiService.get(
      endpoint: '/leaderboard',
      requiresAuthToken: true,
    );

    return response;
  }
}
