import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kampus_gratis/services/providers/silabus/silabus_view_provider.dart';
import 'package:quickalert/quickalert.dart';

import 'draft_krs_controller.dart';

class UploadKhsController extends GetxController {
  final SilabusViewProvider _silabusViewProvider;
  UploadKhsController(this._silabusViewProvider);

  RxBool isPicked = false.obs;
  XFile? file;
  RxString basename = ''.obs;

  RxBool isEmpty = true.obs;
  RxString fileName = ''.obs;

  Future pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'doc', 'docx', 'png'],
        type: FileType.custom,
        // allowMultiple: true,
      );

      if (result != null) {
        isEmpty.value = false;
        file = XFile(result.files.single.path!);
        fileName.value = file?.name ?? '';
        update();
      } else {
        file = null;
      }
    } catch (e) {
      // print('error : $e');
    }
  }

  deleteFile() {
    isEmpty.value = true;
    file = null;
  }

  RxBool isLoading = false.obs;
  final draftKrs = Get.find<DraftKrsController>();
  postKhs(String subjectId, BuildContext context) async {
    try {
      isLoading.value = true;
      await _silabusViewProvider.postKhs(subjectId, file!);
      isLoading.value = false;
      await draftKrs.getDraftKrsMajor();
      QuickAlert.show(
          title: 'Upload Berhasil',
          text: 'Silahkan periksa laman Pengajuan Berkas',
          context: context,
          type: QuickAlertType.success);
    } catch (e) {
      isLoading.value = false;
      QuickAlert.show(
          title: 'Upload Gagal',
          text: '$e',
          context: context,
          type: QuickAlertType.error);
    }
  }
}
