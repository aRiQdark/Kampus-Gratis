import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class IklanRepository {
  final ApiService _apiService;

  IklanRepository(this._apiService);

  Future<JSON> getIklan() async {
    var response = await _apiService.get(endpoint: '/preview');
    return response;
  }
}
