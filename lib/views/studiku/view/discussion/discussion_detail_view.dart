import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/discussion_detail_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/studiku/components/content_discussion_detail.dart';
import 'package:kampus_gratis/views/studiku/components/first_person_comment.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class DiscussionDetailView extends GetView<DiscussionDetailController> {
  const DiscussionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KGAppBar(
        backButton: true,
        title: 'Forum Diskusi - P${Get.arguments[2]}',
        withIconKG: true,
      ),
      body: controller.obx(
        (data) => Column(
          children: [
            // first comment

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ContentDiscussionDetail(
                      controller: controller,
                      data: data!,
                    );
                  }

                  if (data!.comments!.isNotEmpty) {
                    return FirstPersonComment(
                      controller: controller,
                      data: data,
                      index: index,
                    );
                  } else {
                    const Center(
                      child: Text('Belum ada komentar'),
                    );
                  }
                  return const SizedBox();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 6);
                },
                itemCount:
                    data!.comments!.isNotEmpty ? data.comments!.length + 1 : 1,
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.replyTo.value != ''
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Membalas ',
                                  style: Themes.lightTheme.textTheme.subtitle2,
                                ),
                                Expanded(
                                  child: Text(
                                    '${controller.replyTo.value} ',
                                    style: Themes
                                        .lightTheme.textTheme.subtitle2!
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.removeReply();
                                  },
                                  child: Text(
                                    'Batal',
                                    style: Themes
                                        .lightTheme.textTheme.subtitle2!
                                        .copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    TextFormField(
                      controller: controller.commentController,
                      focusNode: controller.inputNode,
                      textInputAction: TextInputAction.done,
                      minLines: 1,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: controller.hintText.value,
                        contentPadding: const EdgeInsets.only(left: 14),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFD9D9D9),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: Row(
                                children: [
                                  const SizedBox(width: 14),
                                  SvgPicture.asset(
                                      'assets/icons/image_add.svg'),
                                  const SizedBox(width: 14),
                                  SvgPicture.asset('assets/icons/clip.svg'),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.2,
                            height: 48,
                            color: const Color(0xFF106FA4),
                            child: Center(
                              child: Text(
                                'Kirim',
                                style:
                                    Themes.darkTheme.textTheme.button!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
