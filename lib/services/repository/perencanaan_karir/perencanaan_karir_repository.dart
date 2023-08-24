import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class PerencanaanKarirRepository {
  final ApiService _apiService;
  PerencanaanKarirRepository(this._apiService);
  Future<JSON> getCareer() async {
    var response = await _apiService.get(endpoint: '/career/get');
    return response;
  }
}
