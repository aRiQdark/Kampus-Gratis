import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kampus_gratis/models/discussion_global/discussion_global_model.dart';
import 'package:kampus_gratis/services/providers/discussion_global/discussion_global_provider.dart';
import 'package:kampus_gratis/services/providers/studiku/discussion_provider.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';

class DiscussionGlobalController extends GetxController
    with StateMixin<List<DiscussionGlobalModel>> {
  DiscussionGlobalController(
      this._discussionGlobalProvider, this._discussionProvider);

  final DiscussionGlobalProvider _discussionGlobalProvider;
  final DiscussionProvider _discussionProvider;

  // checkStudentId

  final localStorage = GetStorage();

  // change expanded

  RxList isExpanded = [].obs;

  void changeExpanded(int indexParam) async {
    if (isExpanded[indexParam] == false) {
      isExpanded[indexParam] = true;
    } else {
      isExpanded[indexParam] = false;
    }
  }

  // give like df

  putLikeDf(String idDiscussion) async {
    try {
      await _discussionProvider.putLikeDf(idDiscussion);
    } catch (e) {
      KGSnackBar.showKGSnackBar(Get.context!, e.toString(),
          backgroundColor: Colors.red);
    }
  }

  // DF Global

  // getAllDiscussionGlobal() async {
  //   try {
  //     var result = await _discussionGlobalProvider.getAllDiscussionGlobal();

  //     print('result $result');

  //     if (result != null) {
  //       for (int i = 0; i <= result.length; i++) {
  //         isExpanded.insert(i, false);
  //       }
  //     }

  //     change(result, status: RxStatus.success());

  //     return result;
  //   } catch (e) {
  //     change(null, status: RxStatus.error(e.toString()));
  //      print('Erorr DFG $e');
  //   }
  // }

  getAllDiscussionGlobal() async {
    try {
      change(null, status: RxStatus.loading());
      var result = await _discussionGlobalProvider.getAllDiscussionGlobal();

      if (result != null) {
        for (int i = 0; i <= result.length; i++) {
          isExpanded.insert(i, false);
        }
      }

      change(result, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  // create df

  final quillController = QuillController.basic();
  final FocusNode focusNode = FocusNode();
  final titleController = TextEditingController();

  Future postMakeDf(String title, String content) async {
    try {
      print('init contr');
      await _discussionGlobalProvider.postMakeDf(title, content);

      print('title : $title');
      print('content : $content');

      // Get.snackbar(
      //   'Success',
      //   'Berhasil mengunggah diskusi',
      //   icon: const Icon(Icons.send),
      //   backgroundColor: const Color(0xFF3AAA35),
      //   snackPosition: SnackPosition.BOTTOM,
      //   colorText: const Color(0xFFFAFAFA),
      // );

      // Get.back();

      // getAllDiscussionGlobal();
    } catch (e) {
      print('Error : $e');
      Get.snackbar(
        'Failed',
        'Gagal mengunggah diskusi',
        icon: const Icon(Icons.send),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: const Color(0xFFFAFAFA),
      );
    }
  }

  @override
  void onInit() {
    getAllDiscussionGlobal();
    super.onInit();
  }
}
