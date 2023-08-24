import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/silabus/draft_krs_model.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';

class DraftKrsController extends GetxController with StateMixin<DraftKrsModel> {
  final SilabusViewProvider _silabusViewProvider;
  DraftKrsController(this._silabusViewProvider);
  List<Subject> draftSubject = [];
  List<Subject> pendingSubject = [];
  List<Subject> ongoingSubject = [];
  int? credit;
  RxBool isLoading = false.obs;
  Future getDraftKrsMajor() async {
    try {
      isLoading.value = true;
      var result = await _silabusViewProvider.getDraftKrsMajor();
      change(result, status: RxStatus.success());
      draftSubject = state!.subjectsEnrolled!.draft!.subjects!;
      pendingSubject = state!.subjectsEnrolled!.pending!.subjects!;
      ongoingSubject = state!.subjectsEnrolled!.ongoing!.subjects!;
      credit = state!.subjectsEnrolled!.totalCredit;
      isLoading.value = false;
      return result;
    } catch (e) {
      isLoading.value = false;
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future deleteMatkul(String subjectId) async {
    Get.back();
    isLoading.value = true;
    await _silabusViewProvider.deleteMatkul(subjectId);
    await getDraftKrsMajor();
    isLoading.value = false;
    Get.snackbar('Berhasil', 'Mata Kuliah ini berhasil dihapus',
        backgroundColor: Colors.green.shade400);
  }

  Future sendDraft() async {
    await _silabusViewProvider.sendDraft();
    await getDraftKrsMajor();
  }

  @override
  void onInit() async {
    await getDraftKrsMajor();
    super.onInit();
  }
}
