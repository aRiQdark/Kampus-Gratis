import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kampus_gratis/models/studiku/assignment_detail_model.dart';
import 'package:kampus_gratis/services/repository/studiku/assignment_repository.dart';
import 'package:kampus_gratis/utils/typedef.dart';
import 'package:path/path.dart';

class AssignmentProvider {
  final AssignmentRepository _assignmentRepository;

  AssignmentProvider(this._assignmentRepository);

  Future<AssignmentDetailModel?> getAssignmentById(String paramIdSession) async {
    var response =
        await _assignmentRepository.getAssignmentById(paramIdSession);
    return AssignmentDetail.fromJson(response).data;
  }

  Future<JSON> submitStudentWork(String paramIdSession, XFile file) async {
    String ext = extension(file.path);
    String? contentType;
    switch (ext) {
      case '.pdf':
        contentType = 'application/pdf';
        break;
      case '.doc':
        contentType = 'application/msword';
        break;
      case '.docx':
        contentType = 'application/msword';
        break;
      case '.png':
        contentType = 'image/png';
        break;
      case '.jpg':
        contentType = 'image/jpg';
        break;
      case '.jpeg':
        contentType = 'image/png';
        break;
      default:
        contentType = '';
    }
    dynamic data = FormData({
      "file_assignment": MultipartFile(file.path,
          filename: basename(file.path), contentType: contentType),
    });
    var response = await _assignmentRepository.submitStudentWork(
      paramIdSession,
      data,
    );
    return response;
  }

  Future<JSON> cancelStudentWork(String paramIdSession) async {
    var response =
        await _assignmentRepository.cancelStudentWork(paramIdSession);
    return response;
  }
}
