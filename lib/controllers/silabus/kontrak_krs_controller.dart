import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/draft_krs_controller.dart';
import 'package:kampus_gratis/models/silabus/detail_jurusan.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';
import 'package:kampus_gratis/views/rencana_study/components/custom_dropdown.dart';
import 'package:quickalert/quickalert.dart';

class KontrakKrsController extends GetxController with StateMixin<Result> {
  final SilabusViewProvider _silabusViewProvider;

  KontrakKrsController(this._silabusViewProvider);
  List<Result>? result = [];
  DetailJurusanModel? detailJurusanModel;
  List<CustomDropdownExample>? allItems;
  RxList isExpanded = [].obs;

  void changeExpanded(int indexParam) async {
    if (isExpanded[indexParam] == false) {
      isExpanded[indexParam] = true;
    } else {
      isExpanded[indexParam] = false;
    }
  }

  Future getJurusanData(String majorId) async {
    try {
      await Get.find<DraftKrsController>().getDraftKrsMajor();
      final data = await _silabusViewProvider.getDetailMajor(majorId: majorId);
      detailJurusanModel = data;
      result = data?.result;
      if (result != null) {
        for (int i = 0; i < result!.length; i++) {
          if (result?[i].semester == data?.studentsInformation?.semester) {
            change(
              result?[i],
              status: RxStatus.success(),
            );
          }
        }
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  RxBool isLoading = false.obs;
  final draftKrs = Get.find<DraftKrsController>();
  Future postDraftKrs(String id, BuildContext context) async {
    try {
      isLoading.value = true;
      await _silabusViewProvider.postEnrollSubject(id);

      isLoading.value = false;

      await draftKrs.getDraftKrsMajor();
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          title: 'Berhasil',
          text: 'Matakuliah berhasil diambil!');
    } catch (e) {
      isLoading.value = false;
      String res = e.toString();
      if (res.contains('already enrolled')) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.info,
          title: 'Maaf',
          text: 'Matakuliah ini sudah kamu ambil',
        );
      } else if (res.contains('Exceeded maximum credit')) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.warning,
            title: 'Peringatan',
            text: 'Jumlah SKS melebhi batas');
      }
      // Get.defaultDialog(middleText: e.toString());
    }
  }

  @override
  void onInit() {
    getJurusanData(Get.arguments);
    super.onInit();
  }
}
