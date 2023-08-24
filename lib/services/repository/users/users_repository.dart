import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class UsersRepository {
  final ApiService _apiService;

  UsersRepository(this._apiService);

  Future<JSON> getUsers() async {
    var response = await _apiService.get(
        endpoint: '/user-details', requiresAuthToken: true);
    return response;
  }
}
