import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kampus_gratis/models/silabus/detail_jurusan.dart';
import 'package:kampus_gratis/models/silabus/draft_krs_model.dart';
import 'package:kampus_gratis/models/silabus/majors_model.dart';
import 'package:kampus_gratis/services/repository/silabus/silabus_view_repository.dart';
import 'package:kampus_gratis/utils/typedef.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';
import 'package:path/path.dart';

class SilabusViewProvider {
  final SilabusViewRepository _silabusViewRepository;

  SilabusViewProvider(this._silabusViewRepository);

  Future<List<Majors>> getData(String facultyId) async {
    var modul = await _silabusViewRepository.getAllMajor(facultyId);
    print('MODUL RESULT $modul');
    return modul;
  }

  Future<DetailJurusanModel?> getDetailMajor({String? majorId}) async {
    var dataJurusan = await _silabusViewRepository.getDetailMajor(majorId);
    return DetailJurusan.fromJson(dataJurusan).data;
  }

  Future getDetailSubject() async {
    try {
      var dataSubject = await _silabusViewRepository.getDetailSubject();
      return dataSubject;
    } catch (e) {
      KGSnackBar.showKGSnackBar(Get.context!, e.toString(),
          backgroundColor: Colors.red);
    }
  }

  Future<DraftKrsModel?> getDraftKrsMajor() async {
    var dataDraft = await _silabusViewRepository.getDraftKrs();
    return DraftKrs.fromJson(dataDraft).data;
  }

  postEnrollSubject(String? majorId) async {
    return await _silabusViewRepository.postEnrollSubject(majorId);
  }

  deleteMatkul(String? subjectId) async {
    return await _silabusViewRepository.deleteMatkul(subjectId);
  }

  Future enrollMajor(String? majorId) async {
    return await _silabusViewRepository.enrollMajor(majorId);
  }

  Future sendDraft() async {
    return await _silabusViewRepository.sendDraft();
  }

  // Future postKhs(String? subjectId, Map<String, File?> file) async {
  //   var formData = FormData({'proof': file});

  //   File? fileKhs = file['fileKhs'];

  //   if (fileKhs != null) {
  //     formData.files.add(MapEntry('proof',
  //         MultipartFile(fileKhs.path, filename: basename(fileKhs.path))));
  //   }

  //   return await _silabusViewRepository.postKhs(subjectId, formData);
  // }

  Future<JSON> postKhs(String subjectId, XFile file) async {
    String ext = extension(file.path);
    String? contentType;

    switch (ext) {
      case '.pdf':
        contentType = 'application/pdf';
        break;
      case '.msword':
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
      "proof": MultipartFile(file.path,
          filename: basename(file.path), contentType: contentType),
    });
    var response = await _silabusViewRepository.postKhs(
      subjectId,
      data,
    );
    return response;
  }

  Future getAllFaculty() async {
    var result = await _silabusViewRepository.getAllFaculty();
    return result;
  }
}
