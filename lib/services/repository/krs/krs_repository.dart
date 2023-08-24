import 'package:kampus_gratis/services/networks/api_service.dart';

class KrsRepository {
  final ApiService _apiService;
  KrsRepository(this._apiService);

  Future getDraftKrs() async {
    var response = await _apiService.get(
        endpoint: '/subject/studyplan', requiresAuthToken: true);

    return response;
  }
}
