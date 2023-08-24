import 'package:kampus_gratis/models/nilai_sertifikat/nilai_model.dart';
import 'package:kampus_gratis/services/repository/nilai_sertifikat/nilai_repository.dart';

// ignore: camel_case_types
class nilaiProvider {
  final NilaiRepository _nilaiRepository;

  nilaiProvider(this._nilaiRepository);

  Future<NilaiModel> getNilai() async {
    var nilai = await _nilaiRepository.getNilai();
    return Nilai.fromJson(nilai).data;
  }
}
