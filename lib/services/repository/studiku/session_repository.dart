import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class SessionRepository {
  final ApiService _apiService;

  SessionRepository(this._apiService);

  Future<JSON> getAllSessionById(String paramIdSession) async {
    var response = await _apiService.get(
      endpoint: '/session/getfromsub/$paramIdSession',
      requiresAuthToken: true,
    );

    return response;
  }
}
