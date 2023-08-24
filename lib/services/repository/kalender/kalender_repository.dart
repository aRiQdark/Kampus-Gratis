import '../../../utils/typedef.dart';
import '../../networks/api_service.dart';

class KalenderRepository {
  final ApiService _apiService;

  KalenderRepository(this._apiService);

  Future<JSON> getkalender() async {
    var response = await _apiService.get(
        endpoint: '/calendar/mobile/all', requiresAuthToken: true);
    // print('Respon dari API Assignment: $response');
    return response;
  }
}
