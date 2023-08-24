import 'dart:io';

import 'package:get/get.dart';
import 'package:kampus_gratis/models/administrasi/administrasi_model.dart';
import 'package:kampus_gratis/services/repository/administrasi/administrasi_repository.dart';
import 'package:kampus_gratis/utils/typedef.dart';
import 'package:path/path.dart';

class AdministrasiProvider {
  final AdministrasiRepository _administrasiRepository;

  AdministrasiProvider(this._administrasiRepository);

  Future<AdministrasiModels?> getAdministrasi() async {
    var response = await _administrasiRepository.getAdministrasi();
    return Administrasi.fromJson(response).data;
  }

  Future<AdministrasiModels?> putBiodata(JSON body) async {
    var response = await _administrasiRepository.putBiodata(body);
    return Administrasi.fromJson(response).data;
  }

  Future<AdministrasiModels?> putFamilial(JSON body) async {
    var response = await _administrasiRepository.putFamilial(body);
    return Administrasi.fromJson(response).data;
  }

  Future<AdministrasiModels?> putDegree(JSON body) async {
    var response = await _administrasiRepository.putDegree(body);
    return Administrasi.fromJson(response).data;
  }

  Future<JSON?> putFiles(
      String administrasiId, List<Map<String, File?>> files) async {
    // try {

    var formData = FormData({
      'administration_id': administrasiId,
    });

    for (var value in files) {
      File? paktaIntegritas = value['paktaIntegritas'];
      File? ktp = value['ktp'];
      File? kk = value['kk'];
      File? ijazah = value['ijazah'];
      File? pasFoto = value['pasFoto'];
      File? khs = value['khs'];
      File? sr = value['suratRekomendasi'];

      if (paktaIntegritas != null) {
        formData.files.add(MapEntry(
            'integrity_pact',
            MultipartFile(paktaIntegritas.path,
                contentType: 'application/pdf',
                filename: basename(paktaIntegritas.path))));
      }
      if (ktp != null) {
        formData.files.add(MapEntry(
            'nin_card',
            MultipartFile(ktp.path,
                contentType: 'application/pdf', filename: basename(ktp.path))));
      }
      if (kk != null) {
        formData.files.add(MapEntry(
            'family_card',
            MultipartFile(kk.path,
                contentType: 'application/pdf', filename: basename(kk.path))));
      }
      if (ijazah != null) {
        formData.files.add(MapEntry(
            'certificate',
            MultipartFile(ijazah.path,
                contentType: 'application/pdf',
                filename: basename(ijazah.path))));
      }
      if (pasFoto != null) {
        formData.files.add(MapEntry(
            'photo',
            MultipartFile(pasFoto.path,
                contentType: 'application/pdf',
                filename: basename(pasFoto.path))));
      }
      if (khs != null) {
        formData.files.add(MapEntry(
            'transcript',
            MultipartFile(khs.path,
                contentType: 'application/pdf', filename: basename(khs.path))));
      }
      if (sr != null) {
        formData.files.add(MapEntry(
            'recommendation_letter',
            MultipartFile(sr.path,
                contentType: 'application/pdf', filename: basename(sr.path))));
      }
    }

    return await _administrasiRepository.putFiles(formData);
  }
}
