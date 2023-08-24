import 'package:kampus_gratis/services/networks/api_service.dart';

class PanduanRepository {
  final ApiService _apiService;

  PanduanRepository(this._apiService);

  Future getAllPanduanVideo() async {
    var response = await _apiService.get(
      endpoint: '/guide/getbytype?type=video',
    );

    return response;
  }

  Future getAllPanduanBuku() async {
    var response = await _apiService.get(
      endpoint: '/guide/getbytype?type=book',
    );

    return response;
  }

  Future getAllPanduanKamus(String type, String? search) async {
    var response = await _apiService.get(
      endpoint: '/guide/glossary?type=$type&search=$search',
    );

    return response;
  }

  // Future getAll
}
