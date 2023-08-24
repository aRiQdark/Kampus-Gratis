import 'package:kampus_gratis/models/iklan/iklan_model.dart';
import 'package:kampus_gratis/services/repository/iklan/iklan_repository.dart';

class IklanProvider {
  final IklanRepository _iklanRepository;

  IklanProvider(this._iklanRepository);

  Future<List<IklanModel>?> getIklan() async {
    var iklan = await _iklanRepository.getIklan();
    return Iklan.fromJson(iklan).data;
  }
}
