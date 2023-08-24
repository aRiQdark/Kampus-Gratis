import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/studiku/discussion_detail_model.dart';
import 'package:kampus_gratis/services/providers/studiku/discussion_provider.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';

class DiscussionDetailController extends GetxController
    with StateMixin<DetailDiscussionModel> {
  final DiscussionProvider _discussionProvider;
  DiscussionDetailController(this._discussionProvider);

  // comment controller

  final inputNode = FocusNode();
  RxBool isOn = true.obs;
  RxString replyTo = ''.obs;

  RxBool isReply = false.obs;
  RxString idComment = ''.obs;

  setReplyComment(String paramIdComment) async {
    isReply.value = true;
    idComment.value = paramIdComment;
  }

  RxString hintText = 'Ketikkan sesuatu'.obs;

  Future setFocus(var context, String name) async {
    replyTo.value = name;

    FocusScope.of(context).unfocus();
    Future.delayed(const Duration(microseconds: 1), () {
      FocusScope.of(context).requestFocus(inputNode);
    });

    // isOn.value
    //     ? FocusScope.of(context).requestFocus(inputNode)
    //     : FocusScope.of(context).unfocus();

    isOn.value = !isOn.value;
  }

  Future setFocusDf(var context) async {
    replyTo.value = '';
    isReply.value = false;
    FocusScope.of(context).unfocus();
    Future.delayed(const Duration(microseconds: 1), () {
      FocusScope.of(context).requestFocus(inputNode);
    });
  }

  Future removeReply() async {
    replyTo.value = '';
    isReply.value = false;
  }

  // see reply comments

  RxList<RxInt> replyRemainsCommentLength = <RxInt>[].obs;
  RxList<RxBool> isViewReply = <RxBool>[].obs;

  pushReplyComment(int index, int count) async {
    isViewReply[index].value = true;
    return replyRemainsCommentLength[index] - count;
  }

  popReplyComment(int index, int count) async {
    return replyRemainsCommentLength[index] + count;
  }

  // detail df controller

  bool isAddNewComment = false;
  bool isFirst = true;

  getDetailDiscussion(String idDiscussion) async {
    try {
      var result =
          await _discussionProvider.getDetailDiscussionById(idDiscussion);

      change(result, status: RxStatus.success());

      if (result!.comments!.isNotEmpty) {
        for (int i = 0; i < result.comments!.length; i++) {
          if (result.comments![i].replies!.isEmpty) {
            replyRemainsCommentLength.add(0.obs);
          } else {
            replyRemainsCommentLength
                .add(result.comments![i].replies!.length.obs);
          }

          if (isAddNewComment == true) {
            if (i == 0) {
              isViewReply.insert(0, true.obs);
              isAddNewComment = false;
            }
          }

          if (isFirst == true) {
            isViewReply.add(true.obs);
          }

          // isViewReply.assignAll(false.obs);
        }
        isFirst = false;
      }

      // print('date format : ${DateFormat.d(DateTime.now)}');

      return result;
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  // send comment

  final commentController = TextEditingController();

  postCommentDf(String idDiscussion, String content) async {
    try {
      await _discussionProvider.postCommentDf(
        idDiscussion,
        content,
      );

      commentController.text = '';

      isAddNewComment = true;

      getDetailDiscussion(idDiscussion);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  postReplyCommentDf(
      String idComment, String content, String idDiscussion) async {
    try {
      await _discussionProvider.postReplyCommentDf(
        idComment,
        content,
      );

      commentController.text = '';

      removeReply();

      getDetailDiscussion(idDiscussion);
    } catch (e) {
      KGSnackBar.showKGSnackBar(Get.context!, e.toString(),
          backgroundColor: Colors.red);
    }
  }

  // give like

  putLikeDf(String idDiscussion) async {
    try {
      await _discussionProvider.putLikeDf(idDiscussion);
    } catch (e) {
      KGSnackBar.showKGSnackBar(Get.context!, e.toString(),
          backgroundColor: Colors.red);
    }
  }

  putLikeComment(String idComment) async {
    try {
      await _discussionProvider.putLikeComment(idComment);
    } catch (e) {
      KGSnackBar.showKGSnackBar(Get.context!, e.toString(),
          backgroundColor: Colors.red);
    }
  }

  putLikeReplyComment(String idComment, String idDiscussion) async {
    try {
      await _discussionProvider.putLikeReplyComment(idComment);
      getDetailDiscussion(idDiscussion);
    } catch (e) {
      KGSnackBar.showKGSnackBar(Get.context!, e.toString(),
          backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDetailDiscussion(Get.arguments[0]);
  }
}
