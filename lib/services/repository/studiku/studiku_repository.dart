import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class StudikuRepository {
  final ApiService _apiService;

  StudikuRepository(this._apiService);

  Future<JSON> getAllEnrolledSubject() async {
    var response = await _apiService.get(
      endpoint: '/subject/enrolledsubjects',
      requiresAuthToken: true,
    );

    return response;
  }
}
