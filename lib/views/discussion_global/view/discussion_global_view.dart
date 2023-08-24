import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/controllers/discussion_global/discussion_global_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/discussion_global/components/discussion_global_card.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class DiscussionGlobalView extends GetView<DiscussionGlobalController> {
  const DiscussionGlobalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
        backButton: true,
        title: 'Forum Diskusi Global',
        withIconKG: true,
      ),
      body: controller.obx(
        (data) => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.8,
                      child: TextFormField(
                        // validator: validator,
                        // controller: controller,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                            ),
                          ),
                          // filled: true,
                          // fillColor:
                          //     Get.isDarkMode ? ColorConstants.gray200 : Colors.white,
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                          prefixIcon: SvgPicture.asset(
                            'assets/icons/search.svg',
                            fit: BoxFit.scaleDown,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Pencarian',
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset('assets/icons/filter_df.svg'),
                    ),
                  ],
                ),
              );
            }

            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  '/studiku/discussion_global/detail',
                  arguments: [
                    data![index - 1].id,
                    GetStorage().read('student_id'),
                    null,
                  ],
                );
                // print('student_id : ${GetStorage().read('student_id')}');
              },
              child: DiscussionGlobalCard(
                id: data![index - 1].id!,
                name: data[index - 1].user!.fullName!,
                date:
                    '${DateFormat.yMd('id_ID').format(data[index - 1].createdAt ?? DateTime.now())}, ${DateFormat.jm('id_ID').format(data[index - 1].createdAt ?? DateTime.now())} WIB',
                title: data[index - 1].title!,
                desc: data[index - 1].content!,
                teacherLike: data[index - 1].teacherLike!.length,
                studentLike: data[index - 1].studentLike!.length,
                isLike: data[index - 1]
                        .studentLike!
                        .contains(GetStorage().read('student_id'))
                    ? true
                    : false,
                controller: controller,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 2,
              color: Color(0xFFF3F3F3),
            );
          },
          itemCount: data!.length + 1,
        ),
        onEmpty: Center(
          child: Text(
            'Belum ada Diskusi',
            style: Themes.lightTheme.textTheme.headline6,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFEE2D24),
        onPressed: () {
          Get.toNamed('/discussion_global/add');
        },
        child: SvgPicture.asset(
          'assets/icons/pencil.svg',
        ),
      ),
    );
  }
}
