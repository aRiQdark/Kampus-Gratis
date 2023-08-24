import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kampus_gratis/models/administrasi/administrasi_model.dart';
import 'package:kampus_gratis/services/providers/administrasi/administrasi_provider.dart';

import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart';

import '../../../themes/themes.dart';

class BerkasController extends GetxController
    with StateMixin<AdministrasiModels?> {
  final AdministrasiProvider _administrasiProvider;
  BerkasController(this._administrasiProvider);
  RxBool isEmpty = true.obs;
  RxString fileName = ''.obs;
  RxString administrasiId = ''.obs;
  RxBool isLoading = false.obs;
  XFile? file;
  XFile? paktaIntegritas;
  XFile? ktp;
  XFile? kk;
  XFile? ijazahTerbaru;
  XFile? pasFoto;
  XFile? khs;
  XFile? sRekom;
  RxString paktaIntegritasFileName = ''.obs;
  RxString ktpFileName = ''.obs;
  RxString kkFileName = ''.obs;
  RxString ijazahFileName = ''.obs;
  RxString fotoFileName = ''.obs;
  RxString khsFileName = ''.obs;
  RxString srFileName = ''.obs;

  Future pickFile(int kategori) async {
    try {
      final result = await FilePicker.platform
          .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);
      if (result != null) {
        isEmpty.value = false;
        file = XFile(result.files.single.path!);
        final fileSize = await file?.length();
        if (fileSize! > 2000000) {
          removeFile();
          return Get.defaultDialog(
              title: "Ukuran File Terlalu Besar",
              middleText: "Ukuran File yang diterima tidak lebih dari 2MB");
        }
      }
      switch (kategori) {
        case 0:
          paktaIntegritas = file;
          paktaIntegritasFileName.value = '';
          break;

        case 1:
          ktp = file;
          ktpFileName.value = '';
          break;

        case 2:
          kk = file;
          kkFileName.value = '';
          break;

        case 3:
          ijazahTerbaru = file;
          ijazahFileName.value = '';
          break;

        case 4:
          pasFoto = file;
          fotoFileName.value = '';
          break;

        case 5:
          khs = file;
          khsFileName.value = '';
          break;

        case 6:
          sRekom = file;
          srFileName.value = '';
          break;

        default:
          file = null;
      }
      update();
    } catch (e) {
      Get.defaultDialog(middleText: e.toString());
    }
  }

  Future removeFile() async {
    try {
      bool? result = await FilePicker.platform.clearTemporaryFiles();
      if (result == true) {
        isEmpty.value = true;
        fileName.value = '';
      }
    } catch (e) {
      // print(e);
    }
  }

  Future deleteFile(int kategori) async {
    switch (kategori) {
      case 0:
        {
          paktaIntegritas = null;
          break;
        }
      case 1:
        {
          ktp = null;
          break;
        }
      case 2:
        {
          kk = null;
          break;
        }
      case 3:
        {
          ijazahTerbaru = null;
          break;
        }
      case 4:
        {
          pasFoto = null;
          break;
        }
      case 5:
        {
          khs = null;
          break;
        }
      case 6:
        {
          sRekom = null;
          break;
        }
    }
    update();
  }

  Future openFile(String? file) async {
    try {
      await OpenFilex.open(file);
    } catch (e) {
      return;
    }
  }

  getAdministrasi() async {
    try {
      AdministrasiModels? data = await _administrasiProvider.getAdministrasi();
      change(data, status: RxStatus.success());
      administrasiId.value = data?.administrationId ?? '';
      data?.files?.integrityPact != null
          ? paktaIntegritasFileName.value = basename(data!.files!.integrityPact)
          : paktaIntegritasFileName.value = '';
      data?.files?.ninCard != null
          ? ktpFileName.value = basename(data!.files!.ninCard)
          : ktpFileName.value = '';
      data?.files?.certificate != null
          ? ijazahFileName.value = basename(data!.files!.certificate)
          : ijazahFileName.value = '';
      data?.files?.familyCard != null
          ? kkFileName.value = basename(data!.files!.familyCard)
          : kkFileName.value = '';
      data?.files?.photo != null
          ? fotoFileName.value = basename(data!.files!.photo)
          : fotoFileName.value = '';
      data?.files?.transcript != null
          ? khsFileName.value = basename(data!.files!.transcript)
          : khsFileName.value = '';
      data?.files?.recommendationLetter != null
          ? srFileName.value = basename(data!.files!.recommendationLetter)
          : srFileName.value = '';
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> putFiles() async {
    List<Map<String, File?>> bodyFiles = [];

    if (paktaIntegritas != null) {
      File paktaIntegritasFile = File(paktaIntegritas!.path);
      bodyFiles.add({'paktaIntegritas': paktaIntegritasFile});
    }
    if (ktp != null) {
      File ktpFile = File(ktp!.path);
      bodyFiles.add({'ktp': ktpFile});
    }
    if (kk != null) {
      File kkFile = File(kk!.path);
      bodyFiles.add({'kk': kkFile});
    }
    if (ijazahTerbaru != null) {
      File ijazahFile = File(ijazahTerbaru!.path);
      bodyFiles.add({'ijazah': ijazahFile});
    }
    if (pasFoto != null) {
      File pasFotoFile = File(pasFoto!.path);
      bodyFiles.add({'pasFoto': pasFotoFile});
    }
    if (khs != null) {
      File khsFile = File(khs!.path);
      bodyFiles.add({'khs': khsFile});
    }
    if (sRekom != null) {
      File sr = File(sRekom!.path);
      bodyFiles.add({'suratRekomendasi': sr});
    }

    try {
      isLoading.value = true;
      Get.showSnackbar(
        GetSnackBar(
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Data Berhasil Disimpan",
                style: Themes.darkTheme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 13),
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              )
            ],
          ),
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 60),
          backgroundColor: const Color(0xFF3AAA35),
          duration: const Duration(seconds: 1),
          borderRadius: 8,
        ),
      );
      await _administrasiProvider.putFiles(administrasiId.value, bodyFiles);

      Get.toNamed('/jenjang-pendidikan');

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: 'Error', middleText: e.toString());
    }
  }

  // sementara
  Future<void> setFreshToken() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GetStorage storage = GetStorage();
    final user = auth.currentUser;

    if (user != null) {
      final token = await user.getIdToken();
      await storage.write('token', token);
    }
  }

  @override
  void onInit() async {
    getAdministrasi();
    super.onInit();
  }
}
