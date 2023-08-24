import 'package:kampus_gratis/models/program/program_model.dart';
import 'package:kampus_gratis/services/repository/program/program_repository.dart';

class ProgramProvider {
  final ProgramRepository _programRepository;

  ProgramProvider(this._programRepository);

  Future<List<ProgramModel>?> getProgram() async {
    var program = await _programRepository.getProgram();
    return Program.fromJson(program).data;
  }
}
