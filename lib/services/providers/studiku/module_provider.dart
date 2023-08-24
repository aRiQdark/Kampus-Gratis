import 'package:kampus_gratis/services/repository/studiku/module_repository.dart';
import 'package:kampus_gratis/models/studiku/detail_modul_model.dart';

import '../../../models/studiku/module_model.dart';

class ModuleProvider {
  final ModuleRepository _moduleRepository;

  ModuleProvider(this._moduleRepository);

  Future<List<ModuleModel>?> getAllModuleById(String paramIdSession) async {
    var response = await _moduleRepository.getAllModuleById(paramIdSession);

    List<dynamic> getSessionById = response["data"];

    List<ModuleModel> result = [];

    for (var element in getSessionById) {
      result.add(ModuleModel.fromJson(element));
    }

    return result;
  }

  Future<DetailModuleModel?> getDetailModuleById(String paramIdModul) async {
    var response = await _moduleRepository.getDetailModuleById(paramIdModul);

    DetailModuleModel result = DetailModuleModel.fromJson(response["data"]);

    return result;
  }

  Future finishDetailModuleById(Map<String, dynamic> paramBody) async {
    var response = await _moduleRepository.finishDetailModuleById(paramBody);

    return response;
  }
}
