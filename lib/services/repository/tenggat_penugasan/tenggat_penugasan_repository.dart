import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class TenggatPenugasanRepository {
  final ApiService _apiService;
  
  TenggatPenugasanRepository(this._apiService);

  Future<JSON> getAssignmentSubmissions() async {
    var response = await _apiService.get(
      endpoint: '/assignment/submissiondata',
      requiresAuthToken: true,
    );
    return response;
  }
}
