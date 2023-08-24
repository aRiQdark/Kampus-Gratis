import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/studiku/discussion_detail_controller.dart';
import 'package:kampus_gratis/models/studiku/discussion_detail_model.dart';
import 'package:kampus_gratis/themes/themes.dart';

class ContentDiscussionDetail extends StatelessWidget {
  const ContentDiscussionDetail({
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
      child: Column(
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
            title: Text(
              data.title!,
              style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF64748B),
              ),
            ),
            subtitle: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Post - ',
                    style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                  TextSpan(
                    text: '${data.user!.fullName}\n',
                    style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF106FA4),
                    ),
                  ),
                  TextSpan(
                    text:
                        '${DateFormat.yMd('id_ID').format(data.createdAt ?? DateTime.now())}, ${DateFormat.jm('id_ID').format(data.createdAt ?? DateTime.now())} WIB',
                    style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF64748B),
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
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              data.content!,
              style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                controller.setFocusDf(context);
              },
              child: Text(
                'Reply',
                style: Themes.lightTheme.textTheme.headline6!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF106FA4)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            height: 8,
            thickness: 2,
            color: Color(0xFFE5E5E5),
          ),
        ],
      ),
    );
  }
}
