import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class ModuleRepository {
  final ApiService _apiService;

  ModuleRepository(this._apiService);

  Future<JSON> getAllModuleById(String paramIdSession) async {
    var response = await _apiService.get(
      endpoint: '/module/session/$paramIdSession',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> getDetailModuleById(String paramIdModul) async {
    var response = await _apiService.get(
      endpoint: '/module/$paramIdModul',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> finishDetailModuleById(Map<String, dynamic> paramBody) async {
    var response = await _apiService.post(
      endpoint: '/module/finish',
      requiresAuthToken: true,
      body: paramBody,
    );

    return response;
  }

  Future<JSON> enrolledModul(String paramIdModul) async {
    var response = await _apiService.post(
      endpoint: '/module/enroll/$paramIdModul',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> enrolleSession(String paramIdSession) async {
    var response = await _apiService.post(
      endpoint: '/session/enroll/$paramIdSession',
      requiresAuthToken: true,
    );

    return response;
  }
}
