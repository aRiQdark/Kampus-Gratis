import 'package:kampus_gratis/models/tenggat_penugasan/assignment_model.dart';
import 'package:kampus_gratis/services/repository/tenggat_penugasan/tenggat_penugasan_repository.dart';

class TenggatPenugasanProvider {
  final TenggatPenugasanRepository _tenggatPenugasanRepository;
  TenggatPenugasanProvider(this._tenggatPenugasanRepository);
  Future<AssignmentModel> getAssignmentSubmissions() async {
    var response = await _tenggatPenugasanRepository.getAssignmentSubmissions();
    return Assignment.fromJson(response).data;
  }
}
