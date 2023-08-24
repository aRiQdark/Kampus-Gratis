import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class JobRepository {
  final ApiService _apiService;
  JobRepository(this._apiService);

  Future<JSON> allJobs(JSON body) async {
    var response = await _apiService.post(
      endpoint: '/jobs/all',
      // requiresAuthToken: true,
      body: body,
    );
    return response;
  }

  Future<JSON> jobDetail(String id) async {
    var response = await _apiService.get(endpoint: '/jobs/job/$id');
    return response;
  }
}
