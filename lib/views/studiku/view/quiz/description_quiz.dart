import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/widgets/dialog.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';

class DescriptionQuizView extends GetView<QuizController> {
  const DescriptionQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: ColorConstants.mainBlue,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ColorConstants.mainBlue,
                  statusBarBrightness: Brightness.dark),
              automaticallyImplyLeading: false,
              elevation: 0.0,
              toolbarHeight: 78,
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  )),
              title: const Text(
                ('Quiz Pertemuan'),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffF3F3F3)),
              ),
              centerTitle: true,
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/background-quiz-main.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        }, body: Obx(
          () {
            if (controller.isLoading.isTrue) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                Text(
                  '${controller.dataDescriptionQuiz.value?.quiz.description}',
                ),
                const SizedBox(height: 32.0),
                controller.maxAttempts.value
                    ? SizedBox(
                        width: 200.0,
                        child: ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(12.0),
                                backgroundColor: const Color(0xffE5E5E5),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(100.0))),
                            child: const Text(
                              'Kesempatan habis',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff383838)),
                            )),
                      )
                    : SizedBox(
                        width: 200.0,
                        child: ElevatedButton(
                          onPressed: () => showDialog(
                              context: context,
                              builder: (context) => KGDialog(
                                    filePath:
                                        'assets/icons/exclamation_sign.svg',
                                    imageHeight: 50.0,
                                    imageWidth: 50.0,
                                    title: 'Yakin ingin memulai?',
                                    middleText:
                                        'Anda tidak bisa keluar halaman setelah ini jika belum menyelesaikan semua pertanyaan yang diberikan.',
                                    actionsDirection:
                                        ActionsDirection.horizontal,
                                    textConfirm: 'Mulai',
                                    onConfirm: () async {
                                      Get.back();
                                      Get.toNamed(
                                        'studiku/quiz',
                                        arguments: [
                                          controller.dataDescriptionQuiz.value
                                              ?.quiz.id,
                                          Get.arguments[2],
                                          Get.arguments[0]
                                        ],
                                      );
                                      await controller.takeQuizByIdQuiz(
                                          controller.dataDescriptionQuiz.value!
                                              .quiz.id);
                                    },
                                    textCancel: 'Nanti',
                                    onCancel: () => Get.back(),
                                  )),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              backgroundColor: ColorConstants.mainBlue,
                              minimumSize: const Size(235, 41)),
                          child: const Text(
                            'Mulai Quiz',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 200.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.dataDescriptionQuiz.value?.summary ==
                          null) {
                        KGSnackBar.showKGSnackBar(
                            context, 'Tidak ada riwayat quiz');
                      }

                      if (controller
                          .dataDescriptionQuiz.value!.summary!.isEmpty) {
                        KGSnackBar.showKGSnackBar(
                            context, 'Tidak ada riwayat quiz');
                      } else {
                        Get.toNamed(
                          '/studiku/quiz/historyQuiz',
                          arguments: [
                            controller.dataDescriptionQuiz.value?.quiz.id,
                            Get.arguments[2],
                            Get.arguments[0]
                          ],
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: const Color(0xffFDB415),
                        minimumSize: const Size(100, 41)),
                    child: const Text(
                      'Riwayat Quiz',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            );
          },
        )));
  }
}
