import 'package:kampus_gratis/models/silabus/detail_subject.dart';
import 'package:kampus_gratis/models/silabus/fakultas_model.dart';
import 'package:kampus_gratis/models/silabus/majors_model.dart';
import 'package:kampus_gratis/services/networks/api_service.dart';

class SilabusViewRepository {
  final ApiService _apiService;

  SilabusViewRepository(this._apiService);
  final syllabusUrl =
      '?degree=S1&major_id=ec312da6-9e15-4fe5-931d-0970a137d2ed';

  Future<List<Majors>> getAllMajor(String facultyId) async {
    var response = await _apiService.get(
      endpoint: '/faculty/majors?faculty_id=$facultyId',
      requiresAuthToken: true,
    );

    MajorsModel responseResult = MajorsModel.fromJson(response);
    var responseResult2 = responseResult.data;

    List<Majors> result = responseResult2.majors;

    return result;
  }

  Future<List<Datum>> getAllFaculty() async {
    var respon = await _apiService.get(
      endpoint: '/faculty',
      requiresAuthToken: true,
    );
    FakultasModel facultyModel = FakultasModel.fromJson(respon);
    List<Datum> result = facultyModel.data;
    return result;
  }

  Future getSyllabus(String majorId) async {
    var response = await _apiService.get(
      endpoint: '/syllabus/curriculum/$syllabusUrl',
      requiresAuthToken: true,
    );
    return response;
  }

  Future getDetailSubject() async {
    var response = await _apiService.get(
        endpoint: '/syllabus/subject/e24429f0-3fd1-11ed-b878-0242ac120002',
        requiresAuthToken: true);

    DetailSubject detailSubject = DetailSubject.fromJson(response);

    DataSubject detailResult = detailSubject.data;

    return detailResult;
  }

  Future getDetailMajor(String? majorId) async {
    var res = await _apiService.get(
      endpoint: '/syllabus/curriculum?degree=S1&major_id=$majorId',
      requiresAuthToken: true,
    );

    return res;
  }

  Future getDraftKrs() async {
    var respon = await _apiService.get(
        endpoint: '/subject/studyplan', requiresAuthToken: true);

    return respon;
  }

  Future postEnrollSubject(String? majorId) async {
    var response = await _apiService.post(
      endpoint: '/subject/enroll/$majorId',
      requiresAuthToken: true,
    );

    return response;
  }

  Future deleteMatkul(String? subjectId) async {
    var res = await _apiService.delete(
        endpoint: '/subject/deletedraft/$subjectId', requiresAuthToken: true);
    return res;
  }

  Future enrollMajor(String? majorId) async {
    var response = await _apiService.post(
        endpoint: '/major/take/$majorId', requiresAuthToken: true);
    return response;
  }

  Future postKhs(String? subjectId, dynamic proof) async {
    var response = await _apiService.post(
        endpoint: '/subject/uploadkhs/$subjectId',
        body: proof,
        requiresAuthToken: true);
    return response;
  }

  Future sendDraft() async {
    var response = await _apiService.put(
        endpoint: '/subject/senddraft', requiresAuthToken: true);
    return response;
  }
}
    // print('response : $response');
    // print('responseResult : $responseResult');
    // print('responseResult2 : $responseResult2');
    // print('result : $result');
