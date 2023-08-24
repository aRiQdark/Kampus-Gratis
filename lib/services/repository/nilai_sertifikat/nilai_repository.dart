import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';
class NilaiRepository {
  final ApiService _apiService;
  NilaiRepository(this._apiService);
  Future<JSON> getNilai() async {
    var response = await _apiService.get(
        endpoint: '/profile/report', requiresAuthToken: true);
    // print('Respon dari API Assignment: $response');
    return response;
  }
}
