import 'package:kampus_gratis/models/nilai_sertifikat/sertifikat_model.dart';
import 'package:kampus_gratis/services/repository/nilai_sertifikat/sertifikat_repository.dart';

class SertifikatProvider {
  final SertifikatRepository _sertifikatRepository;

  SertifikatProvider(this._sertifikatRepository);

  Future<List<SertifikatModel>?> getSertifikat() async {
    var response = await _sertifikatRepository.getSertifikat();
    return Sertifikat.fromJson(response).data;
  }
}
