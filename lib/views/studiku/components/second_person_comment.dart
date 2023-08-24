import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/studiku/discussion_detail_controller.dart';
import 'package:kampus_gratis/models/studiku/discussion_detail_model.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:like_button/like_button.dart';

class SecondPersonComment extends StatelessWidget {
  const SecondPersonComment({
    Key? key,
    required this.data,
    required this.index,
    required this.indexed,
    required this.controller,
  }) : super(key: key);

  final DetailDiscussionModel data;
  final int index;
  final int indexed;
  final DiscussionDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // second person comment
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
          horizontalTitleGap: 9,
          leading: CircleAvatar(
            radius: 20.0,
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(20.0),
                child: data.comments![index - 1].replies![indexed].user!
                            .displayPictureLink !=
                        null
                    ? Image.network(
                        '${data.comments![index - 1].replies![indexed].user!.displayPictureLink}',
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
                  text:
                      '${data.comments![index - 1].replies![indexed].user!.fullName} - ',
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
                '${DateFormat.yMd('id_ID').format(data.comments![index - 1].replies![indexed].updatedAt ?? DateTime.now())}, ${DateFormat.jm('id_ID').format(data.comments![index - 1].updatedAt ?? DateTime.now())} WIB',
                style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.comments![index - 1].replies![indexed].content!,
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
                    isLiked: data
                            .comments![index - 1].replies![indexed].studentLike!
                            .contains(Get.arguments[1])
                        ? true
                        : false,
                    onTap: (isLiked) async {
                      controller.putLikeReplyComment(
                          data.comments![index - 1].replies![indexed].id!,
                          data.id!);
                      return !isLiked;
                    },
                    likeBuilder: (bool isLiked) {
                      return SvgPicture.asset(
                        'assets/icons/like.svg',
                        color: isLiked
                            ? const Color(0xff0099cc)
                            : const Color(0xFF64748B),
                      );
                    },
                    likeCount: data.comments![index - 1].replies![indexed]
                            .studentLike!.length +
                        data.comments![index - 1].replies![indexed].teacherLike!
                            .length,
                    countBuilder: (count, isLiked, text) {
                      // var color = isLiked ? const Color(0xFF64748B) : Colors.black;

                      return Text(
                        "$text Suka ",
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
                    "${data.comments![index - 1].replies!.length} Balasan ",
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
                        data.comments![index - 1].replies![indexed].user!
                            .fullName!,
                      );
                      controller.setReplyComment(
                        data.comments![index - 1].replies![indexed].id!,
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
      ],
    );
  }
}
