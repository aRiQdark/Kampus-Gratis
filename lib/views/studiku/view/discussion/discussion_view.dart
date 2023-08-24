import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/studiku/discussion_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/studiku/components/discussion_card.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

List listDiscussionCard = [
  [
    "Rohim",
    "10/08/2021   10:30",
    "Matematika",
    "https://picsum.photos/300/100",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
  ],
  [
    "Ikhsan Vengeance",
    "10/08/2021   10:30",
    "Bahasa C++",
    "https://picsum.photos/300/100",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
  ],
  [
    "GMariqq",
    "10/08/2021   10:30",
    "Python",
    "https://picsum.photos/300/100",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
  ],
];

class DiscussionView extends GetView<DiscussionController> {
  const DiscussionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KGAppBar(
        backButton: true,
        title: 'Forum ${Get.arguments[1]} | ${Get.arguments[3]}',
        withIconKG: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.obx((data) => data!.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            '/studiku/discussion/detail',
                            arguments: [
                              data[index].id,
                              controller.studentId.value,
                              Get.arguments[3],
                            ],
                          );
                        },
                        child: DiscussionCard(
                          id: data[index].id!,
                          name: data[index].user!.fullName!,
                          // date: data[index].createdAt.toString(),
                          date:
                              '${DateFormat.yMd('id_ID').format(data[index].createdAt ?? DateTime.now())}, ${DateFormat.jm('id_ID').format(data[index].createdAt ?? DateTime.now())} WIB',
                          title: data[index].title!,
                          desc: data[index].content!,
                          userPicture: data[index].user?.displayPictureLink,
                          isLike: data[index]
                                  .studentLike!
                                  .contains(GetStorage().read('student_id'))
                              ? true
                              : false,
                          studentLike: data[index].studentLike!.length,
                          teacherLike: data[index].teacherLike!.length,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 12);
                    },
                    itemCount: data.length,
                  ),
                )
              : Center(
                  child: Text(
                    'Belum ada Diskusi',
                    style: Themes.lightTheme.textTheme.headline6,
                  ),
                )),
        ],
      ),
    );
  }
}
