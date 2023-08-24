import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class AdministrasiRepository {
  final ApiService _apiService;
  AdministrasiRepository(this._apiService);
  Future<JSON> getAdministrasi() async {
    var response = await _apiService.get(
        endpoint: '/administration/mine', requiresAuthToken: true);
    return response;
  }

  Future<JSON> putBiodata(JSON body) async {
    var response = await _apiService.put(
        endpoint: '/administration/biodata',
        requiresAuthToken: true,
        body: body);
    return response;
  }

  Future<JSON> putFamilial(JSON body) async {
    var response = await _apiService.put(
        endpoint: '/administration/familial',
        requiresAuthToken: true,
        body: body);

    return response;
  }

  Future<JSON> putDegree(JSON body) async {
    var response = await _apiService.put(
        endpoint: '/administration/degree',
        requiresAuthToken: true,
        body: body);
    return response;
  }

  Future<JSON> putFiles(dynamic body) async {
    var response = await _apiService.put(
        endpoint: '/administration/files', requiresAuthToken: true, body: body);
    return response;
  }
}
