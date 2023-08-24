import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/studiku/discussion_detail_controller.dart';
import 'package:kampus_gratis/models/studiku/discussion_detail_model.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/studiku/components/second_person_comment.dart';
import 'package:like_button/like_button.dart';

class FirstPersonComment extends StatelessWidget {
  const FirstPersonComment({
    Key? key,
    required this.controller,
    required this.data,
    required this.index,
  }) : super(key: key);

  final DiscussionDetailController controller;
  final DetailDiscussionModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
          horizontalTitleGap: 9,
          leading: CircleAvatar(
            radius: 20.0,
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(20.0),
                child:
                    data.comments![index - 1].user!.displayPictureLink != null
                        ? Image.network(
                            '${data.comments![index - 1].user!.displayPictureLink}',
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/person2.png',
                            fit: BoxFit.cover,
                          ),
              ),
            ),
          ),
          title: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: '${data.comments![index - 1].user!.fullName} - ',
                  style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF64748B),
                  ),
                ),
                TextSpan(
                  // text: '${data.comments![index - 1].user!.id}\n',
                  text: 'Student 0101010103',
                  style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF106FA4),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF3F3F3),
          ),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${DateFormat.yMd('id_ID').format(data.comments![index - 1].updatedAt ?? DateTime.now())}, ${DateFormat.jm('id_ID').format(data.comments![index - 1].updatedAt ?? DateTime.now())} WIB',
                style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.comments![index - 1].content!,
                style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  // like comment
                  LikeButton(
                    size: 20,
                    countPostion: CountPostion.left,
                    circleColor: const CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    isLiked: data.comments![index - 1].studentLike!
                            .contains(Get.arguments[1])
                        ? true
                        : false,
                    onTap: (isLiked) async {
                      controller.putLikeComment(data.comments![index - 1].id!);
                      return !isLiked;
                    },
                    likeBuilder: (bool isLiked) {
                      // return Icon(
                      //   Icons.thumb_up_alt_outlined,
                      //   color: isLiked ? const Color(0xff0099cc) : Colors.black,
                      //   size: 20,
                      // );
                      return SvgPicture.asset(
                        'assets/icons/like.svg',
                        color: isLiked
                            ? const Color(0xff0099cc)
                            : const Color(0xFF64748B),
                      );
                    },
                    likeCount: data.comments![index - 1].studentLike!.length +
                        data.comments![index - 1].teacherLike!.length,
                    countBuilder: (count, isLiked, text) {
                      // var color = isLiked ? const Color(0xFF64748B) : Colors.black;

                      return Text(
                        "$text Suka    ",
                        style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF64748B),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  // check reply
                  Text(
                    "${data.comments![index - 1].replies!.length} Balasan   ",
                    style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.setFocus(
                        context,
                        data.comments![index - 1].user!.fullName!,
                      );
                      controller.setReplyComment(
                        data.comments![index - 1].id!,
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/comment.svg',
                      height: 16,
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // reply comment
        Obx(() => controller.isViewReply[index - 1].isTrue
            ? data.comments![index - 1].replies!.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.only(left: 25, top: 6),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, indexed) {
                      return SecondPersonComment(
                        data: data,
                        index: index,
                        indexed: indexed,
                        controller: controller,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 6);
                    },
                    itemCount: data.comments![index - 1].replies!.length -
                        controller.replyRemainsCommentLength[index - 1].value,
                  )
                : const SizedBox()
            : const SizedBox()),

        data.comments![index - 1].replies!.isNotEmpty
            ? Obx(
                () => controller.replyRemainsCommentLength[index - 1].value == 0
                    ? GestureDetector(
                        onTap: () {
                          controller.popReplyComment(index - 1,
                              data.comments![index - 1].replies!.length);
                        },
                        child: Row(
                          children: [
                            Text(
                              'Sembunyikan balasan',
                              style: Themes.lightTheme.textTheme.headline5!
                                  .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF106FA4),
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_up,
                              color: Color(0xFF106FA4),
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.pushReplyComment(index - 1, 1);
                        },
                        child: Obx(
                          () => Row(
                            children: [
                              Text(
                                'Lihat ${controller.replyRemainsCommentLength[index - 1].value} balasan lainnya',
                                style: Themes.lightTheme.textTheme.headline5!
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF106FA4),
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFF106FA4),
                              ),
                            ],
                          ),
                        ),
                      ),
              )
            : const SizedBox(),
      ],
    );
  }
}
