import 'package:kampus_gratis/models/Kalender/Kalender_model.dart';

import 'package:kampus_gratis/services/repository/kalender/kalender_repository.dart';

class KalenderProvider {
  final KalenderRepository _kalenderRepository;

  KalenderProvider(this._kalenderRepository);

  Future<List<KalenderModel>> getkalender() async {
    var response = await _kalenderRepository.getkalender();

    final responseResult = ResponseResultKalender.fromJson(response);

    return responseResult.data;
  }
}
