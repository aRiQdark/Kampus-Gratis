import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/silabus/detail_jurusan.dart';

import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';
import 'package:quickalert/quickalert.dart';

class DetailJurusanController extends GetxController
    with StateMixin<DetailJurusanModel?> {
  final SilabusViewProvider _silabusViewProvider;

  DetailJurusanController(this._silabusViewProvider);

  String? majorName;
  List<Result>? result = [];
  RxBool isLoading = false.obs;
  RxBool isWaiting = false.obs;

  RxList isExpanded = [].obs;

  void changeExpanded(int indexParam) async {
    if (isExpanded[indexParam] == false) {
      isExpanded[indexParam] = true;
    } else {
      isExpanded[indexParam] = false;
    }
  }

  getJurusanData(String majorId) async {
    try {
      isLoading.value = true;
      final data = await _silabusViewProvider.getDetailMajor(majorId: majorId);
      change(data, status: RxStatus.success());
      if (data!.studentsInformation!.majors!.isNotEmpty) {
        majorName = data.studentsInformation!.majors![0]['name'];
      } else {
        majorName = data.major!.name;
      }
      result = data.result;
      if (result != null) {
        for (int i = 0; i < result!.length; i++) {
          isExpanded.insert(i, false);
        }
      }
      isLoading.value = false;
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  postMajor(String majorId, BuildContext context) async {
    try {
      isWaiting.value = true;
      await _silabusViewProvider.enrollMajor(majorId);
      isWaiting.value = false;
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          onConfirmBtnTap: () {
            Get.back();
            Get.toNamed('/list-kelas', arguments: majorId);
          },
          title: 'Berhasil',
          text: 'Berhasil Enroll Jurusan!');
    } catch (e) {
      isWaiting.value = false;
      String res = e.toString();
      if (res.contains('Student is already enrolled to a major')) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.warning,
            title: 'Maksimal 1 Jurusan',
            text: 'Mahasiswa sudah terdaftar dalam jurusan $majorName');
      } else if (res.contains('Student is already enrolled in this major')) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.info,
            onConfirmBtnTap: () {
              Get.back();
              Get.toNamed('/list-kelas', arguments: majorId);
            },
            title: 'Note',
            text: 'Jurusan Ini Sudah Pernah Anda Enroll!');
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Error',
            text: 'Gagal Enroll Jurusan : $e');
      }
    }
  }

  @override
  void onInit() async {
    await getJurusanData(Get.arguments[0]);
    // testPrint();
    super.onInit();
  }
}
