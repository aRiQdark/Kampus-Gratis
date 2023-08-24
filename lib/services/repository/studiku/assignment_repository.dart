import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class AssignmentRepository {
  final ApiService _apiService;

  AssignmentRepository(this._apiService);

  Future<JSON> getAssignmentById(String paramIdSession) async {
    var response = await _apiService.get(
        endpoint: '/assignment/session/$paramIdSession',
        requiresAuthToken: true);
    // print('Respon dari API Assignment: $response');
    return response;
  }

  Future<JSON> submitStudentWork(String paramIdSession, dynamic file) async {
    var response = await _apiService.post(
      endpoint: '/assignment/submit/$paramIdSession',
      requiresAuthToken: true,
      body: file,
    );
    return response;
  }

  Future<JSON> cancelStudentWork(String paramIdSession) async {
    var response = await _apiService.delete(
        endpoint: '/assignment/delete/$paramIdSession',
        requiresAuthToken: true);
    return response;
  }
}
