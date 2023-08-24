import 'package:kampus_gratis/models/perencanaan_karir/perencanaan_karir_model.dart';
import 'package:kampus_gratis/services/repository/perencanaan_karir/perencanaan_karir_repository.dart';

class PerencanaanKarirProvider {
  final PerencanaanKarirRepository _perencanaanKarirRepository;
  PerencanaanKarirProvider(this._perencanaanKarirRepository);

  Future<PerencanaanKarirModel?> getCareer() async {
    var response = await _perencanaanKarirRepository.getCareer();
    return PerencanaanKarir.fromJson(response).data;
  }
}
