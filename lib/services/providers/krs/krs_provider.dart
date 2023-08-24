import 'package:kampus_gratis/models/silabus/draft_krs_model.dart';
import 'package:kampus_gratis/services/repository/krs/krs_repository.dart';

class KrsProvider {
  KrsProvider(this._krsRepository);
  final KrsRepository _krsRepository;

  Future<DraftKrsModel?> getDraftKrsMajor() async {
    var dataDraft = await _krsRepository.getDraftKrs();

    return DraftKrs.fromJson(dataDraft).data;
  }
}
