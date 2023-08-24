import 'package:kampus_gratis/models/artikel/artikel_model.dart';
import 'package:kampus_gratis/services/repository/artikel/artikel_repository.dart';

class ArtikelProvider {
  final ArtikelRepository _artikelRepository;

  ArtikelProvider(this._artikelRepository);

  Future<ArtikelModel?> getArtikel(int page, int limit, String? search) async {
    var artikel = await _artikelRepository.getArtikel(page, limit, search);
    return Artikel.fromJson(artikel).data;
  }
}
