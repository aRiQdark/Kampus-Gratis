import 'dart:math' as math;

import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kampus_gratis/controllers/studiku/session_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

import '../../../../widgets/shimmer_loading.dart';

class SessionView extends GetView<SessionStudikuController> {
  const SessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.background,
      appBar: const KGAppBar(
        backButton: true,
        title: 'Studi-Ku',
        withIconKG: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 92,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Get.arguments[2],
                  style: Themes.lightTheme.textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Get.arguments[1],
                  style: Themes.lightTheme.textTheme.headline5!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: controller.obx(
              (state) => ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                itemCount: state?.length,
                itemBuilder: (context, index) {
                  return ExpansionWidget(
                    initiallyExpanded: false,
                    titleBuilder: (double animationValue, _, bool isExpanded,
                        toogleFunction) {
                      return isExpanded
                          ? Card(
                              color: ColorConstants.dropdown,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              margin: EdgeInsets.zero,
                              child: ListTile(
                                  title: Text(
                                    'Pertemuan ${state?[index].sessionNo}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: Transform.rotate(
                                    angle: math.pi * animationValue,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    toogleFunction(animated: true);
                                  }),
                            )
                          : state![index].sessionLock
                              ? Card(
                                  color: ColorConstants.gray100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: ListTile(
                                      title: Text(
                                          'Pertemuan ${state[index].sessionNo}',
                                          style: Themes
                                              .lightTheme.textTheme.subtitle1!
                                              .copyWith(
                                            fontSize: 14,
                                          )),
                                      trailing: const Icon(
                                        Icons.lock,
                                        color: Colors.black,
                                      ),
                                      onTap: () {
                                        null;
                                      }),
                                )
                              : Card(
                                  color: Themes.lightTheme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: ListTile(
                                      title: Text(
                                        'Pertemuan ${state[index].sessionNo}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      trailing: Transform.rotate(
                                        angle: math.pi * animationValue / 2,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onTap: () {
                                        toogleFunction(animated: true);
                                      }),
                                );
                    },
                    content: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 14,
                            ),
                            InkWell(
                              onTap: () {
                                if (state![index].sessionLock != true) {
                                  Get.toNamed(
                                    '/studiku/modul',
                                    arguments: [
                                      state[index].id,
                                      state[index].sessionNo,
                                      Get.arguments[0],
                                    ],
                                  );
                                } else {
                                  Get.defaultDialog(
                                    barrierDismissible: false,
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    title: "Maaf",
                                    titleStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    middleText:
                                        'Selesaikan Session ${state[index].sessionNo - 1}',
                                    middleTextStyle:
                                        const TextStyle(color: Colors.black),
                                  );
                                  Future.delayed(
                                    const Duration(
                                      seconds: 2,
                                    ),
                                    () => Get.back(),
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      'assets/icons/Modul.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Modul',
                                      style:
                                          Themes.lightTheme.textTheme.subtitle1,
                                    ),
                                  ),
                                  state![index].isLocked
                                      ? const SizedBox()
                                      : const Icon(
                                          Icons.check_circle_outlined,
                                          size: 18,
                                          color: Color(0xff24CE09),
                                        )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            InkWell(
                              onTap: () {
                                if (state[index].isLocked == false) {
                                  Get.toNamed(
                                    '/studiku/quiz/description',
                                    arguments: [
                                      state[index].id,
                                      state[index].sessionNo,
                                      Get.arguments[1]
                                    ],
                                  );
                                } else {
                                  Get.defaultDialog(
                                    barrierDismissible: false,
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    title: "Maaf",
                                    titleStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    middleText:
                                        'Selesaikan Modul Terlebih Dahulu',
                                    middleTextStyle:
                                        const TextStyle(color: Colors.black),
                                  );
                                  Future.delayed(
                                    const Duration(
                                      seconds: 2,
                                    ),
                                    () => Get.back(),
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      'assets/icons/quiz.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Quiz',
                                      style:
                                          Themes.lightTheme.textTheme.subtitle1,
                                    ),
                                  ),
                                  state[index].quizDone
                                      ? const Icon(
                                          Icons.check_circle_outlined,
                                          size: 18,
                                          color: Color(0xff24CE09),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            InkWell(
                              onTap: () {
                                if (state[index].isLocked == false) {
                                  Get.toNamed(
                                    '/studiku/discussion',
                                    arguments: [
                                      state[index].id,
                                      Get.arguments[1],
                                      controller.localStorage
                                          .read('student_id'),
                                      state[index].sessionNo,
                                    ],
                                  );
                                  // print(
                                  //     'Get.arguments[1] : ${Get.arguments[1]}');
                                  // print(
                                  //     'state[index].sessionNo : ${state[index].sessionNo}');
                                } else {
                                  Get.defaultDialog(
                                    barrierDismissible: false,
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    title: "Maaf",
                                    titleStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    middleText:
                                        'Selesaikan Modul Terlebih Dahulu',
                                    middleTextStyle:
                                        const TextStyle(color: Colors.black),
                                  );
                                  Future.delayed(
                                    const Duration(
                                      seconds: 2,
                                    ),
                                    () => Get.back(),
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      'assets/icons/fordis.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Forum Diskusi',
                                    style:
                                        Themes.lightTheme.textTheme.subtitle1,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            InkWell(
                              onTap: () {
                                if (state[index].isLocked == false) {
                                  Get.toNamed(
                                    '/studiku/assignment/detail/',
                                    arguments: [state[index].id],
                                  );
                                } else {
                                  Get.defaultDialog(
                                    barrierDismissible: false,
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    title: "Maaf",
                                    titleStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    middleText:
                                        'Selesaikan Modul Terlebih Dahulu',
                                    middleTextStyle:
                                        const TextStyle(color: Colors.black),
                                  );
                                  Future.delayed(
                                    const Duration(
                                      seconds: 2,
                                    ),
                                    () => Get.back(),
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      'assets/icons/tugas.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Tugas',
                                      style:
                                          Themes.lightTheme.textTheme.subtitle1,
                                    ),
                                  ),
                                  state[index].assignmentDone
                                      ? const Icon(
                                          Icons.check_circle_outlined,
                                          size: 18,
                                          color: Color(0xff24CE09),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              onLoading: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: const ShimmerLoading(),
                  );
                },
                itemCount: 8,
              ),
              onError: (error) {
                return Container(
                  height: Get.height,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Error.png',
                        fit: BoxFit.cover,
                        height: 100,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Maaf sepertinya terdapat kesalahan $error, silahkan refresh halaman ini',
                          style: Themes.lightTheme.textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
