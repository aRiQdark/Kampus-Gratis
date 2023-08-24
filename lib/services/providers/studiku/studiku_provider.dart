import 'package:kampus_gratis/models/studiku/enrolled_subject_model.dart';
import 'package:kampus_gratis/services/repository/studiku/studiku_repository.dart';

class StudikuProvider {
  final StudikuRepository _studikuRepository;

  StudikuProvider(this._studikuRepository);

  Future<List<EnrolledSubjectModel>?> getAllEnrolledSubject() async {
    var response = await _studikuRepository.getAllEnrolledSubject();

    List<dynamic> getEnrolledSubject = response["data"]["result"];
    List<EnrolledSubjectModel> result = [];

    for (var element in getEnrolledSubject) {
      result.add(EnrolledSubjectModel.fromJson(element));
    }

    return result;
  }
}
