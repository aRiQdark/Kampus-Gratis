import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus_gratis/controllers/discussion_global/discussion_global_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:like_button/like_button.dart';

class DiscussionGlobalCard extends StatelessWidget {
  final String id;
  final String name;
  final String date;
  final String title;
  final String desc;
  final String? userPicture;
  final int teacherLike;
  final int studentLike;
  final bool isLike;
  final DiscussionGlobalController controller;

  const DiscussionGlobalCard({
    Key? key,
    required this.id,
    required this.name,
    required this.date,
    required this.title,
    required this.desc,
    this.userPicture,
    required this.teacherLike,
    required this.studentLike,
    required this.isLike,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23, 0, 23, 13),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              radius: 20.0,
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20.0),
                  child: userPicture != null
                      ? Image.network(
                          '$userPicture',
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
                    text: '$name - ',
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF3F3F3),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
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
                        text: '$title\n',
                        style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF383838),
                        ),
                      ),
                      TextSpan(
                        text: '$title\n',
                        style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF383838),
                        ),
                      ),
                    ],
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
                      isLiked: isLike,
                      // studentLike.contains(Get.arguments[1]) ? true : false,
                      onTap: (isLiked) async {
                        // controller.putLikeComment(data.comments![index - 1].id!);
                        controller.putLikeDf(id);
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
                      likeCount: studentLike + teacherLike,
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
                        // controller.setFocus(
                        //   context,
                        //   data.comments![index - 1].user!.fullName!,
                        // );
                        // controller.setReplyComment(
                        //   data.comments![index - 1].id!,
                        // );
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
