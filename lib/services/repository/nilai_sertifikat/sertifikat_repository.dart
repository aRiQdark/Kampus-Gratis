import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class SertifikatRepository {
  final ApiService _apiService;

  SertifikatRepository(this._apiService);

  Future<JSON> getSertifikat() async {
    var response = await _apiService.get(
        endpoint: '/certificate/',
        requiresAuthToken: true);
    // print('Respon dari API Assignment: $response');
    return response;
  }

  Future<JSON> getSertifikatById(String sertifikatId) async {
    var response = await _apiService.get(
        endpoint: '/certificate/$sertifikatId',
        requiresAuthToken: true);
    // print('Respon dari API Assignment: $response');
    return response;
  }

}

