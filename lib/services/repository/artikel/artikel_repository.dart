import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class ArtikelRepository {
  final ApiService _apiService;
  final String articleUrl = '/article';

  ArtikelRepository(this._apiService);

  Future<JSON> getArtikel(int page, int limit, String? search) async {
    Map<String, String?> query = {
      'page': page.toString(),
      'limit': limit.toString(),
      'search': search,
    };
    var response =
        await _apiService.get(endpoint: '$articleUrl/index', query: query);
    return response;
  }
}
