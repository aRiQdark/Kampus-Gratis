import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  // Future login(JSON body) async {
  //   var response = await _apiService.post(
  //     endpoint: '/auth/login',
  //     body: body,
  //   );
  //   return response;
  // }

  Future register(JSON body) async {
    final response = await _apiService.post(
      endpoint: '/auth/register',
      body: body,
    );
    return response;
  }

  Future<JSON> loginGoogle() async {
    final response = await _apiService.post(
        endpoint: '/auth/google-validate', requiresAuthToken: true);

    return response;
  }
}
