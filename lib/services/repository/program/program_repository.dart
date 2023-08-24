import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class ProgramRepository {
  final ApiService _apiService;

  ProgramRepository(this._apiService);

  Future<JSON> getProgram() async {
    var response = await _apiService.get(endpoint: '/getProgram');
    return response;
  }
}
