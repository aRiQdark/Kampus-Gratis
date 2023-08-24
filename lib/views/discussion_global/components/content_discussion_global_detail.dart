import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/studiku/discussion_detail_controller.dart';
import 'package:kampus_gratis/models/studiku/discussion_detail_model.dart';
import 'package:kampus_gratis/themes/themes.dart';

class ContentDiscussionGlobalDetail extends StatelessWidget {
  const ContentDiscussionGlobalDetail({
    Key? key,
    required this.controller,
    required this.data,
  }) : super(key: key);

  final DiscussionDetailController controller;
  final DetailDiscussionModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFD9D9D9),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              radius: 20.0,
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20.0),
                  child: data.user!.displayPictureLink != null
                      ? Image.network(
                          '${data.user!.displayPictureLink}',
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
                children: [
                  TextSpan(
                    text: '${data.user!.fullName} - ',
                    style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                  TextSpan(
                    text: 'Student POB',
                    style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
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
              border: Border.all(
                color: const Color(0xFFD9D9D9),
              ),
              color: const Color(0xFFF3F3F3),
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${DateFormat.yMd('id_ID').format(data.createdAt ?? DateTime.now())}, ${DateFormat.jm('id_ID').format(data.createdAt ?? DateTime.now())} WIB',
                  style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${data.title}\n',
                        style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF383838),
                        ),
                      ),
                      TextSpan(
                        text: '${data.content}',
                        style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF383838),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
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
                      isLiked: data.studentLike!
                              .contains(GetStorage().read('student_id'))
                          ? true
                          : false,
                      onTap: (isLiked) async {
                        // controller.putLikeComment(data.comments![index].id!);
                        controller.putLikeDf(data.id!);
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
                      likeCount:
                          data.studentLike!.length + data.teacherLike!.length,
                      countBuilder: (count, isLiked, text) {
                        // var color = isLiked ? const Color(0xFF64748B) : Colors.black;

                        return Text(
                          "$text Suka  ",
                          style:
                              Themes.lightTheme.textTheme.subtitle1!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF64748B),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    Text(
                      // "${data.comments![index - 1].replies!.length} Balasan   ",
                      "23 Balasan   ",
                      style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.setFocusDf(context);
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
      ),
    );
  }
}
